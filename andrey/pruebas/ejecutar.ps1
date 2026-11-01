# Run standalone logic tests; optionally check the current graphics contract.
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$MarsJar,
    [string]$Java = 'java',
    [switch]$CruzarGraficos
)

$ErrorActionPreference = 'Stop'
$marsPath = (Resolve-Path -LiteralPath $MarsJar).Path
$testCases = @(
    @{ File = 'etapa1.asm'; Assertions = 4580 },
    @{ File = 'etapa2.asm'; Assertions = 12311 },
    @{ File = 'etapa3.asm'; Assertions = 21020 }
)
$failed = $false
foreach ($testCase in $testCases) {
    $testPath = Join-Path $PSScriptRoot $testCase.File
    $testOutput = & $Java '-Xmx512m' '-Djava.awt.headless=true' '-jar' $marsPath nc sm ae1 se1 2000000 $testPath
    $testExit = $LASTEXITCODE
    $outputText = ($testOutput | Out-String).Trim()
    Write-Output ($testCase.File + ': ' + $outputText)
    if ($testExit -ne 0 -or $outputText -notmatch ('(?m)^PASS assertions: ' + $testCase.Assertions + '$')) {
        $failed = $true
        Write-Warning ($testCase.File + ' failed; exit code ' + $testExit)
    }
}

if ($CruzarGraficos) {
    $crossPath = Join-Path $PSScriptRoot 'cruce_graficos.asm'
    $crossOutput = & $Java '-Xmx512m' '-Djava.awt.headless=true' '-jar' $marsPath nc sm ae1 se1 2000000 $crossPath
    $crossExit = $LASTEXITCODE
    Write-Output ('cruce_graficos.asm:' + [Environment]::NewLine + ($crossOutput | Out-String).Trim())
    if ($crossExit -ne 0) {
        $failed = $true
        Write-Warning 'Graphics contract checks failed. Record the evidence and coordinate with Jorge.'
    }
}

if ($failed) { exit 1 }
exit 0
