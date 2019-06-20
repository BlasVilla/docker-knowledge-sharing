param (
    [string] $Tag
)

If ([string]::IsNullOrEmpty($Tag)) { $Tag = Read-Host 'Please enter a tag' }

$ImageName="anwb-playground/microservice:$Tag"

# set working dir to script folder
$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath

Push-Location $dir

Invoke-Expression -Command "docker build -t $ImageName -f ./Dockerfile ../.."

Pop-Location