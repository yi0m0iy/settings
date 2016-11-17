function Like-Str {
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory=$True,
      position=1)]
    [string]$str,

    [Parameter(Mandatory=$True)]
    [string[]]$Patterns,

    [switch]$NotLike
  )
  process {
    $isLike = ($Patterns|%{$str -like $_}) -eq $True
    return $islike -xor $NotLike
  }
}

Export-ModuleMember -Function *
