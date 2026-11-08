# Compile the capture helper outside the repository, then use the real MARS GUI.
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)] [string]$MarsJar,
    [string]$Java = 'java',
    [string]$Javac = 'javac',
    [ValidateRange(0, 100)] [int]$Limite = 0,
    [Alias('CruceActual')] [string]$ArchivoCruce = ''
)
$ErrorActionPreference = 'Stop'
$marsPath = (Resolve-Path -LiteralPath $MarsJar).Path
$repoPath = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '../..')).Path
$buildPath = Join-Path ([IO.Path]::GetTempPath()) ('andrey-mars-capturas-' + [Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $buildPath | Out-Null
& $Javac '-encoding' 'UTF-8' '-sourcepath' $buildPath '-classpath' $marsPath '-d' $buildPath (Join-Path $PSScriptRoot 'CapturarMars.java')
if ($LASTEXITCODE -ne 0) { throw 'The capture helper did not compile.' }
if ($ArchivoCruce) {
    $currentProbe = (Resolve-Path -LiteralPath $ArchivoCruce).Path
    & $Java '-Xmx768m' '-classpath' ($buildPath + [IO.Path]::PathSeparator + $marsPath) 'CapturarMars' $repoPath $Limite $currentProbe
} else {
    & $Java '-Xmx768m' '-classpath' ($buildPath + [IO.Path]::PathSeparator + $marsPath) 'CapturarMars' $repoPath $Limite
}
if ($LASTEXITCODE -ne 0) { throw 'MARS capture stopped; inspect the error before using its output.' }
