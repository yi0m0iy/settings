function Eject-CDROM {
  [CmdletBinding()]
  Param()
  process {
    $wmplayer = New-Object -ComObject WMPlayer.OCX
    $wmplayer.cdromCollection.Item(0).Eject()
  }
}

Export-ModuleMember -Function *
