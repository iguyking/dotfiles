# My personal binaries path
$MyBinaries = "$env:USERPROFILE\Documents\Binaries"

#TODO: Figure out where to drop the git tree and then link files around so this script can be run on powershell console launch

# Setup Windows Powershell by copying local scripts to the Powerhsell startup directory
#$MSprofiledir = "~/Documents/WindowsPowershell"
$PSprofiledir = "~/Documents/Powershell"


#$results = New-Item $MSprofiledir -itemtype Directory -Force -ErrorAction SilentlyContinue 
$results = New-Item $PSprofiledir -itemType Directory -Force -ErrorAction SilentlyContinue 


# TODO: Need to have this pull from github most likely.. Or find a location to clone out from in ~/Documents?
#copy-item -path Microsoft.PowerShell_profile.ps1 -Destination $MSprofiledir
#copy-item -path Microsoft.PowerShell_profile.ps1 -Destination $PSprofiledir

copy-item -path daily-sync.ps1 -Destination $MyBinaries

copy-item -recurse -force -path functions -destination $MSprofiledir/
copy-item -recurse -force -path functions -destination $PSprofiledir/


# Configure and setup vim
# TODO: Fix if file is newer or not, don't copy, raise issue
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
