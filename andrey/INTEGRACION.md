# Contratos de integración de la lógica

Estas son indicaciones para los responsables de los otros módulos. Este documento no modifica `main.asm`, `datos.asm`, `nucleo.asm`, `graficos.asm`, `macros.asm` ni `fuente.asm`.

## Datos compartidos — coordinar con Keilor

`logica.asm` espera que `datos.asm` defina las constantes simbólicas `ANCHO = 10` y `ALTO = 20`, antes de incluir la lógica. La propuesta es:

```asm
.eqv ANCHO 10    # Number of playable columns
.eqv ALTO 20     # Number of playable rows
```

Es una propuesta pendiente para Keilor; estas líneas no se agregaron al archivo de producción. Los nombres utilizados por la lógica son los existentes: `PLAYFIELD`, `CURRENT_PIECE_X`, `CURRENT_PIECE_Y`, `CURRENT_PIECE_TYPE`, `CURRENT_PIECE_ORIENTATION`, `SCORE`, `LINES_CLEARED` y `HIGH_SCORE`.

El tablero lógico tiene 200 palabras y necesita al menos 800 bytes alineados a cuatro bytes. La dirección de una celda es `PLAYFIELD + 4 × (fila × ANCHO + columna)`, con columnas `0..9` y filas `0..19`. El piso está fuera del arreglo, debajo de la fila 19. La posición del dibujo en pantalla es un asunto de gráficos.

El arreglo heredado todavía reserva 2048 bytes. Su reducción debe coordinarse con el cambio de los gráficos, que actualmente leen 512 celdas. Cambiar solo la reserva dejaría esos accesos fuera de la nueva asignación.

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

La aparición de piezas debe quedar dentro del nuevo tablero y comprobarse con `check_collision`; la X heredada de 10 no sirve para el tablero de ancho 10. El núcleo decide fin de partida si la aparición queda bloqueada.

También queda pendiente completar el tramo cortado de `game_loop` en `main.asm`, desde la carga del valor de orientación hasta el salto al inicio del ciclo. La referencia completa sigue en `tetris.asm`.

## Lectura del tablero — Jorge

`0` significa vacío. `1..7` identifican I, J, L, O, S, T y Z. El tipo activo sigue siendo `0..6`; no confundir el tipo activo I (`0`) con una celda vacía (`0` en `PLAYFIELD`).

`ALL_COLORS_TABLE` contiene **direcciones** de palabras de color. Para una celda ocupada, convertir `ID−1` a índice, obtener el puntero de la tabla y después leer el valor RGB. La lógica no pinta ni sustituye los identificadores por colores.

El dibujo debe recorrer solo `ANCHO × ALTO` celdas y usar `ANCHO` como paso de fila. El tablero es la fuente de verdad. En la prueba cruzada actual, `draw_scene` no conservó `$s0–$s2` y representó el marcador del índice 200. Los hallazgos están documentados para Jorge; no se corrigieron sus archivos.
