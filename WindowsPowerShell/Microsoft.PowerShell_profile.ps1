chcp 65001
$OutputEncoding = [system.Text.Encoding]::UTF8
$env:path = @(
  $env:path,
  "$HOME\Software\cmder",
  "$HOME\App",
  "C:\Program Files\Python35",
  "$HOME\AppData\Roaming\Python\Python35\Scripts",
  "C:\Program Files\Python35\Scripts",
  "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\ClangC2\bin\amd64"
) -join ";"
$ProjectHome = "$HOME\Work\GitProject"

$negineesan = @"
  Y
川▽▽
"@

$negiRSS = "https://queryfeed.net/tw?q=%40negineesan_bot"
$isOnline = Test-Connection queryfeed.net -count 1
if ($isOnline) {
  filter private:Get-Word {
    if ($_.description.ChildNodes.Value -match "<.*>(.*)<.*>") {
      return $matches[1]
    }
  }
  $rss = New-Object xml
  $rss.Load($negiRSS)
  $negiWords = $rss.rss.channel.item|Get-Word
}

function Prompt {
  if ($?) {
    $word = "はい"
    $color = "Green"
  } else {
    $word = "はいじゃないが"
    $color = "Red"
  }

  if ($isOnline -and ((Get-Random 100) -le 5)) {
    $word = $negiWords[(Get-Random $negiWords.Length)-1]
  }

  Write-Host ($negineesan + $word) -NoNewLine -ForegroundColor $color
  Write-VcsStatus
  Write-Host
  Write-Host (Split-Path -Leaf $pwd.Path) -NoNewLine
  return " λ "
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
