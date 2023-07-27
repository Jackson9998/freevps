@echo off

REM Step 1: Create an administrative user
echo Creating administrative user...
net user humberto 040112 /add
net localgroup Administrators humberto /add

REM Step 2: Configure RDP usage
echo Configuring RDP...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall add rule name="Remote Desktop" dir=in action=allow protocol=TCP localport=3389

REM Step 3: Download and install Ngrok
echo Downloading and installing Ngrok...
powershell -command "Invoke-WebRequest -Uri 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-stable-windows-amd64.zip' -OutFile $env:TEMP\Ngrok.zip"
powershell -command "Expand-Archive -Path $env:TEMP\Ngrok.zip -DestinationPath $env:TEMP\Ngrok"

REM Step 4: Open port 3389 using Ngrok
echo Opening port 3389 with Ngrok...
set "ngrokAuthToken=25zOFhO9xHS6LJflCnRDtgrWFGl_23YL1E4RHatGeLtdXGh3M"
powershell -command "Start-Process -FilePath $env:TEMP\Ngrok\ngrok.exe -ArgumentList 'authtoken %ngrokAuthToken%', 'tcp 3389' -Wait"

echo END
