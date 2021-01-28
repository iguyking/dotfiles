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
