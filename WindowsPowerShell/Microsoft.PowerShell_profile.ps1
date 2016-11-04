chcp 65001
$global:OutputEncoding = [system.Text.Encoding]::UTF8
$env:path = @(
  $env:path,
  "$HOME\Software\cmder",
  "$HOME\App",
  "C:\Program Files\Python35",
  "$HOME\AppData\Roaming\Python\Python35\Scripts",
  "C:\Program Files\Python35\Scripts",
  "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\ClangC2\bin\amd64",
  "$HOME\Software\vim80-kaoriya-win64-8.0.0039-20161016\vim80-kaoriya-win64"
) -join ";"

$negineesan = @"
  Y
川▽▽
"@
function Prompt {
  if($?) {
    Write-Host ($negineesan + "はい") -NoNewLine -ForegroundColor "Green"
  } else {
    Write-Host ($negineesan + "はいじゃないが") -NoNewLine -ForegroundColor "Red"
  }
  Write-VcsStatus
  Write-Host
  return "λ "
}

Set-Alias pushdx Push-Location-Ex
Set-Alias cdx Push-Location-Ex
Set-Alias x Push-Location-Ex
Set-Alias popdx Pop-Location-Ex
Set-Alias cd- Pop-Location-Ex
Set-Alias lns New-Symbolic
Set-Alias ns New-Symbolic
Set-Alias rms Delete-Symbolic
Set-Alias ds Delete-Symbolic

Start-SshAgent -Quiet
