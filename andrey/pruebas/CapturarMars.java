// Exports the real MARS 4.5 GUI after existing test calls; never edits MIPS state.
// Uses Swing printAll, not a desktop screenshot, so a blank desktop cannot hide MARS.
// Requires a graphical session, the MARS JAR and Java 8 or later.
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.time.*;
import java.util.*;
import javax.imageio.ImageIO;
import javax.swing.*;
import mars.*;
import mars.mips.hardware.RegisterFile;
import mars.venus.*;

public final class CapturarMars {
    private static VenusUI gui;
    private static RunGoAction go;
    private static File root, output;
    private static int captured, limit;

    // Columns: image stem, case number, target procedure, call occurrence, memory offset.
    // Cases remain in execution order, so the original suites run without skipping setup.
    private static final String[][] STAGE1 = {
        {"P01_inicializacion", "1", "initialize_playfield", "1", "-4"},
        {"P01_extremo_inferior", "1", "initialize_playfield", "1", "704"},
        {"P12_fila_superior", "2", "clear_top_row", "1", "-4"},
        {"P02_pared_izquierda", "4", "check_collision", "1", "0"},
        {"P02_pared_derecha", "6", "check_collision", "1", "0"},
        {"P03_piso", "8", "check_collision", "1", "704"},
        {"P03_limite_superior", "9", "check_collision", "1", "-4"},
        {"P04_aparicion_bloqueada", "22", "check_collision", "1", "0"},
        {"P05_fijacion_rechazada", "24", "freeze_piece", "1", "0"},
        {"P11_desplazamiento_ids", "33", "shift_rows_down", "1", "0"},
        {"P10_una_linea", "34", "check_and_clear_lines", "1", "0"},
        {"P10_dos_lineas", "35", "check_and_clear_lines", "1", "0"},
        {"P10_tres_lineas", "36", "check_and_clear_lines", "1", "0"},
        {"P10_cuatro_lineas", "37", "check_and_clear_lines", "1", "0"},
        {"P15_registros_pila", "42", "update_high_score", "1", "-68"}
    };
    private static final String[][] STAGE2 = {
        {"P05_ids", "28", "freeze_piece", "1", "120"},
        {"P13_puntaje_nivel3", "44", "log_update_score", "1", "-68"},
        {"P13_puntaje_nivel10", "81", "log_update_score", "1", "-68"}
    };
    private static final String[][] STAGE3 = {
        {"P08_caida_obstaculo", "30", "log_hard_drop", "1", "80"},
        {"P09_distancia_cero", "31", "log_hard_drop", "1", "704"},
        {"P09_repeticion", "33", "log_hard_drop", "2", "704"},
        {"P06_kick_izquierda", "62", "log_rotate_with_kick", "1", "0"},
        {"P06_kick_derecha", "63", "log_rotate_with_kick", "1", "0"},
        {"P07_prioridad", "64", "log_rotate_with_kick", "1", "0"},
        {"P07_rotacion_cancelada", "66", "log_rotate_with_kick", "1", "0"},
        {"P14_caida_fijada", "89", "log_hard_drop", "1", "640"},
        {"P14_lineas_borradas", "89", "check_and_clear_lines", "1", "640"},
        {"P14_finalizacion_unica", "89", "log_update_score", "1", "-68"}
    };

