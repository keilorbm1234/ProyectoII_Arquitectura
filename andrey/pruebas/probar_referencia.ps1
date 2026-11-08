# Test Andrey's files with an existing checkout of the team's reference version.
# All assembly happens in a new temporary directory. Reference files stay untouched.
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)] [string]$Referencia,
    [Parameter(Mandatory = $true)] [string]$RefCommit,
    [Parameter(Mandatory = $true)] [string]$MarsJar,
    [string]$Java = 'java'
)
$ErrorActionPreference = 'Stop'
$repoPath = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '../..')).Path
$referencePath = (Resolve-Path -LiteralPath $Referencia).Path
$marsPath = (Resolve-Path -LiteralPath $MarsJar).Path
$candidatePath = Join-Path ([IO.Path]::GetTempPath()) ('andrey-integracion-' + [Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $candidatePath | Out-Null
$moduleNames = @('main.asm', 'datos.asm', 'nucleo.asm', 'graficos.asm', 'macros.asm', 'fuente.asm', 'piezas.asm', 'logica.asm')
$referenceHashes = @()
foreach ($moduleName in $moduleNames) {
    $sourcePath = Join-Path $referencePath $moduleName
    $sourceHash = (Get-FileHash -LiteralPath $sourcePath -Algorithm SHA256).Hash
    $referenceHashes += $moduleName + ': ' + $sourceHash
    Copy-Item -LiteralPath $sourcePath -Destination (Join-Path $candidatePath $moduleName)
}
foreach ($ownedModule in @('logica.asm', 'piezas.asm')) {
    Copy-Item -LiteralPath (Join-Path $repoPath $ownedModule) -Destination (Join-Path $candidatePath $ownedModule) -Force
}

$probePath = (Join-Path $PSScriptRoot 'cruce_actual.asm').Replace('\', '/')
$wrapper = @('.include "macros.asm"', '.include "datos.asm"', '.include "piezas.asm"', '.include "fuente.asm"', '.include "logica.asm"', '.include "graficos.asm"', '.include "nucleo.asm"', ('.include "' + $probePath + '"'))
$wrapperPath = Join-Path $candidatePath 'cruce_actual_main.asm'
[IO.File]::WriteAllLines($wrapperPath, $wrapper, (New-Object Text.UTF8Encoding($false)))
$assemblyOutput = & $Java '-Xmx512m' '-Djava.awt.headless=true' '-jar' $marsPath nc a ae1 (Join-Path $candidatePath 'main.asm')
$assemblyExit = $LASTEXITCODE
$probeOutput = @()
$probeExit = -1
if ($assemblyExit -eq 0) {
    $probeOutput = & $Java '-Xmx512m' '-Djava.awt.headless=true' '-jar' $marsPath nc sm ae1 se1 2000000 $wrapperPath
    $probeExit = $LASTEXITCODE
}
$date = [TimeZoneInfo]::ConvertTimeBySystemTimeZoneId([DateTimeOffset]::UtcNow, 'Central America Standard Time').ToString('yyyy-MM-dd')
$record = @(
    ('Fecha: ' + $date + ' (America/Guatemala).'),
    ('Referencia declarada: ' + $RefCommit),
    'Referencia identificada por el llamador; las huellas siguientes fijan el contenido usado.',
    'Candidato: módulos del equipo sin editar, con logica.asm y piezas.asm de la rama de Andrey.',
    ('Directorio temporal del candidato: ' + $candidatePath),
    'El wrapper llama directamente a los procedimientos; no representa una partida ni prueba el teclado.',
    'El nivel de puntaje se entrega explícitamente. No se establece una política de ascenso.',
    ('Ensamblado del main candidato, código de salida: ' + $assemblyExit),
    ('Prueba cruzada, código de salida: ' + $probeExit),
    '', 'SHA256 de los archivos originales de referencia:'
) + $referenceHashes + @('', 'Salida real del ensamblador:') + @($assemblyOutput) + @('', 'Salida real de la prueba cruzada:') + @($probeOutput)
$recordPath = Join-Path $repoPath ('andrey/evidencias/cruce_referencia_' + $date + '.txt')
$recordText = ($record -join [Environment]::NewLine).TrimEnd() + [Environment]::NewLine
[IO.File]::WriteAllText($recordPath, $recordText, (New-Object Text.UTF8Encoding($false)))
Write-Output ('Candidate main assembly exit: ' + $assemblyExit)
$probeOutput | Write-Output
Write-Output ('Temporary candidate: ' + $candidatePath)
Write-Output ('Evidence: ' + $recordPath)
if ($assemblyExit -ne 0 -or $probeExit -ne 0) { exit 1 }
exit 0
