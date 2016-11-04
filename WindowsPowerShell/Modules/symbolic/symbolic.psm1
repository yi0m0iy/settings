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
    $command = "New-Item `'$Link`' -value  `'$Source`' -itemtype SymbolicLink"
    if ($Force) {
      $command += " -force"
    }
  Start-Process -Verb runas -FilePath "PowerShell" -ArgumentList "-noexit -Command ", $Command
  }
}

function Delete-Symbolic {
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

Export-ModuleMember -Function *
