# Registro de vistas de MARS

Actualizado el **2026-11-06**, zona America/Guatemala. Se conservó el nombre del archivo para mantener los enlaces existentes. Hay **31 imágenes PNG**: 29 de los 16 grupos originales y dos de la prueba con el main remoto actualizado. Están acompañadas de registros de estado o consola.

Las imágenes se exportaron con `JFrame.printAll` desde los componentes reales de MARS 4.5, después de ejecutar las suites existentes. Son exportaciones de la ventana, **no capturas del escritorio**. No se dibujaron resultados esperados ni se retocaron valores. Los primeros intentos de captura del escritorio produjeron imágenes negras; fueron reemplazados por estas exportaciones, cuyo método figura en los registros de estado. La herramienta no modifica registros ni memoria MIPS para producirlas.

Cada PNG de lógica tiene al lado un `.txt` del mismo nombre: fecha, suite, caso, PC, retornos, argumentos observados, registros y las 200 celdas del tablero. La prueba cruzada incluye su salida real. Las preparaciones y expectativas están en [PRUEBAS.md](../PRUEBAS.md).

| Caso y suite / escenarios | Vistas existentes | Resultado observado |
|---|---|---|
| P01 · etapa1 / 001 | [Inicio](capturas/P01_inicializacion.png), [extremo inferior](capturas/P01_extremo_inferior.png) | Tablero vacío y centinelas 123456789. |
| P02 · etapa1 / 004, 006 | [Izquierda](capturas/P02_pared_izquierda.png), [derecha](capturas/P02_pared_derecha.png) | `$v0=1` en ambas paredes. |
| P03 · etapa1 / 008, 009 | [Piso](capturas/P03_piso.png), [límite superior](capturas/P03_limite_superior.png) | `$v0=1` para ambos límites inválidos. |
| P04 · etapa1 / 022 | [Aparición bloqueada](capturas/P04_aparicion_bloqueada.png) | Un bloque ID 7 causa colisión. No prueba el estado de fin de partida del núcleo. |
| P05 · etapa2 / 028 y etapa1 / 024 | [IDs](capturas/P05_ids.png), [rechazo](capturas/P05_fijacion_rechazada.png) | Tipo 6 almacenado como ID 7; posición inválida rechazada sin fijación parcial. |
| P06 · etapa3 / 062, 063 | [Corrimiento izquierdo](capturas/P06_kick_izquierda.png), [derecho](capturas/P06_kick_derecha.png) | `$v0=1`, `$v1=-1/+1`; X y orientación actualizadas. |
| P07 · etapa3 / 064, 066 | [Prioridad](capturas/P07_prioridad.png), [cancelación](capturas/P07_rotacion_cancelada.png) | Izquierda prioritaria; cancelación conserva X=3 y orientación 0. |
| P08 · etapa3 / 030 | [Caída ante obstáculo](capturas/P08_caida_obstaculo.png) | O queda en Y=3; distancia 3, estado 0. |
| P09 · etapa3 / 031, 033 | [Distancia cero](capturas/P09_distancia_cero.png), [repetición](capturas/P09_repeticion.png) | Distancia 0 con éxito; repetición inmediata con estado 1. |
| P10 · etapa1 / 034–037 | [Una](capturas/P10_una_linea.png), [dos](capturas/P10_dos_lineas.png), [tres](capturas/P10_tres_lineas.png), [cuatro](capturas/P10_cuatro_lineas.png) | Retornos y acumulados de 1, 2, 3 y 4; puntaje sin cambios. |
| P11 · etapa1 / 033 | [Desplazamiento con IDs](capturas/P11_desplazamiento_ids.png) | Fila superior vacía y patrón de IDs desplazado. El registro contiene las 200 celdas. |
| P12 · etapa1 / 002 | [Fila superior](capturas/P12_fila_superior.png) | Primera fila vacía; marcador 6 de la fila siguiente conservado. |
| P13 · etapa2 / 044, 081 | [Nivel 3](capturas/P13_puntaje_nivel3.png), [nivel 10](capturas/P13_puntaje_nivel10.png) | 900/8000 puntos; totales 2134/9234; líneas=17. |
| P14 · etapa3 / 089 | [Después de fijar](capturas/P14_caida_fijada.png), [después de borrar](capturas/P14_lineas_borradas.png), [después de puntuar](capturas/P14_finalizacion_unica.png) | Puntaje/líneas: 1234/7 → 1234/11 → 2834/11. |
| P15 · etapa1 / 042 | [Registros, pila y récord](capturas/P15_registros_pila.png) | `$s0–$s7=1000..1007`, pila restaurada y récord=800. |
| P16 · cruce_graficos / base antigua | [Prueba cruzada histórica](capturas/P16_cruce_graficos.png) | XJ01 y XJ02 se reproducen en la base local. No describe el main remoto actual. |
| P17 · cruce_actual / referencia d4c1810 | [Gráficos actuales](capturas/P17_graficos_actuales.png) | Registros y piso pasan. Los siete colores fallan: todos se dibujan como 2278750. |
| P18 · cruce_actual / referencia d4c1810 | [Contratos y niveles](capturas/P18_contratos_actuales.png) | Las 27 comparaciones lógica/núcleo pasan; el total de la prueba es 36/43 por los siete colores. |

Consolas finales: [etapa 1](capturas/etapa1.asm.consola.txt), [etapa 2](capturas/etapa2.asm.consola.txt), [etapa 3](capturas/etapa3.asm.consola.txt). Las tres muestran `PASS` con 4580, 12311 y 21020 comprobaciones.

Las evidencias de una partida completa y de sus controles siguen pendientes de integrar las llamadas del núcleo. El [ensamblado de la base local](ensamblado_integracion_2026-11-06.txt) termina con código 1 por las constantes aún no definidas en esa copia. En cambio, el [main candidato con módulos remotos actuales y lógica de Andrey](cruce_referencia_2026-11-06.txt) ensambla con código 0 y permite ejecutar la prueba P17/P18. Se comprueba la victoria mediante una llamada directa al núcleo, sin presentar una partida completa como aprobada.

El driver P16 tiene una [protección comprobada](proteccion_prueba_heredada_2026-11-06.txt): si se usa después de reducir la reserva a 800 bytes, imprime SKIP y sale con código 2 antes de escribir. Para la versión actual se usa `probar_referencia.ps1`; no se reutiliza la sonda gráfica del diseño antiguo.
