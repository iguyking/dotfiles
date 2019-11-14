# Script to install all dependencies needed for these dotfiles to work
# TODO: Fix so can be run more than once

# Set in install.ps1 & daily-sync.ps1
$MyBinaries = "$env:USERPROFILE\Documents\Binaries"
mkdir -path $MyBinaries

# Assumption Scoop & Git have been installed
# Install scoop and use it for application installs
# Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
# scoop install git

# Setup concfg 
scoop install concfg
&concfg import my-concfg.json

# Install 7-zip
scoop install 7zip

# install  psutils for use
scoop install psutils

# Install and get vim ready to use
scoop install vim

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

scoop install Hack-NF

# Install posh-git
scoop bucket add extras

scoop install oh-my-posh

# Install python

scoop bucket add versions
scoop install python37

# Install vscode - Don't use as of 1.40.1 - causes huge performance issue
#scoop install vscode
