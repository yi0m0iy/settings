#FUCK BOM
Param(
  [Parameter(Mandatory=$True,
    position=1)]
  [string]$Path,

  [switch]$reverse,
  [switch]$lf
)

if (Test-Path $Path) {
  $fileInfo = Get-Item $Path
  while ($fileInfo.Target) {
    $Path = $fileInfo.Target
    $fileInfo = Get-Item $Path
  }
  if (!$reverse -and !$lf) {
    nkf --overwrite -Lw --oc=UTF-8-BOM $Path
  } elseif(!$reverse -and $lf) {
    nkf --overwrite -Lu --oc=UTF-8-BOM $Path
  } elseif($reverse -and !$lf) {
    nkf --overwrite -Lw --oc=UTF-8 $Path
  } elseif($reverse -and $lf) {
    nkf --overwrite -Lu --oc=UTF-8 $Path
  }
}
