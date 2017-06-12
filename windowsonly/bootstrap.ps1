$profileDir = Split-Path -parent $profile

New-Item $profileDir -itemType Directory -Force -ErrorAction SilentlyContinue

Copy-Item -path ./*.ps1 -Destination $profileDir -exclude "bootstrap.ps1"

Copy-Item -path /home/** -Destination $home -Include **

Remove-Variable profileDir
