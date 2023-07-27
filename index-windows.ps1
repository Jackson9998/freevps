# Step 1: Create an administrative user
Write-Host "Creating administrative user..."
net user hdz 040112 /add
net localgroup Administrators hdz /add

# Step 2: Configure RDP usage
Write-Host "Configuring RDP..."
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall add rule name="Remote Desktop" dir=in action=allow protocol=TCP localport=3389

# Step 3: Download and install Ngrok
Write-Host "Downloading and installing Ngrok..."
$ngrokUrl = "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-stable-windows-amd64.zip"
$ngrokZip = "$env:TEMP\Ngrok.zip"
$ngrokDir = "$env:TEMP\Ngrok"
Invoke-WebRequest -Uri $ngrokUrl -OutFile $ngrokZip
Expand-Archive -Path $ngrokZip -DestinationPath $ngrokDir

# Step 4: Open port 3389 using Ngrok
Write-Host "Opening port 3389 with Ngrok..."
$ngrokAuthToken = "25zOFhO9xHS6LJflCnRDtgrWFGl_23YL1E4RHatGeLtdXGh3M"
Start-Process -FilePath "$ngrokDir\ngrok.exe" -ArgumentList "authtoken $ngrokAuthToken", "tcp 3389" -Wait

Write-Host "END"
