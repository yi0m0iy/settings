function Eject-CDROM {
  [CmdletBinding()]
  Param()
  process {
    $wmplayer = New-Object -ComObject WMPlayer.OCX
    $wmplayer.cdromCollection.Item(0).Eject()
  }
}

Set-Alias eject Eject-CDROM
Export-ModuleMember -Function * -Alias *
