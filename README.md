# tetris_mips_asm

Un juego **estilo Tetris** completamente funcional, escrito en **ensamblador MIPS** para el simulador **MARS**.
Utiliza las herramientas Bitmap Display y Keyboard MMIO para los gráficos y la entrada de teclado. Incluye un sistema de puntuación, un récord que se conserva durante cada ejecución, aumentos de velocidad al eliminar líneas y una pantalla de fin de partida con opción de reintentar.

## Características

- **Área de juego:** cuadrícula virtual de 16×32 celdas dibujada en una pantalla de 32×32 celdas (cada celda = 8×8 píxeles)
- **Siete tetrominós (I, J, L, O, S, T, Z)** con tablas de rotación (0–3)
- **Controles WASD**, **Q para salir** y **R para reintentar** al terminar la partida
- **Caída suave** (`S`) y **rotación segura** (`W`; se impide la rotación si provoca una colisión)
- **Eliminación de líneas** con desplazamiento hacia abajo de las filas superiores
- **Puntuación** (1 punto por línea eliminada) y **récord** visibles en el panel lateral
- **Temporizador de gravedad** con aceleración: el intervalo disminuye 300 ms cada `LINES_PER_LEVEL` líneas (hasta llegar a `MIN_GRAVITY`)
- **Texto y números de la interfaz** dibujados con una fuente compacta de 3×5 píxeles (dígitos y letras necesarias)

---

## Controles

| Tecla | Acción                                         |
| ----- | ---------------------------------------------- |
| **A** | Mover a la izquierda                           |
| **D** | Mover a la derecha                             |
| **S** | Caída suave (una fila)                          |
| **W** | Rotar en sentido horario                       |
| **Q** | Salir                                          |
| **R** | Reintentar desde la pantalla de fin de partida  |

> **No** se utilizan las teclas de flecha; la entrada se recibe como caracteres ASCII mediante MMIO.

---

## Requisitos

- **MARS** (MIPS Assembler and Runtime Simulator); se recomienda la versión 4.5 o posterior.
  (Utiliza las llamadas al sistema de MARS: **30** = tiempo actual en ms, **32** = pausa en ms, **42** = entero aleatorio dentro de un rango).
- Herramientas **Bitmap Display** y **Keyboard & Display MMIO** habilitadas y conectadas.

---

## Instrucciones de ejecución (MARS)

1. **Abre el archivo `.asm`** en MARS.
2. Abre **Tools → Bitmap Display** y configura:

   - Ancho y alto de cada unidad (Unit width/height): **8**.
   - Ancho y alto de la pantalla (Display width/height): **256 × 256**.
   - Dirección base (Base address): **`0x10008000`**.
   - Haz clic en **Connect to MIPS**.

3. Abre **Tools → Keyboard and Display MMIO Simulator**.

   - Haz clic en **Connect to MIPS**.

4. **Ensambla** el programa con **Assemble** (F3) y **ejecútalo** con **Run** (F5).
   Deberías ver el tablero, las paredes y los paneles laterales (Next/Score/HI: siguiente pieza, puntuación y récord). Utiliza **WASD** para jugar.

---

## Entrada/salida mapeada en memoria

Estas direcciones se configuran al inicio del programa y se pueden modificar:

```asm
ADDR_DSPL: .word 0x10008000   # Dirección base de Bitmap Display de MARS
ADDR_KBRD: .word 0xffff0000   # Teclado MMIO (estado en +0, datos en +4)
```

**Teclado MMIO:**

- `0xFFFF0000` — estado (distinto de cero si hay una tecla disponible)
- `0xFFFF0004` — código ASCII de la última tecla

---

## Modelo de color y pantalla

- Formato de color: **`0x00RRGGBB`**.
- La pantalla es una **cuadrícula de 32×32 celdas** (256×256 píxeles, con 8×8 píxeles por celda).
- El área de juego ocupa **16×32** celdas y comienza a **3** celdas del borde izquierdo (paredes en las columnas 2 y 19).
- Los paneles laterales (Next / Score / HI) se encuentran a la derecha.

Principales constantes de color (ejemplos):

```asm
COLOR_BG_GRAY_LIGHT: .word 0x00606060
COLOR_BG_GREY_DARK:  .word 0x00202020
COLOR_BG_WALL:       .word 0x00ffee00
COLOR_FROZEN_BLOCK:  .word 0x0022c55e
COLOR_I:             .word 0x0000ffff  # cian
...
COLOR_TEXT_ORANGE:   .word 0x00FF8800
```

