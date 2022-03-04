Register-ArgumentCompleter -Native -CommandName octo -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
    $params = $commandAst.ToString().Split(' ') | Select-Object -skip 1
   & "C:\ProgramData\chocolatey\lib\OctopusTools\tools\octo.exe" complete $params | ForEach-Object {
        [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterName', $_)
    }
}

# end: Octopus Command Line App (octo.exe) Autocomplete script

