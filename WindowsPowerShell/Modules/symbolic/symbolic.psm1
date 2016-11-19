function New-Symbolic {
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory=$True,
      Position=1)]
    [string]$Source,

    [Parameter(Mandatory=$True,
      Position=2)]
    [string]$Link,

    [switch]$Force
  )

  process {
    if (!$Force) {
      New-Item $Link -value $Source -itemtype SymbolicLink
    } else {
      New-Item $Link -value $Source -itemtype SymbolicLink
    }
  }
}

function Remove-Symbolic {
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory=$True,
      Position=1)]
    [string]$Path
  )

  process {
    $fileInfo = Get-Item $Path
    if ($fileInfo.LinkType -eq "SymbolicLink") {
      $fileInfo.Delete()
    }
  }
}

function Get-RealItem {
  [CmdletBinding()]
  Param(
  [Parameter(Mandatory=$True,
    position=1)]
  [string]$Path
  )

  process {
    $fileInfo = Get-Item $Path
    while ($fileInfo.Target) {
      Push-Location (Split-Path $fileInfo.Path -parent)
      $fileInfo = Get-Item $fileInfo.Target
      Pop-Location
    }
    return $fileInfo
  }
}

Set-Alias lns New-Symbolic
Set-Alias ns New-Symbolic
Set-Alias rms Remove-Symbolic
Set-Alias ds Remove-Symbolic
Set-Alias gri Get-RealItem

Export-ModuleMember -Function * -Alias *
