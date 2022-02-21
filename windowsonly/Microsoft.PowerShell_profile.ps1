# ahh yes... this would be so nice if it was a built in variable
$here = Split-Path -Parent $MyInvocation.MyCommand.Path

# Set so pip won't run without a virtualenv
$env:PIP_REQUIRE_VIRTUALENV=1

# Set VISUAL to use vim
$env:VISUAL="nvim"
$env:EDITOR="nvim"

# Make the tab completion work like Bash
Set-PSReadlineKeyHandler -Key Tab -Function Complete

# Remove System PATH to OpenSSH to use my version
$remove = "C:\Windows\System32\OpenSSH\"
$env:Path = ($env:Path.Split(';') | Where-Object -FilterScript {$_ -ne $Remove}) -join ';'

$add = "~\scoop\modules"
$env:PSModulePath = $env:PSModulePath + ';' + $add

# Clean out so Curl works as expected
if (Test-Path Alias:curl) { remove-item alias:curl }


# Setup Git for Powershell 
#import-module oh-my-posh
import-module posh-git

import-module terminal-icons

#$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
#set-theme agnoster

function GoGit { Set-Location -Path ~/Desktop/git }
set-alias dg -value GoGit

#Set-Alias g -value gvim                                                    
Set-Alias vim -value nvim

# z directory fun
#import-module zlocation


## Load all functions into the system

gci $here\functions\*.ps1 | %{. $_}

# Enable Starship Prompt
Invoke-Expression (&starship init powershell)
