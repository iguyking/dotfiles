Import-Module “$env:ChocolateyInstall\helpers\chocolateyProfile.psm1”

# Make the tab completion work like Bash
Set-PSReadlineKeyHandler -Key Tab -Function Complete