    public static void main(String[] args) {
        try {
            root = new File(args[0]).getCanonicalFile();
            output = new File(root, "andrey/evidencias/capturas");
            Files.createDirectories(output.toPath());
            limit = args.length > 1 ? Integer.parseInt(args[1]) : 0;
            Globals.initialize(true);
            Globals.getSettings().setBooleanSettingNonPersistent(Settings.DELAYED_BRANCHING_ENABLED, false);
            Globals.getSettings().setBooleanSettingNonPersistent(Settings.ASSEMBLE_ALL_ENABLED, false);
            Globals.getSettings().setBooleanSettingNonPersistent(Settings.ASSEMBLE_ON_OPEN_ENABLED, false);
            Globals.getSettings().setBooleanSettingNonPersistent(Settings.START_AT_MAIN, true);
            Globals.getSettings().setBooleanSettingNonPersistent(Settings.DISPLAY_VALUES_IN_HEX, false);
            edt(() -> {
                gui = new VenusUI("MARS 4.5 - Andrey: evidencias reales");
                Dimension screen = Toolkit.getDefaultToolkit().getScreenSize();
                gui.setBounds(0, 0, screen.width, screen.height - 48);
                gui.setAlwaysOnTop(true);
                go = new RunGoAction("Go", null, "Run existing suite", null, null, gui);
                setSpeedToUnlimited(gui);
            });
            if (args.length > 2 && !args[2].isEmpty()) {
                if (new File(args[2]).getName().equals("cruce_graficos.asm")) crossGraphics();
                else currentReference(new File(args[2]));
            } else {
                suite("etapa1.asm", STAGE1, 4580);
                if (!atLimit()) suite("etapa2.asm", STAGE2, 12311);
                if (!atLimit()) suite("etapa3.asm", STAGE3, 21020);
                if (!atLimit()) crossGraphics();
            }
            System.out.println("Real MARS screenshots saved: " + captured);
            edt(() -> gui.dispose());
            System.exit(0);
        } catch (Throwable error) {
            error.printStackTrace();
            if (gui != null) gui.dispose();
            System.exit(1);
        }
    }

    private static boolean atLimit() { return limit > 0 && captured >= limit; }
    private static void edt(Runnable action) throws Exception { SwingUtilities.invokeAndWait(action); }

    // Select the actual speed slider instead of changing simulator internals.
    private static void setSpeedToUnlimited(Container container) {
        for (Component child : container.getComponents()) {
            if (child instanceof JSlider) ((JSlider) child).setValue(((JSlider) child).getMaximum());
            if (child instanceof Container) setSpeedToUnlimited((Container) child);
        }
    }

    private static void assemble(String file) throws Exception {
        assembleFile(new File(root, "andrey/pruebas/" + file));
    }

    private static void assembleFile(File file) throws Exception {
        edt(() -> {
            EditTabbedPane tabs = (EditTabbedPane) gui.getMainPane().getEditTabbedPane();
            if (!tabs.openFile(file))
                throw new IllegalStateException("Cannot open " + file);
            gui.getMessagesPane().getRunTextArea().setText("");
            gui.getMessagesPane().getAssembleTextArea().setText("");
            gui.getRunAssembleAction().actionPerformed(null);
            if (!FileStatus.isAssembled()) throw new IllegalStateException("Assembly failed: " + file);
            ExecutePane pane = gui.getMainPane().getExecutePane();
            pane.setLabelWindowVisibility(false);
            pane.getValueDisplayBaseChooser().setBase(10);
            pane.numberDisplayBaseChanged(pane.getValueDisplayBaseChooser());
        });
    }

    private static void suite(String file, String[][] shots, int assertions) throws Exception {
        assemble(file);
        for (String[] shot : shots) {
            if (atLimit()) break;
            int address = returnAddress(Integer.parseInt(shot[1]), shot[2], Integer.parseInt(shot[3]));
            if (RegisterFile.getProgramCounter() != address) runUntil(address);
            if (RegisterFile.getProgramCounter() != address)
                throw new IllegalStateException("Did not reach " + Arrays.toString(shot));
            capture(file, shot, address);
        }
        runUntil(-1);
        final String[] text = new String[1];
        edt(() -> text[0] = gui.getMessagesPane().getRunTextArea().getText());
        String console = text[0];
        if (!console.contains("PASS assertions: " + assertions))
            throw new IllegalStateException("Suite did not pass: " + console);
        Files.write(new File(output, file + ".consola.txt").toPath(), (console.trim() + "\n").getBytes(StandardCharsets.UTF_8));
        System.out.println(file + ": PASS assertions: " + assertions);
    }

    private static int symbol(String name) {
        int address = Globals.program.getLocalSymbolTable().getAddressLocalOrGlobal(name);
        if (address == -1) throw new IllegalArgumentException("Missing symbol: " + name);
        return address;
    }

