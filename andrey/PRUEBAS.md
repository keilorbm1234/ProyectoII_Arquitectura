# Plan y registro de pruebas de Andrey

Fecha de registro: **2026-10-31**. Las tres suites de lógica pasaron en MARS 4.5: 42 + 104 + 89 = **235 escenarios**, con **37 911 comprobaciones**. La salida real se conserva en [resultados_mars.txt](evidencias/resultados_mars.txt). La prueba cruzada de gráficos ejecutó dos comprobaciones y detectó dos pendientes del otro módulo.

Estos resultados corresponden a procedimientos aislados, no a una partida completa ni a una medición formal de cobertura. Los datos de prueba son propios; no modifican los archivos de Keilor o Jorge. Los centinelas comprueban escrituras alrededor del tablero. El orden de las verificaciones antes de las lecturas también se revisó en el código.

## Preparación común y toma de capturas

1. Abrir una sola suite de `andrey/pruebas/` en MARS. Ensamblar ese archivo con sus includes. Mantener delayed branching desactivado y evitar ensamblar simultáneamente los tres archivos que contienen `main`.
2. Para inspeccionar un escenario, buscar la etiqueta `log_test_case_NNN` indicada abajo. La preparación del tablero ya está escrita en el escenario.
3. Ubicar su llamada al procedimiento objetivo y poner una interrupción en la primera instrucción posterior. Ejecutar hasta allí: los registros de retorno todavía corresponden a la llamada observada. Para avanzar, usar las acciones de ejecución paso a paso de MARS.
4. Inspeccionar los registros y el segmento de datos usando las direcciones de `PLAYFIELD`, `log_test_guard_before`, `log_test_guard_after`, `SCORE` y `LINES_CLEARED`. Una celda ocupa cuatro bytes; la celda `(x,y)` está en `PLAYFIELD + 4 × (y × 10 + x)`.
5. Tomar la captura indicada y guardar fecha, suite y caso. Las suites de lógica no dibujan el juego: sus evidencias son registros, memoria y consola. Las capturas de la partida con gráficos requieren la integración del equipo.

Los registros preservados se preparan con `$s0=1000`, `$s1=1001`, …, `$s7=1007`. `$sp` debe coincidir con `log_test_saved_sp`. Ambos centinelas deben mantener `123456789`.

**Todas las capturas indicadas abajo están pendientes.** No hay imágenes simuladas ni resultados visuales inventados.

## P01 — Inicialización

- **Preparación:** `etapa1.asm`, caso `001`; las 200 celdas se llenan con 7 y se colocan centinelas alrededor.
- **Pasos:** detenerse después de `initialize_playfield` y revisar las primeras y últimas palabras del tablero.
- **Esperado:** 200 ceros, ambos centinelas intactos y registros preservados.
- **Registro:** pasó automáticamente. **Captura pendiente:** `P01_inicializacion.png`, mostrando extremos del tablero y centinelas.

## P02 — Ambas paredes

- **Preparación:** `etapa1.asm`, casos `003–006`; pieza O sobre tablero vacío. X=0 y X=8 son posiciones válidas; X=−1 y X=9 cruzan paredes.
- **Pasos:** observar `$v0` después de cada `check_collision`.
- **Esperado:** 0 en las posiciones válidas y 1 al cruzar cualquiera de las paredes; tablero intacto.
- **Registro:** pasaron. **Capturas pendientes:** `P02_pared_izquierda.png` y `P02_pared_derecha.png`, con posición candidata y retorno.

## P03 — Piso y coordenadas negativas

- **Preparación:** `etapa1.asm`, casos `007–015`; incluye O apoyada en Y=18, O en Y=19, filas negativas y piezas I con distintos desplazamientos relativos.
- **Pasos:** observar `check_collision` y comparar las coordenadas de los bloques, no únicamente el origen de la pieza.
- **Esperado:** ningún bloque puede quedar bajo la fila 19 ni sobre la fila 0. Un origen negativo puede ser válido si todos sus bloques quedan dentro, como la I vertical con X=−1.
- **Registro:** pasaron. **Capturas pendientes:** `P03_piso.png` y `P03_limite_superior.png`.

## P04 — Bloques fijados y aparición bloqueada

- **Preparación:** `etapa1.asm`, casos `016–022`; se coloca cada ID de 1 a 7 donde aparecería un bloque de O. `etapa3.asm`, casos `087–088`, usa una aparición ocupada.
- **Pasos:** observar el retorno de colisión y el rechazo de caída/rotación.
- **Esperado:** cualquier ID no nulo bloquea. El tablero y el estado de la pieza rechazada permanecen iguales.
- **Registro:** pasaron. Esto comprueba la detección usada por la aparición; la activación del estado de fin de partida pertenece al núcleo y está pendiente de integración. **Captura pendiente:** `P04_aparicion_bloqueada.png`.

