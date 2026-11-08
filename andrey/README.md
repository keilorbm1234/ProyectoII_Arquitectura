# Aporte de Andrey — Proyecto 2, EIF205

Esta carpeta reúne las pruebas y la documentación de `logica.asm` y `piezas.asm`. La implementación parte de la base existente y conserva sus formas e interfaces cuando es posible.

| Documento | Contenido |
|---|---|
| [PRUEBAS.md](PRUEBAS.md) | Preparación, pasos, expectativas, resultados reales y vistas exportadas. |
| [BITACORA_ERRORES.md](BITACORA_ERRORES.md) | Errores, impacto, correcciones, responsables y commits pendientes. |
| [INTEGRACION.md](INTEGRACION.md) | Contratos que Keilor y Jorge necesitan para conectar los módulos. |
| [APORTE_INFORME.md](APORTE_INFORME.md) | Aporte individual al informe, procedimientos y evidencias. |
| [DEFENSA.md](DEFENSA.md) | Guía sencilla de ensamblador y decisiones para explicar el aporte. |
| [ENTREGA.md](ENTREGA.md) | Cierre individual, pendientes del equipo y texto preparado para el pull request. |
| [evidencias/resultados_mars.txt](evidencias/resultados_mars.txt) | Salida real de las ejecuciones y versión de los archivos comprobados. |
| [evidencias/resultados_2026-11-06.txt](evidencias/resultados_2026-11-06.txt) | Revalidación con las vistas exportadas, consolas y estado de integración. |
| [evidencias/cruce_referencia_2026-11-06.txt](evidencias/cruce_referencia_2026-11-06.txt) | Prueba con el main remoto actual, sin editar los módulos del equipo. |
| [evidencias/CAPTURAS_PENDIENTES.md](evidencias/CAPTURAS_PENDIENTES.md) | Índice de evidencias visuales y estado de la validación integrada. |

## Ejecutar las pruebas de lógica

Desde la raíz del repositorio, con Java y MARS 4.5 disponibles:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\andrey\pruebas\ejecutar.ps1 -MarsJar "$env:USERPROFILE\Downloads\Mars4_5.jar"
```

La opción de política se aplica únicamente a ese proceso de PowerShell. La ruta del JAR puede cambiarse; `-Java` permite indicar una ruta a Java si no está en `PATH`.

La salida esperada de las tres suites es:

```text
etapa1.asm: PASS assertions: 4580
etapa2.asm: PASS assertions: 12311
etapa3.asm: PASS assertions: 21020
```

Son 235 escenarios y 37 911 comprobaciones, sin activar delayed branching. `FAIL assertion ID: N` identifica la primera comparación que falló; ese ID puede buscarse en las instrucciones o fixtures de la suite.

Para incluir la prueba cruzada, agregá `-CruzarGraficos` al comando. Al registrar esta versión, esa prueba detectó dos incumplimientos de integración y el script terminó con código 1. Las tres suites de lógica sí pasaron; los detalles están en las evidencias y la bitácora.

## Abrir una suite en MARS

Abrí **uno** de estos archivos, ensamblalo y ejecutalo:

- [pruebas/etapa1.asm](pruebas/etapa1.asm): 42 casos de tablero, límites, registros y récord.
- [pruebas/etapa2.asm](pruebas/etapa2.asm): 104 casos de identificadores, conteo y puntaje.
- [pruebas/etapa3.asm](pruebas/etapa3.asm): 89 casos de caída instantánea y rotación.

Cada escenario tiene una etiqueta `log_test_case_NNN`. Para inspeccionarlo, buscá esa etiqueta y colocá una interrupción después de la llamada al procedimiento que querés observar. No actives el ensamblado conjunto de todos los archivos de la carpeta: cada suite tiene su propio `main`.

`datos_prueba.asm` aporta datos sintéticos y un tablero de exactamente 800 bytes, rodeado de centinelas. No se incluye en `main.asm` ni reemplaza el `datos.asm` de Keilor. Las suites incluyen los archivos reales de lógica y piezas mediante rutas relativas. No necesitan las antiguas rutas temporales de esta computadora.

## Estado de integración y Git

La lógica está comprobada de forma aislada y sus vistas de MARS están exportadas. La partida completa requiere que Keilor y Jorge incorporen los contratos de integración; la validación conjunta sigue pendiente después de sus cambios.

El 2026-11-06 también se consultó el main remoto `d4c1810`, que ya incluye dimensiones, ciclo completo y gráficos de 200 celdas. En un candidato temporal con la lógica de Andrey, el main ensambla. La prueba cruzada tiene 36/43 comparaciones aprobadas: las siete fallidas son de colores de IDs; las 27 del contrato lógica/núcleo pasan. Los pendientes vigentes están en [INTEGRACION.md](INTEGRACION.md), separados de los errores de la base antigua.

El trabajo se preparó en `andrey/logica-tablero-10x20`. El commit real `f74780c`, del 2026-11-01, contiene la implementación y la primera documentación. `fe5767b`, del 2026-11-06, contiene las herramientas, la protección del driver y las evidencias verificadas. Para preparar cambios posteriores, revisar primero el estado y seleccionar los archivos propios:

```powershell
git status --short
git diff -- logica.asm piezas.asm
git add -- logica.asm piezas.asm andrey
```

La traducción previa de `README.md` ya está incluida en `f74780c`. Los cambios de esta etapa quedan dentro de `andrey/`. La publicación y el estado del pull request deben verificarse en GitHub; este documento no afirma que se haya creado uno.

## Reproducir las vistas de MARS

La herramienta [pruebas/capturar.ps1](pruebas/capturar.ps1) requiere el JAR de MARS 4.5, Java y un JDK que aporte `javac`, además de una sesión gráfica. Compila [CapturarMars.java](pruebas/CapturarMars.java) en una carpeta temporal y ejecuta las suites existentes desde el principio. Localiza las llamadas de cada caso y coloca interrupciones mediante la interfaz de MARS.

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\andrey\pruebas\capturar.ps1 -MarsJar "$env:USERPROFILE\Downloads\Mars4_5.jar"
```

