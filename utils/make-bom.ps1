Param(
  [Parameter(Mandatory=$True,
    position=1)]
  [string]$Path,

  [string[]]$Include,
  [string[]]$Exclude,
  [switch]$Reverse
)

Push-Location (Split-Path $MyInvocation.MyCommand.Path -parent)
$script = Convert-Path ".\I-LOVE-UTF8-WITHBOM.ps1"
Pop-Location

function Set-Bom {
  Param(
    [Parameter(Mandatory=$True,
      position=1)]
    [string]$Path,

    [switch]$Reverse
  )
  process {
    if (! $Reverse) {
      . $script "$Path"
    } else {
      . $script -reverse "$Path"
    }
  }
}

foreach ($file in Get-ChildItem $Path -Recurse) {
  if ($file.PSIsContainer) {
    continue
  }

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

  if ($isInclude -and !$isExclude -and !$Reverse) {
    Set-Bom $file.FullName
  } elseif ($isInclude -and !$isExclude -and $Reverse) {
    Set-Bom $file.FullName -Reverse
  }
}