## P05 — Fijación segura e identificadores

- **Preparación:** `etapa1.asm`, casos `023–028`; `etapa2.asm`, casos `001–031`, recorre siete tipos y cuatro orientaciones, además de tipos inválidos.
- **Pasos:** observar `freeze_piece`. En el caso `024` de etapa 1, la primera celda candidata cabe, pero la siguiente cruza la pared.
- **Esperado:** éxito con cuatro celdas que almacenan `tipo+1`; rechazo con `$v0=1` sin escrituras parciales ni alteración de los centinelas.
- **Registro:** pasaron. **Capturas pendientes:** `P05_ids.png` y `P05_fijacion_rechazada.png`.

## P06 — Rotación junto a paredes

- **Preparación:** `etapa3.asm`, casos `062–063`; T junto a la pared derecha y junto a la izquierda.
- **Pasos:** observar `log_rotate_with_kick` y los globales de X, Y y orientación.
- **Esperado:** caso 062: X pasa de 8 a 7 y orientación de 1 a 2, `$v1=−1`. Caso 063: X pasa de −1 a 0 y orientación de 3 a 0, `$v1=1`. Ambos retornan `$v0=1` y conservan Y y el tablero.
- **Registro:** pasaron. **Capturas pendientes:** `P06_kick_izquierda.png` y `P06_kick_derecha.png`.

## P07 — Prioridad de intentos, obstáculos y cancelación

- **Preparación:** `etapa3.asm`, casos `064–069`; obstáculos bajo T, tres posiciones bloqueadas, piso y una I que necesitaría un corrimiento mayor.
- **Pasos:** observar el retorno y comparar X/orientación antes y después.
- **Esperado:** 064 acepta izquierda aunque derecha también sea posible; 065 usa derecha cuando izquierda falla; 066–068 cancelan conservando el estado. No hay corrimiento vertical ni de dos celdas.
- **Registro:** pasaron. **Capturas pendientes:** `P07_prioridad.png` y `P07_rotacion_cancelada.png`.

## P08 — Caída instantánea y obstáculos intermedios

- **Preparación:** `etapa3.asm`, casos `001–032`; incluye las 28 combinaciones de tipo/orientación. En el caso 030 hay obstáculos en índices 53 y 153.
- **Pasos:** observar `log_hard_drop`, su distancia retornada y la Y final.
- **Esperado:** la pieza queda en la última posición válida y se fija con su ID. En el caso 030, O termina en Y=3, por encima del primer obstáculo; no atraviesa ese bloque para llegar al segundo ni al piso. `SCORE` y `LINES_CLEARED` no cambian.
- **Registro:** pasaron. **Captura pendiente:** `P08_caida_obstaculo.png`.

## P09 — Distancia cero y repetición inmediata

- **Preparación:** `etapa3.asm`, caso `031`, O apoyada en el piso; caso `033`, repetición sobre la pieza recién fijada.
- **Pasos:** observar cada llamada a `log_hard_drop`, especialmente `$v1`.
- **Esperado:** una pieza apoyada retorna distancia 0 y estado 0, y queda fijada. Una repetición inmediata antes de procesar líneas retorna estado 1 sin fijar nuevamente.
- **Registro:** pasaron. El núcleo debe consumir la jugada una vez y saltar la gravedad restante del ciclo. **Capturas pendientes:** `P09_distancia_cero.png` y `P09_repeticion.png`.

## P10 — Una, dos, tres y cuatro líneas en una jugada

- **Preparación:** `etapa1.asm`, casos `034–037`; se llenan las filas inferiores y se deja un marcador 7 en `(0,0)`.
- **Pasos:** observar `check_and_clear_lines` después de cada preparación.
- **Esperado:** `$v0` retorna 1, 2, 3 o 4; el marcador desciende esa cantidad de filas; el acumulado aumenta una vez y el puntaje no cambia en ese procedimiento.
- **Registro:** pasaron. **Capturas pendientes:** `P10_una_linea.png`, `P10_dos_lineas.png`, `P10_tres_lineas.png` y `P10_cuatro_lineas.png`.

## P11 — Desplazamiento de filas e integridad de IDs

