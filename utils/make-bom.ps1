Param(
  [Parameter(Mandatory=$True,
    position=1)]
  [string[]]$Path

  [switch]$recurse
  [switch]$reverse
)

Push-Location (Split-Path $MyInvocation.MyCommand.Path -parent)
$script = Convert-Path .\I-LOVE-UTF8-WITHBOM.ps1
Pop-Location

foreach ($data in $Path) {
  if ($recurse) {
    foreach ($file in Get-ChildItem $data -Recurse) {
      if (! $file.PSIsContainer) {
        Set-Bom $file.FullName
      }
    }
  } else {
    Set-Bom (Convert-Path $data)
  }
}

function Set-Bom($fileinfo) {
  $fullName = $file.FullName
  if (! $reverse) {
    . $script "$fullname"
  } else {
    . $script -reverse "$fullname"
  }
}

Pop-Location
