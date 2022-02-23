# Script to install all dependencies needed for these dotfiles to work
# TODO: Fix so can be run more than once

# Set in install.ps1 & daily-sync.ps1
$MyBinaries = "$env:USERPROFILE\Documents\Binaries"
mkdir -path $MyBinaries -erroraction silentlycontinue

scoop config shim kiennq

# Assumption Scoop & Git have been installed
# Install scoop and use it for application installs
# Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
#
scoop install git

# Setup concfg 
scoop install concfg
&concfg import my-concfg.json

# Install 7-zip
scoop install 7zip

# install  psutils for use
scoop install psutils


# Install and get vim ready to use
#scoop install vim  ## Default of 8.2.0.0 doesn't have python or other dyn bindings installed
#scoop install vim-nightly
scoop install neovim

# Need to soft link ~/AppData/Local/nvim to ~/.config/nvim
# Need to install the autoload vim-plug to ~/.config/nvim/autoload

# Configure git
git config --global core.edit "$(Get-Command vim | % { $_.Source -replace '\\','\\\\' })"

mkdir ~\vimfiles\autoload -ErrorAction SilentlyContinue

$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\vimfiles\autoload\plug.vim"
  )
)
# Link to this checked out repo using sudo (from scoop) & soft link approach
# sudo ln -s ./_vimrc $env:USERPROFILE/_vimrc

# Setup Hack Font
scoop bucket add nerd-fonts

sudo scoop install Hack-NF

# Install posh-git
scoop bucket add extras

#scoop install oh-my-posh3

# Install python

scoop bucket add versions
#scoop install python37
# Default Install Poetry for use
#pip install poetry

# Install vscode 
scoop install vscode

# Install Powershell Core
scoop install pwsh

# Install Windows-Terminal
scoop install windows-terminal

# SSH Configuration
#scoop install win32-openssh

# Get this to latest version as pwsh comes with 1.0.0
# TODO: Check for exist before removal, only do if exists
sudo Install-Module PowershellGet -Force
sudo Remove-module -FullyQualifiedName @{ModuleName="PowershellGet";ModuleVersion="1.0.0.1"}
# Since the latest version of posh-git is 0.7.3.1 in scoop
PowerShellGet\Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force

# Terminal Icons
sudo Install-Module -Name Terminal-Icons -Force
Import-Module -Name Terminal-Icons

# ZLocation 
#scoop install zlocation

# Configure LongPathNames 
sudo Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1

# Setup Starship for use
scoop install starship
scoop install extras/vcredist2019

Write-Host "Now start a new powershell session to see that everything is working right"
Write-Host "Update Sleep mode for power savings"

