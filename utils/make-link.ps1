Param(
  [Parameter(Mandatory=$True,
    position=1)]
  [Alias('source')]
  [string]$sourceDir,

  [Parameter(Mandatory=$True,
    position=2)]
  [Alias('link')]
  [string]$linkDir,

  [string[]]$Include,
  [string[]]$Exclude,

  [ValidateSet(
    "Link",
    "File",
    "None")]
  [string[]]$replace="None"
)

$fullSource = Resolve-Path $sourceDir
$fullLink   = Resolve-Path $linkDir

Push-Location $fullSource

foreach ($file in (Get-ChildItem $sourceDir -Recurse)) {
  if ($Include -eq $null) {
    $isInclude = $True
  } else {
    $isInclude = Judge-Str $file.Name -Patterns $Include
  }

  if ($Exclude -eq $null) {
    $isExclude = $False
  } else {
    $isExclude = Judge-Str $file.Name -Patterns $Exclude -NotLike
  }

  if (!$isInclude -or $isExclude) {
    continue
  }

  $sourcePath   = $file.FullName
  $relativePath = Resolve-Path -Relative $sourcePath
  $linkPath   = Join-Path $fullLink $relativePath
  if (-Not (Test-Path $linkPath)) {
    #need Administor
    New-Item "$linkPath" -value "$sourcePath" -ItemType SymbolicLink
    continue
  } elseif ($replace -eq "None") {
    continue
  }

  $fileInfo = Get-Item $linkPath
  $isLink = $fileInfo.LinkType -ne $null
  $isFile = !$fileInfo.PSIsContainer -and !$fileInfo.Target
  if (($replace -eq "Link") -and $isLink) {
    New-Item "$linkPath" -value "$sourcePath" -ItemType SymbolicLink -Force
  } elseif(($replace -eq "File") -and $isFile) {
    New-Item "$linkPath" -value "$sourcePath" -ItemType SymbolicLink -Force
  }
}

Pop-Location
