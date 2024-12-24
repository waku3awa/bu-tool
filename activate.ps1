echo "`nScript from " $MyInvocation.MyCommand.Path
$ScriptDir = Split-Path $MyInvocation.MyCommand.Path -Parent

function python {
    Invoke-Expression "$ScriptDir\python-3.12.6-embed-amd64\python.exe $args"
}

function pip {
    Invoke-Expression "$ScriptDir\python-3.12.6-embed-amd64\python.exe -m pip $args"
}

Write-Output "`nActivate local python and pip command."