    private static int returnAddress(int testCase, String target, int occurrence) {
        String label = String.format(Locale.ROOT, "log_test_case_%03d", testCase);
        int first = symbol(label);
        int last = Globals.program.getLocalSymbolTable().getAddressLocalOrGlobal(
            String.format(Locale.ROOT, "log_test_case_%03d", testCase + 1));
        if (last == -1) last = Integer.MAX_VALUE;
        for (Object item : Globals.program.getMachineList()) {
            ProgramStatement statement = (ProgramStatement) item;
            if (statement.getAddress() < first || statement.getAddress() >= last) continue;
            String source = statement.getSource().split("#", 2)[0].trim();
            if (source.matches("jal\\s+" + target) && --occurrence == 0)
                return statement.getAddress() + 4;
        }
        throw new IllegalArgumentException("Call not found in " + label + ": " + target);
    }

    private static void runUntil(int address) throws Exception {
        edt(() -> {
            TextSegmentWindow text = gui.getMainPane().getExecutePane().getTextSegmentWindow();
            text.clearAllBreakpoints();
            if (address != -1) {
                try {
                    Field field = TextSegmentWindow.class.getDeclaredField("table");
                    field.setAccessible(true);
                    JTable table = (JTable) field.get(text);
                    boolean found = false;
                    for (int row = 0; row < table.getRowCount(); row++) {
                        if (mars.util.Binary.stringToInt(table.getValueAt(row, 1).toString()) == address) {
                            table.setValueAt(Boolean.TRUE, row, 0);
                            found = true;
                            break;
                        }
                    }
                    if (!found) throw new IllegalStateException("Breakpoint address absent");
                } catch (ReflectiveOperationException failure) { throw new RuntimeException(failure); }
            }
            RunGoAction.maxSteps = 2000000;
            go.actionPerformed(null);
        });
        long deadline = System.currentTimeMillis() + 30000;
        while (true) {
            Thread.sleep(30);
            final int[] status = new int[1];
            edt(() -> status[0] = FileStatus.get());
            if (address == -1 && status[0] == FileStatus.TERMINATED) break;
            if (address != -1 && status[0] == FileStatus.RUNNABLE && RegisterFile.getProgramCounter() == address) break;
            if (address != -1 && status[0] == FileStatus.TERMINATED)
                throw new IllegalStateException("Execution ended before the requested breakpoint");
            if (System.currentTimeMillis() > deadline) throw new IllegalStateException("MARS timed out");
        }
    }

    private static int word(String name) throws Exception { return Globals.memory.getWord(symbol(name)); }

    private static void capture(String file, String[] shot, int pc) throws Exception {
        int board = symbol("PLAYFIELD");
        String time = ZonedDateTime.now(ZoneId.of("America/Guatemala")).toString();
        String context = time + " | " + file + " | caso " + shot[1] + " | despues de " + shot[2];
        String values = "PC=" + String.format("0x%08x", pc)
            + " v0=" + RegisterFile.getValue(2) + " v1=" + RegisterFile.getValue(3)
            + " a1=" + RegisterFile.getValue(5) + " a2=" + RegisterFile.getValue(6);
        String state = "X=" + word("CURRENT_PIECE_X") + " Y=" + word("CURRENT_PIECE_Y")
            + " tipo=" + word("CURRENT_PIECE_TYPE") + " orientacion=" + word("CURRENT_PIECE_ORIENTATION")
            + " SCORE=" + word("SCORE") + " LINES=" + word("LINES_CLEARED") + " HIGH=" + word("HIGH_SCORE");
        String guards = "PLAYFIELD=" + String.format("0x%08x", board)
            + " centinelas=" + word("log_test_guard_before") + "/" + word("log_test_guard_after");
        StringBuilder dump = new StringBuilder(context + "\n" + values + "\n" + state + "\n" + guards + "\n");
        dump.append("Capture method: JFrame.printAll export of actual MARS components after execution.\n");
        dump.append("This is a window-view export, not a desktop screenshot; no values or pixels are retouched.\n");
        for (int reg = 0; reg < 32; reg++) dump.append("r").append(reg).append('=').append(RegisterFile.getValue(reg)).append('\n');
        dump.append("saved_sp=").append(word("log_test_saved_sp")).append('\n');
        for (int row = 0; row < 20; row++) {
            dump.append("row ").append(row).append(':');
            for (int col = 0; col < 10; col++) dump.append(' ').append(Globals.memory.getWord(board + 4 * (row * 10 + col)));
            dump.append('\n');
        }
        Files.write(new File(output, shot[0] + ".txt").toPath(), dump.toString().getBytes(StandardCharsets.UTF_8));
        edt(() -> {
            gui.getMessagesPane().getAssembleTextArea().setText(context + "\n" + values + "\n" + state + "\n" + guards + "\n");
            gui.getMessagesPane().selectMarsMessageTab();
            gui.getMainPane().getExecutePane().getDataSegmentWindow().updateModelForMemoryRange(board + Integer.parseInt(shot[4]));
            gui.toFront();
        });
        screen(shot[0]);
    }

