# AWS CLI
# PowerShell parameter completion shim for the aws CLI
# https://github.com/aws/aws-cli/issues/5309

Register-ArgumentCompleter -Native -CommandName aws -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
        Set-Item -Path Env:COMP_LINE -Value $wordToComplete
        Set-Item -Path Env:COMP_POINT -Value $cursorPosition
        aws_completer.exe | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
    }
}
