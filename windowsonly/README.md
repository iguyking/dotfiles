# Setting up my startup profile

* Change execution policies - `Set-ExecutionPolicy Unrestricted`
* Setup the .ssh tree for id_rsa 

```
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
scoop install git
```

* Run `install.ps1` - Only run this once

* Run `daily-sync.ps1`  - This should be run regularly to capture any updates that are out there and sync up with what's in git

* Start vim and run `:PlugInstall`


