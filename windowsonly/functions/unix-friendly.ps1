function which($name) {
    Get-Command $name | Select-Object Definition
}

function rm-rf($item) {
    Remove-Item $item -Recurse -Force
}

function touch($file) {
    "" | Out-File $file -Encoding ASCII
}
