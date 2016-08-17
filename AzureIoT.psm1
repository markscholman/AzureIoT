$moduleRoot = Split-Path -Path $MyInvocation.MyCommand.Path
Get-ChildItem "$moduleRoot\lib\*.dll" | 
ForEach-Object { . Import-Module $_.FullName -Verbose ; Write-Verbose $_.FullName}
Write-Verbose 'Importing Azure IoT Hub Functions'
# Import everything in the functions folder
Get-ChildItem "$moduleRoot\Functions\*.ps1" | 
ForEach-Object { . $_.FullName ; Write-Verbose $_.FullName}