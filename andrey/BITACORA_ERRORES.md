# Bitácora de errores — coordinación de Andrey

Fecha de registro: **2026-10-31**. Los estados describen el código revisado y las ejecuciones registradas en [las evidencias](evidencias/resultados_mars.txt). No se ejecutó la versión original para reproducir cada riesgo: cuando el hallazgo nació de una lectura del código, se indica así.

Actualización del 2026-11-06: las correcciones LOG-01 a LOG-08 están incluidas en el commit real `f74780ca07806abcc63d9e34d77da1b8ea30e1b7`, creado el 2026-11-01. `cc9cc2f` es la base modular de referencia. Las correcciones de integración de otros módulos siguen pendientes; no se les asigna el commit de Andrey.

## Correcciones del módulo de lógica

| ID / fecha | Error o incumplimiento | Impacto | Solución y verificación | Commit |
|---|---|---|---|---|
| LOG-01 / 2026-10-31 | `clear_top_row` sobrescribía `$s0`; detectado en revisión estática. | El llamador podía continuar con un puntero donde esperaba un número de fila. | Usar `$t2` como puntero. La limpieza superior y la eliminación de la fila 0 pasaron, conservando `$s0–$s7` y `$sp`. | `f74780c` |
| LOG-02 / 2026-10-31 | `update_high_score` sobrescribía `$s0` y `$s1`; revisión estática. | Alteración de valores que pertenecen al llamador. | Comparar mediante `$t2` y `$t3`. Pasaron los casos de puntaje menor, igual y mayor que el récord. | `f74780c` |
| LOG-03 / 2026-10-31 | Faltaba rechazar filas absolutas negativas antes de leer el arreglo; revisión estática. | Riesgo de leer memoria anterior a `PLAYFIELD`. | Comprobar ambos límites de X/Y antes del cálculo de dirección. Pasaron los casos negativos y las posiciones límite. | `f74780c` |
| LOG-04 / 2026-10-31 | Dimensiones y recorridos fijos de 16 columnas y hasta fila 30. | Incompatibilidad con el tablero lógico 10 × 20. | Usar `ANCHO`/`ALTO` en los seis procedimientos. Las pruebas aisladas usan 200 palabras. Definiciones de producción pendientes de Keilor. | `f74780c` |
| LOG-05 / 2026-10-31 | Colisión solo reconocía el valor `1`. | Los IDs `2..7` podían tratarse como celdas libres. | Considerar ocupado cualquier valor no nulo. Pasaron pruebas con los siete IDs. | `f74780c` |
| LOG-06 / 2026-10-31 | Fijación sin validación propia; revisión estática del riesgo. | Posibles escrituras fuera del tablero o fijación parcial con argumentos inválidos. | Validar la forma completa y el tipo antes de escribir. Las posiciones y tipos inválidos dejaron intactos el tablero y sus centinelas. | `f74780c` |
| LOG-07 / 2026-10-31 | `shift_rows_down` no validaba la fila de entrada; su llamador evitaba el caso cero, pero el procedimiento aislado podía leer la fila −1. | Riesgo de lectura inválida ante una llamada con fila 0, negativa o fuera del alto. | Validar la fila y limpiar directamente la fila 0. Pasaron filas −1, 0, 1, 19 y 20, preservando IDs. | `f74780c` |
| LOG-08 / 2026-10-31 | Puntaje heredado de un punto por línea, calculado dentro del recorrido. | No cumplía los premios por conjunto de líneas ni informaba la cuenta de la jugada. | Contar la jugada, retornar la cuenta y puntuar mediante `log_update_score`. Pasaron las combinaciones de 0–4 líneas con niveles 1–10. La llamada desde el núcleo queda pendiente. | `f74780c` |

La caída instantánea y el wall kick eran funcionalidades ausentes. Se agregaron como procedimientos nuevos, no como fallos ejecutados de la base. Sus 89 escenarios aislados pasaron en MARS.

## Pendientes del equipo y prueba cruzada