`-Java` y `-Javac` permiten proporcionar rutas explícitas. `-Limite 1` exporta solamente la primera vista y completa esa suite; sin límite se recorren las tres y la prueba cruzada. Una ejecución vuelve a generar los archivos de evidencia de los mismos casos.

Las imágenes son exportaciones directas de los componentes reales de MARS con `JFrame.printAll`, después de ejecutar el código y detenerlo. No son capturas del escritorio ni dibujos de resultados esperados. El método evita que una pantalla negra del escritorio oculte la ventana. Cada vista de lógica tiene un `.txt` con fecha, suite, caso, retornos, registros y las 200 celdas observadas. El script no escribe valores en registros o memoria MIPS para preparar la imagen: la preparación pertenece a las suites existentes.

El código de salida 0 de esta herramienta confirma la exportación y los resultados de las suites propias. La prueba cruzada conserva los resultados que observe, incluidos fallos; para exigir también su aprobación se usa `ejecutar.ps1 -CruzarGraficos`.

## Probar con los módulos actualizados del equipo

Con una copia separada de los ocho ASM de la referencia deseada:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\andrey\pruebas\probar_referencia.ps1 -Referencia 'RUTA_A_LA_COPIA_DEL_EQUIPO' -RefCommit 'd4c181045f870ede460be3f0c2591b48f41d33f2' -MarsJar "$env:USERPROFILE\Downloads\Mars4_5.jar"
```

El script copia esos archivos a una carpeta temporal y añade allí los archivos de lógica/piezas de Andrey. No cambia la copia de referencia ni esta rama. Ensambla el main candidato, ejecuta las 43 comparaciones del driver y registra salidas y huellas de los módulos. `-RefCommit` identifica la versión que aporta el llamador; las huellas fijan el contenido usado. En la ejecución registrada se verificaron previamente los ocho blob SHA contra GitHub.

El script imprime la ruta temporal de `cruce_actual_main.asm`. Para exportar sus vistas sin repetir las tres suites, ejecutar `capturar.ps1` con `-ArchivoCruce 'RUTA_AL_WRAPPER'`, además de `-MarsJar` y las rutas Java/Javac necesarias. El modo de exportación no convierte fallos de gráficos en aprobaciones.

`cruce_graficos.asm` corresponde al diseño antiguo y ahora verifica su reserva antes de escribir. Con datos de 800 bytes sale con código 2 y un mensaje SKIP; para la versión nueva se usa la prueba de referencia.
