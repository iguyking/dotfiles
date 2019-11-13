
# Setup Windows Powershell by copying local scripts to the Powerhsell startup directory
$profiledir = Split-Path -Parent $profile
New-Item $profileDir -itemType Directory -Force -ErrorAction SilentlyContinue

copy-item -path ./*.ps1 -Destination $profiledir -Exclude ".\bootstrap.ps1"

Remove-Variable $profileDir


copy-item .\_vimrc -Destination $env:USERPROFILE