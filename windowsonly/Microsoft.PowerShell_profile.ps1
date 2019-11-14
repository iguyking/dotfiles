# Make the tab completion work like Bash
Set-PSReadlineKeyHandler -Key Tab -Function Complete

# Remove System PATH to OpenSSH to use my version
$remove = "C:\Windows\System32\OpenSSH\"
$env:Path = ($env:Path.Split(';') | Where-Object -FilterScript {$_ -ne $Remove}) -join ';'

# Clean out so Curl works as expected
Remove-item Alias:\curl

# Setup Git for Powershell
Import-Module oh-my-posh
import-module posh-git

$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
