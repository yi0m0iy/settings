Push-Location (Split-Path $MyInvocation.MyCommand.Path -parent)

.\make-link.ps1 "..\WindowsPowerShell\" "$HOME\Documents\WindowsPowerShell\" -Replace File, Link
.\make-bom.ps1 "..\WindowsPowerShell\"
.\make-link.ps1 "..\Keyhac" "$HOME\AppData\Roaming\Keyhac\" -Replace File, Link
.\make-link.ps1 "..\HOME" $HOME -Replace Link
.\make-link.ps1 "..\_atom" "$HOME\.atom" -Replace Link, File

Pop-Location