- **Preparación:** `etapa1.asm`, casos `029–033`; tablero con patrón `índice mod 8` para distinguir vacíos e IDs.
- **Pasos:** observar `shift_rows_down` con filas −1, 20, 0, 1 y 19.
- **Esperado:** entradas inválidas no cambian nada. Para una fila válida, las filas superiores bajan copiando los valores completos, la fila 0 queda vacía y las filas inferiores a la eliminada conservan sus datos.
- **Registro:** pasaron. **Captura pendiente:** `P11_desplazamiento_ids.png`, comparando memoria y fixture esperado del caso 033.

## P12 — Limpieza de la fila superior

- **Preparación:** `etapa1.asm`, caso `002`, limpieza directa; caso `038`, fila superior completa y marcador en la fila 1.
- **Pasos:** observar `clear_top_row` o `check_and_clear_lines`, respectivamente.
- **Esperado:** primera fila vacía, marcador de la fila 1 intacto en el caso 038, recorrido que termina y registros preservados.
- **Registro:** pasaron. **Captura pendiente:** `P12_fila_superior.png`.

## P13 — Puntaje por conjunto y nivel

- **Preparación:** `etapa2.asm`, casos `032–081`, cubren 0–4 líneas en todos los niveles 1–10. El puntaje inicial es 1234 y el acumulado de líneas es 17.
- **Pasos:** observar `log_update_score`. El caso 044 entrega dos líneas y nivel 3; el 081 entrega cuatro líneas y nivel 10.
- **Esperado:** puntos base 0/100/300/500/800 multiplicados por el nivel. Caso 044: 900 puntos, total 2134. Caso 081: 8000 puntos, total 9234. El acumulado de líneas sigue en 17.
- **Registro:** pasaron. La elección del nivel durante un ascenso queda pendiente de Keilor. **Capturas pendientes:** `P13_puntaje_nivel3.png` y `P13_puntaje_nivel10.png`.

## P14 — Contrato de jugada y prevención de procesamiento duplicado

- **Preparación:** `etapa3.asm`, caso `089`; I vertical llena el hueco de cuatro filas. Puntaje inicial 1234, acumulado 7 y nivel entregado explícitamente 2.
- **Pasos:** detenerse tras la caída, tras el borrado y tras el puntaje.
- **Esperado:** caída fija sin cambiar puntaje/líneas; borrado retorna 4 y deja acumulado 11; puntaje otorga 1600 y deja total 2834, manteniendo acumulado 11.
- **Registro:** pasó. La prueba llama directamente a los procedimientos; no prueba la detección de espacio ni la generación de piezas del núcleo. **Captura pendiente:** `P14_finalizacion_unica.png`.

## P15 — Registros, pila, récord y argumentos inválidos

- **Preparación:** las tres suites comprueban `$s0–$s7`, `$sp` y centinelas después de las llamadas objetivo. `etapa1.asm`, casos `040–042`, comprueba récord menor/igual/mayor; `etapa2.asm`, casos `082–088`, prueba argumentos inválidos de puntaje.
- **Pasos:** observar retornos y comparar con los valores de preparación.
- **Esperado:** registros preservados y pila restaurada. El récord solo aumenta si corresponde. Puntaje inválido retorna puntos 0 y estado 1 sin modificar `SCORE`.
- **Registro:** pasaron. **Captura pendiente:** `P15_registros_pila.png`.

## P16 — Prueba cruzada del módulo de Jorge

- **Preparación:** abrir `cruce_graficos.asm`. Usa los módulos reales de datos, fuente y gráficos. Limpia las 512 palabras reservadas y coloca un 7 en el índice 200, fuera del tablero lógico de 200 celdas.
- **Pasos:** ejecutar y revisar la consola. Para inspección, detenerse tras `draw_scene`. La sonda del píxel usa el diseño heredado; si Jorge cambia su distribución, coordinar la sonda antes de repetir XJ02.
- **Esperado del contrato:** preservar registros y no dibujar el índice 200. Código de salida 0 si ambos se cumplen.
- **Observado realmente:** XJ01 y XJ02 fallaron. `$s0/$s1/$s2`: 268503184/0/512 en lugar de 1000/1001/1002. Píxel `0x22C55E` en lugar del fondo `0x606060`. Código de salida 1.
- **Seguimiento:** registrado para Jorge, sin editar sus archivos. Repetición después de su adaptación: pendiente. **Captura pendiente:** `P16_cruce_graficos.png`.

## Criterio para cerrar la validación

Las pruebas aisladas ya están ejecutadas. Faltan las capturas, completar los acuerdos de integración, volver a probar tras los cambios de Keilor/Jorge y validar una partida conjunta con teclado, niveles y victoria. Cada resultado nuevo debe agregarse a la bitácora con fecha, evidencia y commit real cuando exista.
