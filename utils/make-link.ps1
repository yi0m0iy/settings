Param(
  [Parameter(Mandatory=$True,
    position=1)]
  [Alias('source')]
  [string]$sourceDir,

  [Parameter(Mandatory=$True,
    position=2)]
  [Alias('link')]
  [string]$linkDir,

  [switch]$reflesh
)

$fullSource = Resolve-Path $sourceDir
$fullLink   = Resolve-Path $linkDir

Push-Location $fullSource

foreach ($file in (Get-ChildItem $sourceDir -Recurse)) {
  $sourcePath   = $file.FullName
  $relativePath = Resolve-Path -Relative $sourcePath
  $linkPath   = Join-Path $fullLink $relativePath
  if (-Not (Test-Path $linkPath)) {
    #need Administor
    New-Item "$linkPath" -value "$sourcePath" -ItemType SymbolicLink
    continue
  } elseif (!$reflesh) {
    continue
  }
  $fileInfo = Get-Item $linkPath
  if ($fileInfo.LinkType -eq "SymbolicLink") {
    $fileInfo.Delete()
    New-Item "$linkPath" -value "$sourcePath" -ItemType SymbolicLink
  }
}

Pop-Location
