# Tetris en ensamblador MIPS (MARS)

Proyecto II del curso EIF205 Arquitectura de Computadoras, Universidad Nacional.
Integrantes: Keilor Baltodano, Andrey y Jorge.

Es una versión de Tetris escrita en ensamblador MIPS32 para el simulador MARS 4.5. Usa el **Bitmap Display** para la pantalla y el **Keyboard and Display MMIO Simulator** para el teclado.

## Características

- Tablero de 10 × 20 celdas, con siete piezas y sus cuatro rotaciones.
- Estados del juego: menú, juego, pausa, fin del juego y victoria.
- Diez niveles: se sube un nivel cada 5 líneas y la caída se acelera de 1000 ms a 120 ms. Se gana al completar el nivel 10.
- Puntaje clásico: 100, 300, 500 u 800 puntos por 1, 2, 3 o 4 líneas a la vez, multiplicado por el nivel.
- Caída instantánea y rotación con corrimiento contra la pared (wall kick).
- Vista previa de la pieza siguiente, un color por pieza, y puntaje, récord, nivel y líneas en pantalla.
- Doble búfer de dibujo, para que la pantalla no parpadee.

## Cómo ejecutarlo

1. Abrir **solo `main.asm`** en MARS 4.5. Los demás archivos se incluyen solos con `.include` y deben estar en la misma carpeta.
2. Ir a **Tools → Bitmap Display** y configurar:
   - Unit Width / Unit Height: **8**
   - Display Width / Display Height: **256**
   - Base address: **0x10008000 ($gp)**
   - Luego pulsar **Connect to MIPS**.
3. Ir a **Tools → Keyboard and Display MMIO Simulator** y pulsar **Connect to MIPS**.
4. Ensamblar (**F3**) y ejecutar (**▶**).
5. Hacer clic en el área inferior del MMIO Simulator (KEYBOARD) y jugar desde ahí.

> Si un archivo se modificó fuera de MARS, hay que cerrar su pestaña sin guardar y volver a abrirlo antes de ensamblar.

## Controles

| Tecla | Acción |
|---|---|
| A / D | Mover a la izquierda / derecha |
| S | Bajar una fila |
| W | Rotar (con corrimiento contra la pared) |
| Espacio | Caída instantánea |
| P | Pausar / reanudar |
| R | Reiniciar (en fin del juego o victoria) |
| Q | Salir |
| Cualquier tecla | Empezar desde el menú |

El Keyboard MMIO de MARS no entrega las flechas, por eso se usan W, A, S y D. Además, guarda una sola tecla por lectura, así que conviene pulsar las teclas de una en una.

## Estructura del código

| Archivo | Responsable | Contenido |
|---|---|---|
| `main.asm` | Keilor | Punto de entrada, `.include` y bucle principal que despacha según `ESTADO`. |
| `datos.asm` | Keilor | Constantes `.eqv` y variables globales. |
| `nucleo.asm` | Keilor | Teclado, estados, gravedad, niveles, pieza siguiente, cierre de jugada y reinicio (prefijo `nuc_`). |
| `logica.asm` | Andrey | Colisiones, fijación, líneas, puntaje, caída instantánea y wall kick (prefijo `log_`). |
| `piezas.asm` | Andrey | Formas y rotaciones de las piezas. |
| `macros.asm` | Jorge | Macros de pila y de dibujo. |
| `graficos.asm` | Jorge | Doble búfer, tablero, HUD y pantallas (prefijo `gfx_`). |
| `fuente.asm` | Jorge | Fuente de 3 × 5 para el texto. |

La carpeta `andrey/` contiene las pruebas automáticas de la lógica (235 escenarios), sus evidencias y la bitácora detallada de ese módulo.

## Constantes útiles para la demostración

En `datos.asm`, `NIVEL_MAX` y `LINEAS_POR_NIVEL` controlan la cantidad de niveles y las líneas que se necesitan por nivel. Si se ponen ambos en `1`, la pantalla de victoria aparece al borrar una línea.

## Créditos

El proyecto parte del repositorio público **tetris_mips_asm** (GitHub), que el profesor autorizó como base. Sobre esa base, el equipo hizo lo siguiente:
- la separación en módulos;
- la máquina de estados, los niveles, el puntaje y las nuevas mecánicas;
- la corrección de errores de registros y pila;
- la interfaz en español.

Simulador: MARS 4.5, de K. Vollmar y P. Sanderson (Missouri State University).
