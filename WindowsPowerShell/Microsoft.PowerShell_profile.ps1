chcp 65001
set-location $HOME
$env:path += ";C:\Program Files\Python35"
$env:path += ";$HOME\Software\cmder"
function pip(){python -m pip $args}
function ipython(){python -m IPython $args}
function pep8(){python -m pep8 $args}
function sudo(){Start-Process $args -Verb runas}
# Load posh-git example profile
. "$HOME\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1"
