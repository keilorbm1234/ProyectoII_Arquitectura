# Bitácora de errores — coordinación de Andrey

Fecha de registro: **2026-10-31**. Los estados describen el código revisado y las ejecuciones registradas en [las evidencias](evidencias/resultados_mars.txt). No se ejecutó la versión original para reproducir cada riesgo: cuando el hallazgo nació de una lectura del código, se indica así.

Los commits de las correcciones aún no existen. El commit `cc9cc2f` es la base modular de referencia, no un commit de corrección de Andrey. Reemplazar «Pendiente» por identificadores reales cuando se creen los commits correspondientes.

## Correcciones del módulo de lógica

| ID / fecha | Error o incumplimiento | Impacto | Solución y verificación | Commit |
|---|---|---|---|---|
| LOG-01 / 2026-10-31 | `clear_top_row` sobrescribía `$s0`; detectado en revisión estática. | El llamador podía continuar con un puntero donde esperaba un número de fila. | Usar `$t2` como puntero. La limpieza superior y la eliminación de la fila 0 pasaron, conservando `$s0–$s7` y `$sp`. | Pendiente |
| LOG-02 / 2026-10-31 | `update_high_score` sobrescribía `$s0` y `$s1`; revisión estática. | Alteración de valores que pertenecen al llamador. | Comparar mediante `$t2` y `$t3`. Pasaron los casos de puntaje menor, igual y mayor que el récord. | Pendiente |
| LOG-03 / 2026-10-31 | Faltaba rechazar filas absolutas negativas antes de leer el arreglo; revisión estática. | Riesgo de leer memoria anterior a `PLAYFIELD`. | Comprobar ambos límites de X/Y antes del cálculo de dirección. Pasaron los casos negativos y las posiciones límite. | Pendiente |
| LOG-04 / 2026-10-31 | Dimensiones y recorridos fijos de 16 columnas y hasta fila 30. | Incompatibilidad con el tablero lógico 10 × 20. | Usar `ANCHO`/`ALTO` en los seis procedimientos. Las pruebas aisladas usan 200 palabras. Definiciones de producción pendientes de Keilor. | Pendiente |
| LOG-05 / 2026-10-31 | Colisión solo reconocía el valor `1`. | Los IDs `2..7` podían tratarse como celdas libres. | Considerar ocupado cualquier valor no nulo. Pasaron pruebas con los siete IDs. | Pendiente |
| LOG-06 / 2026-10-31 | Fijación sin validación propia; revisión estática del riesgo. | Posibles escrituras fuera del tablero o fijación parcial con argumentos inválidos. | Validar la forma completa y el tipo antes de escribir. Las posiciones y tipos inválidos dejaron intactos el tablero y sus centinelas. | Pendiente |
| LOG-07 / 2026-10-31 | `shift_rows_down` no validaba la fila de entrada; su llamador evitaba el caso cero, pero el procedimiento aislado podía leer la fila −1. | Riesgo de lectura inválida ante una llamada con fila 0, negativa o fuera del alto. | Validar la fila y limpiar directamente la fila 0. Pasaron filas −1, 0, 1, 19 y 20, preservando IDs. | Pendiente |
| LOG-08 / 2026-10-31 | Puntaje heredado de un punto por línea, calculado dentro del recorrido. | No cumplía los premios por conjunto de líneas ni informaba la cuenta de la jugada. | Contar la jugada, retornar la cuenta y puntuar mediante `log_update_score`. Pasaron las combinaciones de 0–4 líneas con niveles 1–10. La llamada desde el núcleo queda pendiente. | Pendiente |

La caída instantánea y el wall kick eran funcionalidades ausentes. Se agregaron como procedimientos nuevos, no como fallos ejecutados de la base. Sus 89 escenarios aislados pasaron en MARS.

## Pendientes del equipo y prueba cruzada

| ID / fecha | Hallazgo | Impacto y acción propuesta | Responsable / estado | Commit |
|---|---|---|---|---|
| INT-01 / 2026-10-31 | `ANCHO` y `ALTO` todavía no están definidos en producción. | La integración que incluye la lógica necesita esas constantes. Agregarlas desde los datos compartidos. | Keilor / pendiente. Las constantes añadidas previamente por Andrey fueron retiradas por acuerdo de alcance. | Pendiente |
| INT-02 / 2026-10-31 | `game_loop` modular está incompleto; revisión estática. | Falta terminar la obtención/dibujo de la pieza y las llamadas del ciclo. Recuperar el tramo correspondiente de la base. | Keilor / pendiente. | Pendiente |
| INT-03 / 2026-10-31 | Núcleo sin llamadas a puntaje nuevo, caída instantánea y wall kick; regla del nivel de puntaje sin acordar. | Integrar los contratos, conservar retornos y finalizar cada jugada una vez. | Keilor / pendiente. | Pendiente |
| XJ-01 / 2026-10-31 | Prueba cruzada real de `draw_scene`: no conservó `$s0–$s2`. | Esperados 1000, 1001 y 1002; observados 268503184, 0 y 512 en esta ejecución. Guardar/restaurar los registros usados o cambiar su uso. | Jorge / detectado en MARS, pendiente de corrección y revalidación. | Pendiente |
| XJ-02 / 2026-10-31 | Prueba cruzada real: se dibujó el marcador del índice 200. | El índice está fuera del tablero lógico de 200 celdas, aunque dentro de la reserva heredada de 512. Adaptar los recorridos de gráficos. Píxel observado `0x22C55E`; fondo esperado en la sonda actual `0x606060`. | Jorge / detectado en MARS, pendiente de adaptación y revalidación. | Pendiente |

No se modificaron los módulos de Keilor ni Jorge para resolver estos pendientes. XJ-02 es una comprobación de la integración futura con 10 × 20; no implica que la reserva heredada de 512 palabras fuera insuficiente para su diseño original.

## Cómo mantener esta bitácora

Al aparecer un error, agregar fecha, preparación que lo reproduce, impacto y responsable. Después registrar la solución, el archivo de prueba y el resultado real. Guardar una captura cuando se tome, completar el commit cuando exista y repetir la prueba tras integrar. Un resultado fallido de otro módulo queda abierto hasta que su responsable lo corrija y se vuelva a comprobar.
