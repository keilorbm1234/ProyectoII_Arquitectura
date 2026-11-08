# Entrega individual de Andrey

Estado comprobado el **2026-11-06**. Este cierre corresponde a lógica, piezas, pruebas y documentación. La partida completa sigue pendiente de conectar las llamadas del núcleo y los colores de los gráficos.

| Requisito de Andrey | Entrega |
|---|---|
| Tablero 10 × 20 y límites | Seis procedimientos adaptados a ANCHO/ALTO; límites comprobados antes de acceder al tablero. |
| Registros y pila | Correcciones de fila superior y récord; conservación verificada en las tres suites. |
| IDs 1–7 | Fijación con `tipo+1`, colisión por valor no nulo y desplazamiento que conserva cada ID. |
| Puntaje por conjunto | Cuenta por llamada, retorno de líneas y premios 100/300/500/800 multiplicados por el nivel recibido. |
| Caída instantánea | Descenso por cada fila, fijación inmediata y contrato para finalizar la jugada una vez. |
| Wall kick | Intentos en X, X−1 y X+1; cancelación sin cambiar X/orientación. |
| Piezas | Siete tipos y rotaciones originales conservados y documentados. |
| Pruebas | 235 escenarios y 37 911 comprobaciones aprobadas; 31 vistas exportadas de MARS. |
| Prueba cruzada | Base antigua registrada y referencia remota actual probada: 36/43 comparaciones aprobadas; siete fallos de color asignados a Jorge. |
| Bitácora e informe | [Bitácora](BITACORA_ERRORES.md), [aporte al informe](APORTE_INFORME.md) y [guía de defensa](DEFENSA.md). |

La implementación está en `logica.asm` y `piezas.asm`, dentro del commit real `f74780c`. Las herramientas y las 31 vistas están en el commit real `fe5767b`. Esta etapa solo cambia `andrey/`; el historial completo puede consultarse con `git log --oneline -- andrey`.

## Referencia actual y límites de la validación

Se consultó el [main remoto d4c1810](https://github.com/keilorbm1234/ProyectoII_Arquitectura/commit/d4c181045f870ede460be3f0c2591b48f41d33f2). Se verificaron los ocho archivos descargados contra sus blob SHA y se construyó un candidato temporal con esos módulos sin editar y la lógica/piezas de Andrey. El main candidato ensambla. Las 27 comparaciones de lógica/núcleo y las nueve de registros/piso gráfico pasan; las siete de color fallan.

La rama local conserva los módulos de la base antigua: no se hizo un merge que los sustituyera. Por eso su `main.asm` todavía produce el error de constantes, aunque el candidato con la referencia actual ya ensamble. Ambos resultados tienen registros separados.

Las imágenes son exportaciones directas de los componentes reales de MARS con `JFrame.printAll`. No son capturas del escritorio. Los registros y las consolas documentan valores observados después de ejecutar los programas. No hay evidencia inventada de una partida completa.

## Acciones que faltan para cerrar el juego completo

1. Keilor: conectar W con `log_rotate_with_kick` y espacio con `log_hard_drop`; finalizar una sola vez las jugadas de teclado y gravedad; llamar al puntaje y a la actualización de nivel; evitar una nueva pieza al ganar y omitir la gravedad después del espacio. Acordar qué nivel se entrega para una jugada que cambia de nivel.
2. Jorge: elegir el color de cada celda ocupada mediante `ALL_COLORS_TABLE[ID−1]`. Los gráficos actuales usan un solo color.
3. Integrar las ramas tomando los módulos actuales del equipo y conservando la lógica de Andrey. Volver a probar el teclado, una partida, el cambio de nivel y la victoria desde el flujo del juego.

Los [contratos de integración](INTEGRACION.md) detallan argumentos, retornos y ubicaciones actuales. Los ajustes de los otros responsables no se aplicaron desde esta entrega.

## Descripción preparada para el pull request

**Título:** Completar lógica de Tetris 10 × 20: IDs, puntaje, caída instantánea y wall kick.

**Descripción:** Adapta la lógica del tablero a ANCHO/ALTO, valida colisiones y fijaciones, conserva IDs de piezas y corrige registros preservados. Agrega el conteo de líneas por jugada, el cálculo de puntaje con nivel recibido, la caída instantánea y el corrimiento sencillo al rotar. Conserva las formas originales y documenta sus tablas.

**Validación:** tres suites de MARS aprobadas, con 235 escenarios y 37 911 comparaciones; 31 vistas del simulador, bitácora y aporte al informe. El candidato con el main remoto `d4c1810` ensambla y sus 27 comparaciones de contrato lógica/niveles pasan. Quedan siete fallos de color y las llamadas del núcleo por integrar según INTEGRACION.md; no se declara aprobada una partida completa.

Este texto está preparado localmente. No afirma que el pull request ya exista o que se hayan enviado estos cambios a GitHub.
