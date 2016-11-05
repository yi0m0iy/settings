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
Export-ModuleMember -Function *