| ID / fecha | Hallazgo | Impacto y acción propuesta | Responsable / estado | Commit |
|---|---|---|---|---|
| INT-01 / 2026-10-31 | `ANCHO` y `ALTO` sin definir en la base local. | Impide ensamblar esa base. La referencia remota ya los define y el candidato con lógica de Andrey ensambla. | Resuelto por Keilor en la referencia; falta incorporar esa versión a la rama local. | Verificado en `d4c1810`. |
| INT-02 / 2026-10-31 | `game_loop` modular incompleto en la base local; revisión estática. | La referencia remota ya contiene el ciclo de estados completo. | Resuelto por Keilor en la referencia; rama local conserva la base anterior. | Verificado en `d4c1810`. |
| INT-03 / 2026-10-31 | Núcleo sin llamadas a puntaje nuevo, caída instantánea y wall kick; regla del nivel de puntaje sin acordar. | Integrar los contratos, conservar retornos y finalizar cada jugada una vez. | Keilor / pendiente. | Pendiente |
| XJ-01 / 2026-10-31 | `draw_scene` de la base no conservó `$s0–$s2`. | Observados 268503184, 0 y 512. La referencia actual conserva `$s0–$s7` en las ocho comprobaciones XR01. | Resuelto en la referencia de Jorge; fallo conservado como evidencia histórica de la base local. | Verificado en `d4c1810`. |
| XJ-02 / 2026-10-31 | La base dibujó el marcador del índice 200. | Píxel heredado `0x22C55E` en vez de `0x606060`. La referencia recorre 200 celdas; la sonda XR02 adaptada a su nuevo piso pasa. | Adaptado en la referencia de Jorge. La sonda antigua pertenece al diseño anterior. | Verificado en `d4c1810`. |
| XJ-03 / 2026-11-06 | La referencia actual dibuja los siete IDs con `COLOR_FROZEN_BLOCK`. | Se observa 2278750 para todos los IDs, en vez de los siete colores de `ALL_COLORS_TABLE`. Seleccionar el color mediante `ID−1` y doble lectura. | Jorge / 7 comprobaciones XR03 fallidas, pendiente. | Pendiente |
| PRU-01 / 2026-11-06 | La preparación del driver heredado limpia 512 palabras; tras actualizar datos a 800 bytes excedería el tablero nuevo. | Se agregó comprobación de la reserva antes de escribir y las dependencias necesarias para ensamblar ambas versiones. Con la referencia nueva imprime SKIP y sale con código 2; con la base mantiene la salida cruzada original. | Corregido en `andrey/pruebas/cruce_graficos.asm`; probado en ambas versiones. | `fe5767b` |

No se modificaron los módulos de Keilor ni Jorge para resolver estos pendientes. XJ-02 es una comprobación de la integración futura con 10 × 20; no implica que la reserva heredada de 512 palabras fuera insuficiente para su diseño original.

Revalidación del **2026-11-06**: las tres suites de lógica volvieron a pasar y XJ-01/XJ-02 se reprodujeron con los mismos valores. Se exportaron 29 vistas reales de la ventana de MARS, sin retocar resultados; el [índice](evidencias/CAPTURAS_PENDIENTES.md) indica sus casos. El [ensamblado de producción](evidencias/ensamblado_integracion_2026-11-06.txt) falló con código 1 por `ANCHO`/`ALTO` sin definir, confirmando INT-01 en ejecución del ensamblador. INT-02/INT-03 siguen siendo hallazgos de revisión estática. La [nueva salida registrada](evidencias/resultados_2026-11-06.txt) conserva el alcance de estas verificaciones.

Después se consultó GitHub: `main` tenía 21 commits posteriores a la base local. Se probaron sus archivos exactos en una carpeta temporal con la lógica de Andrey. El [registro de referencia](evidencias/cruce_referencia_2026-11-06.txt) y las vistas P17/P18 actualizan el estado de INT-01/INT-02 y XJ-01/XJ-02; `d4c1810` identifica el contenido comprobado, no necesariamente el primer commit de cada corrección. La prueba actual tiene 36 comparaciones aprobadas y 7 fallidas por XJ-03. Sus 27 comparaciones de lógica/niveles pasaron. INT-03 sigue abierto por las llamadas que faltan en el núcleo. No se editó ni mezcló el código del equipo en la rama local.

## Cómo mantener esta bitácora

Al aparecer un error, agregar fecha, preparación que lo reproduce, impacto y responsable. Después registrar la solución, el archivo de prueba y el resultado real. Guardar una captura cuando se tome, completar el commit cuando exista y repetir la prueba tras integrar. Un resultado fallido de otro módulo queda abierto hasta que su responsable lo corrija y se vuelva a comprobar.
