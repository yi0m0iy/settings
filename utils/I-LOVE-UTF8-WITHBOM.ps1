#FUCK BOM
Param(
  [Parameter(Mandatory=$True,
    position=1)]
  [string]$Source,

  [switch]$reverse
)

if (Test-Path $Source) {
  $text = Get-Content $Source -Encoding UTF8
  if (!$reverse) {
    Out-File -InputObject $text -FilePath $Source -Encoding UTF8
  } else {
    [IO.File]::WriteAllLines($Source, $text)
  }
}
