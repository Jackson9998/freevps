@echo off
setlocal enabledelayedexpansion

REM Etapa 1: Criação do usuário administrativo
echo Criando usuário administrativo...
net user humberto 040112 /add
net localgroup Administradores humberto /add

REM Etapa 2: Configuração do uso do RDP
echo Configurando o RDP...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall set rule group="Remote Desktop" new enable=Yes

REM Etapa 3: Download e instalação do Ngrok (certifique-se de colocar o link correto do Ngrok)
echo Baixando e instalando o Ngrok...
powershell -command "Invoke-WebRequest -Uri https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-amd64.zip -OutFile Ngrok.zip"
powershell -command "Expand-Archive -Path Ngrok.zip -DestinationPath C:\Ngrok"

REM Etapa 4: Abrir a porta 3389 usando o Ngrok
echo Abrindo a porta 3389 com Ngrok...
C:\Ngrok\ngrok.exe authtoken 25zOFhO9xHS6LJflCnRDtgrWFGl_23YL1E4RHatGeLtdXGh3M
C:\Ngrok\ngrok.exe tcp 3389

echo FIM
