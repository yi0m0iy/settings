function Push-Location-Ex {
  [CmdletBinding()]
  Param(
    [Parameter(Position=1)]
    [string]$Path
  )

  process {
    Push-Location $Path
    Get-ChildItem|Format-Wide -autosize
  }
}
function Pop-Location-Ex {
  [CmdletBinding()]
  Param()
  process {
    Pop-Location
    Get-ChildItem|Format-Wide -autosize
  }
}

function Set-New-Directory {
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory=$True,
      Position=1)]
    [string]$Path
  )

  process {
    New-Item -Path $Path -ItemType Directory
    Push-Location-Ex $Path
  }
}

Set-Alias pushdx Push-Location-Ex
Set-Alias cdx Push-Location-Ex
Set-Alias x Push-Location-Ex
Set-Alias popdx Pop-Location-Ex
Set-Alias cd- Pop-Location-Ex
Set-Alias snd Set-New-Directory
Set-Alias mkcd Set-New-Directory

Export-ModuleMember -Function * -Alias *
