# Aporte de Andrey — Proyecto 2, EIF205

Esta carpeta reúne las pruebas y la documentación de `logica.asm` y `piezas.asm`. La implementación parte de la base existente y conserva sus formas e interfaces cuando es posible.

| Documento | Contenido |
|---|---|
| [PRUEBAS.md](PRUEBAS.md) | Preparación, pasos, resultados esperados y capturas que faltan tomar. |
| [BITACORA_ERRORES.md](BITACORA_ERRORES.md) | Errores, impacto, correcciones, responsables y commits pendientes. |
| [INTEGRACION.md](INTEGRACION.md) | Contratos que Keilor y Jorge necesitan para conectar los módulos. |
| [APORTE_INFORME.md](APORTE_INFORME.md) | Borrador del aporte al informe y explicación de los procedimientos. |
| [evidencias/resultados_mars.txt](evidencias/resultados_mars.txt) | Salida real de las ejecuciones y versión de los archivos comprobados. |
| [evidencias/CAPTURAS_PENDIENTES.md](evidencias/CAPTURAS_PENDIENTES.md) | Lista de capturas todavía pendientes. |

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

La lógica está comprobada de forma aislada. La partida completa requiere que Keilor y Jorge incorporen los contratos de integración; siguen pendientes las capturas y la validación conjunta después de sus cambios.

El trabajo se preparó en `andrey/logica-tablero-10x20`. Antes de crear el commit, revisá los cambios y seleccioná tus archivos:

```powershell
git status --short
git diff -- logica.asm piezas.asm
git add -- logica.asm piezas.asm andrey
```

La traducción previa de `README.md` queda fuera de esa selección. Los commits de implementación y el pull request siguen pendientes; sus identificadores deben registrarse cuando existan.
