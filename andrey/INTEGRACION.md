# Contratos de integración de la lógica

Estas son indicaciones para los responsables de los otros módulos. Este documento no modifica `main.asm`, `datos.asm`, `nucleo.asm`, `graficos.asm`, `macros.asm` ni `fuente.asm`.

## Estado actual comprobado — 2026-11-06

La rama local de Andrey conserva los módulos de la base `cc9cc2f`. El [main remoto consultado, d4c1810](https://github.com/keilorbm1234/ProyectoII_Arquitectura/commit/d4c181045f870ede460be3f0c2591b48f41d33f2), tiene cambios posteriores del equipo. Se descargaron sus ocho archivos ASM y se verificaron contra sus blob SHA; los identificadores están en [la referencia registrada](evidencias/referencia_github_2026-11-06.json).

En una carpeta temporal se combinaron esos módulos sin editar con `logica.asm` y `piezas.asm` de Andrey. **El main candidato ensambla correctamente.** La [prueba cruzada actual](evidencias/cruce_referencia_2026-11-06.txt) ejecutó 43 comparaciones: 36 pasaron y 7 fallaron por los colores de bloques fijados. Las 27 comparaciones de la secuencia lógica/núcleo pasaron. Esto comprueba llamadas directas, no el teclado ni una partida completa.

| Aspecto | Base conservada en la rama local | Referencia remota con la lógica de Andrey |
|---|---|---|
| Constantes y reserva | Faltan ANCHO/ALTO; reserva de 2048 bytes. | Ya define 10 × 20 y reserva 800 bytes. |
| Ciclo y aparición | Ciclo incompleto y X=10. | Ciclo completo y aparición X=3, Y=0. |
| Niveles | Regla heredada. | `update_speed` pasó las comprobaciones de 5 líneas por nivel, cruce 4→6 y victoria a 50 líneas. |
| Registros y recorrido gráfico | Fallos XJ-01/XJ-02 documentados. | XR01/XR02 pasan; el código recorre ANCHO × ALTO. |
| Colores de IDs | Color fijo. | Sigue usando `COLOR_FROZEN_BLOCK`: fallan los siete IDs frente a sus colores. |
| Conexión de funciones nuevas | Pendiente. | Sigue pendiente: W usa rotación heredada, no se maneja espacio y no se llama al puntaje nuevo al aterrizar. |

Los apartados siguientes describen los contratos y distinguen los pendientes de la base local de los avances ya existentes en la referencia. No es necesario reimplementar las dimensiones ni el ciclo que Keilor ya resolvió.

## Datos compartidos — coordinar con Keilor

`logica.asm` espera que `datos.asm` defina las constantes simbólicas `ANCHO = 10` y `ALTO = 20`, antes de incluir la lógica. La propuesta es:

```asm
.eqv ANCHO 10    # Number of playable columns
.eqv ALTO 20     # Number of playable rows
```

Estas constantes faltan en la base local y ya están presentes en la referencia remota de Keilor. No se agregaron desde esta rama a sus archivos. Los nombres utilizados por la lógica son los existentes: `PLAYFIELD`, `CURRENT_PIECE_X`, `CURRENT_PIECE_Y`, `CURRENT_PIECE_TYPE`, `CURRENT_PIECE_ORIENTATION`, `SCORE`, `LINES_CLEARED` y `HIGH_SCORE`.

El tablero lógico tiene 200 palabras y necesita al menos 800 bytes alineados a cuatro bytes. La dirección de una celda es `PLAYFIELD + 4 × (fila × ANCHO + columna)`, con columnas `0..9` y filas `0..19`. El piso está fuera del arreglo, debajo de la fila 19. La posición del dibujo en pantalla es un asunto de gráficos.

El arreglo de la base local reserva 2048 bytes y sus gráficos recorren 512 celdas. La referencia remota ya incorpora conjuntamente la reserva de 800 bytes y el recorrido gráfico de 200 celdas; ambos cambios deben llegar juntos al integrar.

## Interfaces disponibles

| Procedimiento | Argumentos | Retorno y efecto |
|---|---|---|
| `initialize_playfield` | Ninguno | Limpia `ANCHO × ALTO` celdas; no reinicia puntaje ni nivel. |
| `check_collision` | `$a0`: forma; `$a1`: X candidata; `$a2`: Y candidata | `$v0 = 1` si algún bloque está fuera o en una celda ocupada; `0` si todos son válidos. Conserva estos argumentos. |
| `freeze_piece` | Los mismos tres argumentos | `$v0 = 0` si fija; `1` si rechaza la posición o el tipo. Valida antes de escribir y guarda el tipo activo más uno. |
| `shift_rows_down` | `$a0`: fila eliminada | Copia hacia abajo las filas superiores, conservando cada valor. Limpia la fila 0. Rechaza filas inválidas sin escribir. |
| `clear_top_row` | Ninguno | Limpia únicamente la primera fila. |
| `check_and_clear_lines` | Ninguno | `$v0`: líneas eliminadas en esta llamada. Suma esa cantidad a `LINES_CLEARED` una vez. No cambia `SCORE`. |
| `log_update_score` | `$a0`: líneas `0..4`; `$a1`: nivel `1..10` | `$v0`: puntos otorgados; `$v1 = 0` si los argumentos son válidos o `1` si no lo son. Suma los puntos a `SCORE`; no modifica el acumulado de líneas. |
| `update_high_score` | Ninguno | Actualiza `HIGH_SCORE` si `SCORE` es mayor. |
| `log_hard_drop` | Ninguno; usa la pieza activa global | `$v0`: distancia descendida; `$v1 = 0` si fija o `1` si rechaza. Solo fija y actualiza Y. |
| `log_rotate_with_kick` | Ninguno; usa la pieza activa global | `$v0 = 1` si aplica o `0` si cancela; `$v1`: corrimiento aceptado. Solo actualiza X y orientación al aceptar. |

Los procedimientos conservan los registros `$s0–$s7` utilizados, restauran `$sp` y protegen `$ra` cuando llaman a otro procedimiento. El llamador debe conservar los valores temporales que necesite después de cada llamada. Los detalles de argumentos preservados están en los encabezados del código.

## Finalizar una jugada una sola vez — Keilor

Para la gravedad o la caída suave:

1. Al aterrizar, llamar a `freeze_piece` con la última posición válida.
2. Si devuelve rechazo, detener esa finalización y resolver el estado desde el núcleo; no continuar como si se hubiera fijado.
3. Si fija, llamar una vez a `check_and_clear_lines` y guardar su `$v0` en un registro preservado o en la pila.
4. Elegir el nivel de puntaje según el acuerdo del equipo y llamar una vez a `log_update_score` con la cuenta guardada y ese nivel. Su `$v0` contiene puntos, no la cuenta anterior.
5. Procesar niveles, velocidad y victoria desde el núcleo. **No sumar otra vez las líneas:** el acumulado ya fue actualizado por la lógica.
6. Generar una siguiente pieza únicamente si el estado permite continuar.

El núcleo todavía conserva la secuencia heredada y no llama a `log_update_score`. Por eso la puntuación nueva necesita esa integración. `check_and_clear_lines` ya no llama a `update_speed`: la decisión de niveles pertenece al núcleo.

La regla de puntuar con el nivel anterior o posterior al ascenso queda pendiente de Keilor y del acuerdo del equipo. La lógica no define una variable de nivel ni decide esa regla. Las pruebas entregan un nivel explícito. Al borrar varias líneas, la actualización de niveles debe detectar cruces de umbral: pasar de 4 a 6 líneas cruza un múltiplo de 5 aunque el nuevo total no sea divisible por 5.

## Espacio y rotación — Keilor

Al detectar espacio, llamar a `log_hard_drop`. Si `$v1 = 0`, la pieza **ya está fijada**: continuar desde el borrado de líneas del paso 3, sin volver a llamar a `freeze_piece`. Una distancia `$v0 = 0` también es un éxito cuando `$v1 = 0`.

Después de consumir ese evento, omitir la gravedad del resto del ciclo y coordinar el temporizador de la nueva pieza. La lógica no lee el teclado, no genera piezas ni marca un estado global de turno consumido. Una repetición inmediata antes del borrado se rechaza porque los bloques ya están ocupados; después de procesar líneas, el núcleo sigue siendo responsable de no finalizar otra vez la misma jugada.

Al detectar `W`, usar `log_rotate_with_kick` en lugar del bloque de rotación heredado. Esta función ya guarda X y orientación si hay éxito. No aplicar una segunda rotación. Prueba la orientación siguiente en X, X−1 y X+1, sin desplazamiento vertical ni corrimientos mayores.

La aparición de piezas debe quedar dentro del nuevo tablero y comprobarse con `check_collision`. La referencia de Keilor ya usa X=3, Y=0; la X=10 corresponde únicamente a la base local antigua. El núcleo decide fin de partida si la aparición queda bloqueada.

El `game_loop` cortado de la base local ya fue sustituido por el ciclo de estados en el main remoto de Keilor. La prueba temporal usa ese main completo; no se rehízo desde Andrey.

Los ajustes concretos que quedan para Keilor en su versión actual son:

1. En `handle_input`, sustituir el bloque de W por una llamada a `log_rotate_with_kick`, sin actualizar la orientación una segunda vez.
2. Agregar el caso espacio y llamar a `log_hard_drop`. Usar `$v1` para decidir si fijó, incluso con distancia cero.
3. En `land_piece` y `gravity_lands_piece`, comprobar el resultado de `freeze_piece`. Al fijar, conservar el retorno de `check_and_clear_lines`, puntuar una vez con el nivel acordado y llamar a `update_speed` una vez.
4. Al éxito del espacio, usar esa misma finalización empezando por borrar líneas, porque la pieza ya está fijada.
5. Después de actualizar niveles, revisar `ESTADO` antes de generar otra pieza. No generar al llegar a victoria.
6. Definir un resultado explícito de `handle_input` que informe si consumió la jugada o cambió de estado. En `nuc_estado_jugando`, usarlo para omitir la gravedad tras el espacio y al pausar. No depender del valor accidental de `$v0` tras otras llamadas. Reiniciar el temporizador cuando corresponda.

Estos son contratos propuestos para coordinar; no son cambios aplicados al núcleo. Los puntos de partida de la referencia son [handle_input](https://github.com/keilorbm1234/ProyectoII_Arquitectura/blob/d4c181045f870ede460be3f0c2591b48f41d33f2/nucleo.asm#L71), [land_piece](https://github.com/keilorbm1234/ProyectoII_Arquitectura/blob/d4c181045f870ede460be3f0c2591b48f41d33f2/nucleo.asm#L159) y [gravity_lands_piece](https://github.com/keilorbm1234/ProyectoII_Arquitectura/blob/d4c181045f870ede460be3f0c2591b48f41d33f2/nucleo.asm#L254).

## Lectura del tablero — Jorge

`0` significa vacío. `1..7` identifican I, J, L, O, S, T y Z. El tipo activo sigue siendo `0..6`; no confundir el tipo activo I (`0`) con una celda vacía (`0` en `PLAYFIELD`).

`ALL_COLORS_TABLE` contiene **direcciones** de palabras de color. Para una celda ocupada, convertir `ID−1` a índice, obtener el puntero de la tabla y después leer el valor RGB. La lógica no pinta ni sustituye los identificadores por colores.

El dibujo debe recorrer solo `ANCHO × ALTO` celdas y usar `ANCHO` como paso de fila. El tablero es la fuente de verdad. Los fallos de conservación de registros y del índice 200 se reprodujeron en la base antigua; en la referencia actual ya pasan las comprobaciones adaptadas de registros y piso.

El ajuste restante para Jorge está en [gfx_dibujar_bloques_fijos](https://github.com/keilorbm1234/ProyectoII_Arquitectura/blob/d4c181045f870ede460be3f0c2591b48f41d33f2/graficos.asm#L147): actualmente carga un solo `COLOR_FROZEN_BLOCK`. Para cada ID `1..7`, debe obtener el color desde `ALL_COLORS_TABLE[ID−1]` con las dos lecturas descritas arriba. La prueba XR03 registra el color fijo observado `2278750` para los siete IDs y el color esperado de cada uno. No se modificó su módulo.
