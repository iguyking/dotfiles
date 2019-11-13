# Script to install all dependencies needed for these dotfiles to work

Remove-Item Alias:curl

# Setup Hack Font
curl -L https://github.com/source-foundry/Hack-windows-installer/releases/download/v1.6.0/HackFontsWindowsInstaller.exe --output $env:TEMP/HackFontsWindowsInstaller.exe
$env:TEMP/HackFontsWindowsInstaller.exe /Silent

# Setup concfg 
# git clone 
