# Guía para explicar el aporte de Andrey

Esta guía acompaña a `logica.asm` y `piezas.asm`. Sirve para estudiar el código y explicar las decisiones; los resultados de ejecución están en las evidencias, no en esta guía.

## Lo mínimo de ensamblador para leer los procedimientos

| Instrucción | Significado en este proyecto |
|---|---|
| `li $t0, ANCHO` | Coloca el número de columnas en un registro. `ANCHO` debe ser una constante `.eqv`. |
| `la $t0, PLAYFIELD` | Obtiene la dirección donde empieza el tablero. No lee una celda. |
| `lw $t1, 0($t0)` | Lee una palabra de cuatro bytes desde esa dirección. |
| `sw $t1, 0($t0)` | Guarda una palabra en esa dirección. |
| `addi $t0, $t0, 4` | Avanza una palabra en memoria. |
| `sll $t0, $t0, 2` | Multiplica un índice por cuatro para convertirlo a bytes. |
| `beq` / `bne` | Salta a una etiqueta si los valores son iguales / distintos. |
| `blt` / `bge` | Salta si el primer valor es menor / mayor o igual. |
| `jal procedimiento` | Llama al procedimiento y deja la dirección de regreso en `$ra`. |
| `jr $ra` | Regresa a quien llamó. |

Varias son pseudoinstrucciones que MARS expande a instrucciones básicas. Por eso la vista Execute puede mostrar más instrucciones que las líneas escritas.

Los registros `$a0–$a3` reciben argumentos y `$v0–$v1` entregan resultados. Los temporales `$t0–$t9` pueden cambiar tras una llamada. Los `$s0–$s7` usados por un procedimiento deben volver con sus valores originales.

La pila guarda esos valores temporalmente. Por ejemplo, reservar 16 bytes con `addi $sp, $sp, -16` exige recuperarlos con `addi $sp, $sp, 16` antes de regresar. Si se hacen llamadas internas, también se guarda `$ra`, porque otro `jal` lo sobrescribe.

## Cómo se representa una celda

El tablero tiene 10 columnas y 20 filas, numeradas desde cero. La posición `(3,2)` tiene índice `2 × 10 + 3 = 23`; su palabra está a `23 × 4 = 92` bytes de `PLAYFIELD`.

La fórmula usada es `PLAYFIELD + 4 × (y × ANCHO + x)`. Primero se comprueba que cada bloque esté dentro del tablero y después se calcula y lee su dirección. Un origen negativo puede ser válido si los desplazamientos de la forma colocan sus cuatro bloques dentro.

`0` significa celda vacía. Los tipos activos `0..6` se convierten a IDs `1..7` al fijar. Por ejemplo, el tipo activo I es `0`, pero sus bloques fijados se guardan como `1`. Así los gráficos pueden reconocer la pieza sin confundirla con un espacio vacío.

## Qué hace cada procedimiento y por qué

1. **`initialize_playfield`:** escribe cero en `ANCHO × ALTO` palabras. Evita mantener otra dimensión fija que pueda quedar desactualizada.
2. **`check_collision`:** suma el origen a los cuatro pares `(dx,dy)`, revisa límites y luego ocupación. Devuelve 1 ante la primera colisión y 0 si los cuatro bloques caben.
3. **`freeze_piece`:** comprueba la posición completa y el tipo antes de escribir. Así un bloque válido seguido de otro inválido no deja media pieza guardada.
4. **`shift_rows_down`:** copia desde la fila eliminada hacia arriba: la fila recibe a su anterior. Ese orden evita sobrescribir una fila antes de copiarla. Conserva cada ID completo y limpia la fila superior.
5. **`clear_top_row`:** vacía la primera fila. Usa un puntero temporal para conservar `$s0`, que puede contener la fila recorrida por quien llama.
6. **`check_and_clear_lines`:** recorre desde abajo. Tras quitar una fila, revisa otra vez esa posición porque recibió contenido nuevo. Retorna la cuenta de la jugada y la suma una vez al acumulado.
7. **`log_update_score`:** elige una base para la cuenta completa y la multiplica por el nivel recibido. Dos líneas en nivel 3 dan `300 × 3 = 900`, mientras que dos premios separados de una línea darían incorrectamente 600.
8. **`update_high_score`:** actualiza el récord solo si el puntaje es mayor. Usa temporales para no alterar los registros preservados del llamador.
9. **`log_hard_drop`:** prueba la fila siguiente hasta encontrar una colisión y fija en la última válida. No puede atravesar un obstáculo porque no omite filas. Un descenso de cero filas también puede ser exitoso; el estado está en `$v1`.
10. **`log_rotate_with_kick`:** prueba la orientación nueva en X, X−1 y X+1. Los intentos se calculan desde la X original. Guarda X y orientación únicamente al aceptar; al cancelar conserva ambos.

## Cómo están organizadas las piezas

`MASTER_SHAPE_TABLE` lleva a la tabla de rotaciones del tipo seleccionado. Esa tabla contiene cuatro punteros, y cada puntero lleva a cuatro pares de coordenadas. Hay siete tipos; algunas orientaciones reutilizan la misma forma, como O. Se conservaron los datos originales.

Para recorrer un nivel de punteros se multiplica el índice por cuatro. Para avanzar al siguiente bloque de una forma se avanza ocho bytes, porque cada par contiene dos palabras.

## Cómo explicar las pruebas

Las tres suites llaman a los archivos reales de lógica y piezas con datos de prueba propios. Revisan retornos, tablero, puntaje, registros preservados, pila y dos centinelas contiguos al tablero de 800 bytes.

Un centinela es un valor conocido que permite detectar una escritura fuera del arreglo. No demuestra por sí solo la ausencia de lecturas inválidas: para esas lecturas también se revisó el orden de las validaciones y se ejercitaron límites en MARS.

Los 235 escenarios producen 37 911 comparaciones. Esas comparaciones no equivalen a 37 911 escenarios distintos ni a una medición formal de cobertura. Una captura muestra un momento concreto; la consola final confirma que la suite terminó sus verificaciones.

La prueba cruzada original usa el `draw_scene` real de la base antigua y conserva sus dos fallos como evidencia. Una segunda prueba con el main remoto `d4c1810` comprobó que ya conserva los registros y respeta el piso del tablero nuevo. En esa referencia fallan los colores: los siete IDs se dibujan con un solo color. No se modificó el código de Jorge para hacer pasar las pruebas.

## Qué necesita la integración

La referencia actual de Keilor ya define las dimensiones, completa el ciclo y actualiza niveles. Falta elegir el nivel de puntaje y conectar las llamadas nuevas desde sus eventos. La caída instantánea ya fija: el núcleo debe borrar, puntuar y generar la siguiente pieza una vez, sin fijar de nuevo ni aplicar la gravedad restante del ciclo. La referencia de Jorge ya recorre 200 celdas; falta convertir los IDs a colores.

La implementación acepta el nivel que le entregue el núcleo. La decisión de usar el nivel anterior o posterior a un ascenso sigue siendo un acuerdo pendiente del equipo. Las pruebas aisladas entregan un nivel explícito y no resuelven ese acuerdo.

Los contratos completos están en [INTEGRACION.md](INTEGRACION.md). Para defender los resultados, distinguir siempre entre lógica ejecutada de forma aislada y una partida integrada que todavía requiere cambios del equipo.
