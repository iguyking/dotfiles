# My personal binaries path
$MyBinaries = "$env:USERPROFILE\Documents\Binaries"

#TODO: Figure out where to drop the git tree and then link files around

# Setup Windows Powershell by copying local scripts to the Powerhsell startup directory
$profiledir = Split-Path -Parent $profile
$results = New-Item $profileDir -itemType Directory -Force -ErrorAction SilentlyContinue 


copy-item -path Microsoft.PowerShell_profile.ps1 -Destination $profiledir
copy-item -path daily-sync.ps1 -Destination $MyBinaries

Remove-Variable profileDir

# Configure and setup vim

copy-item .\_vimrc -Destination $env:USERPROFILE

mkdir ~\vimfiles\autoload -ErrorAction SilentlyContinue
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\vimfiles\autoload\plug.vim"
  )
)


# Show what the current status of all the apps are
scoop update
scoop status