    private static void crossGraphics() throws Exception {
        assemble("cruce_graficos.asm");
        runUntil(-1);
        final String[] text = new String[1];
        edt(() -> text[0] = gui.getMessagesPane().getRunTextArea().getText());
        String actual = text[0];
        if (!actual.contains("XJ01") || !actual.contains("XJ02")) throw new IllegalStateException(actual);
        Files.write(new File(output, "P16_cruce_graficos.txt").toPath(), (actual.trim() + "\n").getBytes(StandardCharsets.UTF_8));
        edt(() -> gui.getMessagesPane().selectRunMessageTab());
        screen("P16_cruce_graficos");
        System.out.println(actual.trim());
    }

    private static void currentReference(File wrapper) throws Exception {
        assembleFile(wrapper);
        runUntil(-1);
        final String[] console = new String[1];
        edt(() -> console[0] = gui.getMessagesPane().getRunTextArea().getText());
        if (!console[0].contains("XR_SUMMARY checks=43")) throw new IllegalStateException(console[0]);
        String context = "Export: " + ZonedDateTime.now(ZoneId.of("America/Guatemala"))
            + "\nSource wrapper: " + wrapper.getCanonicalPath()
            + "\nMethod: JFrame.printAll; real MARS execution, not a desktop screenshot.\n\n";
        for (String stem : new String[]{"P17_graficos_actuales", "P18_contratos_actuales"})
            Files.write(new File(output, stem + ".txt").toPath(), (context + console[0].trim() + "\n").getBytes(StandardCharsets.UTF_8));
        edt(() -> {
            enlargeMessages(gui);
            gui.getMessagesPane().selectRunMessageTab();
            gui.getMessagesPane().getRunTextArea().setCaretPosition(0);
        });
        screen("P17_graficos_actuales");
        edt(() -> gui.getMessagesPane().getRunTextArea().setCaretPosition(console[0].length()));
        screen("P18_contratos_actuales");
        System.out.println(console[0].trim());
    }

    private static void enlargeMessages(Container container) {
        for (Component child : container.getComponents()) {
            if (child instanceof JSplitPane && ((JSplitPane) child).getOrientation() == JSplitPane.VERTICAL_SPLIT)
                ((JSplitPane) child).setDividerLocation(0.30);
            if (child instanceof Container) enlargeMessages((Container) child);
        }
    }

    private static void screen(String name) throws Exception {
        final BufferedImage[] pixels = new BufferedImage[1];
        edt(() -> {
            gui.validate();
            pixels[0] = new BufferedImage(gui.getWidth(), gui.getHeight(), BufferedImage.TYPE_INT_RGB);
            Graphics2D graphics = pixels[0].createGraphics();
            try { gui.printAll(graphics); } finally { graphics.dispose(); }
        });
        ImageIO.write(pixels[0], "png", new File(output, name + ".png"));
        captured++;
        System.out.println("Captured " + name);
    }
}
