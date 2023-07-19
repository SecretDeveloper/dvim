param (
    [Parameter(Mandatory=$false)]
    [string]$path=(Get-Location).Path
)

if (Test-Path -Path $path) {
    if (Get-Item -Path $path -ea SilentlyContinue) {
        if ((Get-Item -Path $path).PSIsContainer) {
            # Folder provided
            docker run --rm -ti -v "${path}:/home" dvim
        }
        else {
            # File path provided
            $folderPath = Split-Path -Path $path
            $filePath = Split-Path -Path $path -Leaf
            docker run --rm -ti -v "${folderPath}:/home" dvim "${filePath}"
        }
    }
} else {
    Write-Output "The specified path does not exist."
}


