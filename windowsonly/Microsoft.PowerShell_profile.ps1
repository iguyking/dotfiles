# ahh yes... this would be so nice if it was a built in variable
$here = Split-Path -Parent $MyInvocation.MyCommand.Path

# Set so pip won't run without a virtualenv
$env:PIP_REQUIRE_VIRTUALENV=1

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
import-module oh-my-posh
import-module posh-git

$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
set-theme agnoster

function GoGit { Set-Location -Path ~/Desktop/git }
set-alias dg -value GoGit

function set-sshkeys-filevine {
	copy ~/.ssh/id_rsa.filevine ~/.ssh/id_rsa -force
	copy ~/.ssh/id_rsa.pub.filevine ~/.ssh/id_rsa.pub -force
}

function set-sshkeys-iguyking {
	copy ~/.ssh/id_rsa.iguyking ~/.ssh/id_rsa -force
	copy ~/.ssh/id_rsa.pub.iguyking ~/.ssh/id_rsa.pub -force
}

function which($name) { 
	Get-Command $name | Select-Object Definition 
}                                                  

function rm-rf($item) { 
	Remove-Item $item -Recurse -Force 
}                                                             

function touch($file) { 
	"" | Out-File $file -Encoding ASCII 
}                                                           

Set-Alias g -value gvim                                                    

# z directory fun
import-module zlocation


function clean-git {
     git remote prune origin
     git branch -vv | where {$_ -match '\[origin/.*: gone\]'} | foreach {git branch -D ($_.split(" ",[StringSplitOptions]'RemoveEmptyEntries')[0])}
}


if (test-path alias:set) { remove-item alias:set }


function Set {
  If (-Not $ARGS) {
    Get-ChildItem ENV: | Sort-Object Name
    Return
  }
  $myLine = $MYINVOCATION.Line
  $myName = $MYINVOCATION.InvocationName
  $myArgs = $myLine.Substring($myLine.IndexOf($myName) + $myName.Length + 1)
  $equalPos = $myArgs.IndexOf("=")

  # If the "=" character isn't found, output the variables.
  If ($equalPos -eq -1) {
    $result = Get-ChildItem ENV: | Where-Object { $_.Name -like "$myArgs" } | Sort-Object Name
    If ($result) { $result } Else { Throw "Environment variable not found" }
  }

  # If the "=" character is found before the end of the string, set the variable.

  ElseIf ($equalPos -lt $myArgs.Length - 1) {
    $varName = $myArgs.Substring(0, $equalPos)
    $varData = $myArgs.Substring($equalPos + 1)
    Set-Item ENV:$varName $varData
  }

  # If the "=" character is found at the end of the string, remove the variable.

  Else {
    $varName = $myArgs.Substring(0, $equalPos)
    If (Test-Path ENV:$varName) { Remove-Item ENV:$varName }
  }
}

