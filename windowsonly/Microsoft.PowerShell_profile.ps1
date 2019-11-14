# Make the tab completion work like Bash
Set-PSReadlineKeyHandler -Key Tab -Function Complete

# Remove System PATH to OpenSSH to use my version
$remove = "C:\Windows\System32\OpenSSH\"
$env:Path = ($env:Path.Split(';') | Where-Object -FilterScript {$_ -ne $Remove}) -join ';'

$add = "c:\users\ian\scoop\modules"
$env:PSModulePath = $env:PSModulePath + ';' + $add

# Clean out so Curl works as expected
remove-alias curl -ErrorAction SilentlyContinue

# Setup Git for Powershell
Import-Module oh-my-posh
import-module posh-git

$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true

Function GoGit { Set-Location -Path ~/Desktop/git }
set-alias dg -value GoGit

Function set-sshkeys-fv {
	copy ~/.ssh/id_rsa.filevine ~/.ssh/id_rsa -force
	copy ~/.ssh/id_rsa.pub.filevine ~/.ssh/id_rsa.pub -force
}

Function set-sshkeys-iguyking {
	copy ~/.ssh/id_rsa.iguyking ~/.ssh/id_rsa -force
	copy ~/.ssh/id_rsa.pub.iguyking ~/.ssh/id_rsa.pub -force
}

set-alias set-sshkeys-filevine -value set-sshkeys-fv
set-alias set-sshkeys-home -value set-sshkeys-iguyking
