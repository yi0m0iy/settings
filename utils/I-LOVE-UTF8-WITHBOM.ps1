#FUCK BOM

Param(
  [Parameter(Mandatory=$True,
    position=1)]
  [string]$Source

  [switch]$reverse
)

if (Test-Path $Source) {
  $text = Get-Content $Source -Encoding UTF8
  if (! $reverse) {
    Out-File -InputObject $text -FilePath $Source -Encoding UTF8
  } else {
    $byteText = [Text.Encoding]::UTF8.GetBytes($text)
    Set-Content -Path $Source -Value $byteText -Encoding Byte
  }
}