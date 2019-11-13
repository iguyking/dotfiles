#Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"

# Make the tab completion work like Bash
Set-PSReadlineKeyHandler -Key Tab -Function Complete


# Remove System PATH to OpenSSH to use my version
$remove = "C:\Windows\System32\OpenSSH\"
$env:Path = ($env:Path.Split(';') | Where-Object -FilterScript {$_ -ne $Remove}) -join ';'