---

## Constantes del juego (ajustables)

```asm
LINES_PER_LEVEL: .word 1     # Líneas necesarias para acelerar (5 para un ritmo clásico)
GRAVITY_INTERVAL: .word 1000 # Intervalo inicial entre caídas por gravedad (ms)
MIN_GRAVITY: .word 100       # Intervalo mínimo entre caídas por gravedad (ms)
```

**Regla de aceleración:** cada vez que `LINES_CLEARED % LINES_PER_LEVEL == 0`,
se aplica `GRAVITY_INTERVAL -= 300`, sin reducir el intervalo por debajo de `MIN_GRAVITY`.

---

## Descripción general del código

- **`main`**
  Inicializa el área de juego, dibuja la escena, configura el temporizador de gravedad, genera la primera pieza y entra en `game_loop`.

- **`game_loop`**
  Dibuja la escena estática y los bloques fijados, dibuja el tetrominó activo, muestra **Score** y **HI**, ejecuta `handle_input` y `apply_gravity`, y realiza una breve pausa.

- **Dibujo**

  - `draw_scene` dibuja el fondo, las paredes y los paneles laterales, y recorre `PLAYFIELD` para dibujar los bloques fijados.
  - `draw_tetromino` dibuja la pieza activa en `(CURRENT_PIECE_X, CURRENT_PIECE_Y)` mediante su tabla de rotación actual.
  - `draw_digit`, `draw_string` y `draw_char` dibujan los caracteres de la fuente de 3×5 píxeles para la interfaz (puntuación, “GAME OVER”, “RETRY (R)”, “HI”).

- **Entrada de teclado** (`handle_input`)
  Lee el teclado MMIO y aplica el movimiento o la rotación si **no hay colisión** en la posición propuesta.

- **Gravedad** (`apply_gravity`)
  Utiliza la llamada al sistema 30 (tiempo) para hacer descender la pieza automáticamente cada `GRAVITY_INTERVAL` ms; si no puede descender, llama a `freeze_piece`, `check_and_clear_lines` y `spawn_new_piece`.

- **Colisiones y fijación de piezas**

  - `check_collision` comprueba los límites (paredes y suelo) y las colisiones con los bloques de `PLAYFIELD`.
  - `freeze_piece` guarda los bloques del tetrominó activo en `PLAYFIELD`.

- **Eliminación de líneas** (`check_and_clear_lines`)
  Recorre las filas de abajo hacia arriba, elimina las líneas completas, llama a `shift_rows_down`, incrementa `SCORE` y `LINES_CLEARED`, y actualiza la velocidad mediante `update_speed`.
  La fila 0 recibe un tratamiento especial mediante `clear_top_row`.

- **Récord y fin de partida**

  - `update_high_score` compara la puntuación actual (`SCORE`) con `HIGH_SCORE`.
  - `spawn_new_piece` comprueba si hay una colisión inmediata (si la pieza no puede aparecer, la partida termina).
  - `game_over_loop` dibuja la pantalla **GAME / OVER / RETRY (R)** y espera a que se pulse **R** (reiniciar) o **Q** (salir).
  - `restart_game` restablece el estado del juego y limpia el área de juego.

---

## Tablas de datos

- **Tablas de rotación:** `ROTATIONS_I`, `ROTATIONS_J`, …; cada una apunta a 4 definiciones de forma (la pieza O repite la misma forma).
- **Formas:** `SHAPE_*_*` almacena las posiciones relativas (x, y) de los 4 bloques para cada rotación.
- **Colores:** `ALL_COLORS_TABLE` asocia cada tipo de pieza con su color.
- **Área de juego:** `PLAYFIELD` es un búfer de **512 palabras** (`16 × 32`, `.space 2048` bytes).
- **Fuentes:** `FONT_TABLE` contiene los dígitos del 0 al 9; también hay caracteres individuales para las letras A, E, G, H, I, M, O, R, T, V, Y, los paréntesis y el espacio.

## Agradecimientos

- Se ejecuta en el excelente simulador **MARS**.
- Inspirado en la mecánica clásica de Tetris; esta versión educativa se centra en un flujo de control claro en MIPS, el uso de MMIO y el dibujo a partir de tablas de datos.
