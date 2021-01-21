# Setting up my startup profile

* Change execution policies - `Set-ExecutionPolicy Unrestricted`
* Setup the .ssh tree for id_rsa 
* Install Powershell Core 6 (installation via scoop doesn't work well with vscode etc)

```
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
scoop install git
```

* Run `install.ps1` - Only run this once

* Run `daily-sync.ps1`  - This should be run regularly to capture any updates that are out there and sync up with what's in git

* Start vim and run `:PlugInstall`

## Lenovo T495 special settings

In order to not conflict with Docker/Hyper-V usage, need to reserve ports for the Lenovo Service bridge to work right.

Error:  HTTPEvent, EventID: 15005 with ports of 50128-50130 being unable to bind

To fix:

netsh int ip show excludedportrange protocol=tcp - See current ports
dism.exe /Online /Disable-Feature:Microsoft-Hyper-V - Disable Hyper-V & reboot
netsh int ipv4 add excludedportrange protocol=tcp startport=50128 numberofports=3 - Reserve the ports
dism.exe /Online /Enable-Feature:Microsoft-Hyper-V /All - Enable Hyper-V & reboot

Afterwards check event viewer & make sure that LSB is working

https://forums.lenovo.com/t5/Pre-Installed-Lenovo-Software-and-Applications/Lenovo-Service-Bridge-Failed-to-listen-ports-50128-50129-50130/m-p/3888120?page=5#5221627
