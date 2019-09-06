# https://365adviser.com/powershell/install-use-openssh-windows-powershell-core-remoting-via-ssh/
$ErrorActionPreference = "Stop"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Write-Host "Download OpenSSH..."
$Uri = "https://github.com/PowerShell/Win32-OpenSSH/releases/download/v8.0.0.0p1-Beta/OpenSSH-Win64.zip"
Invoke-WebRequest -Uri $Uri -Outfile "$Env:TEMP/openssh.zip"
Write-Host "Done!"

Write-Host "Extract OpenSSH archive..."
Expand-Archive -Path "$Env:TEMP\openssh.zip" -DestinationPath "$Env:TEMP" -Force
New-Item -Path 'c:\Program Files\OpenSSH' -ItemType Directory -Force | Out-Null
Write-Host "Done!"

Write-Host "Stop services (if found)..."
Get-Service sshd -ErrorAction SilentlyContinue | Stop-Service 
Get-Service ssh-agent -ErrorAction SilentlyContinue | Stop-Service  
Write-Host "Done!"

Write-Host "Copy OpenSSH files..."
Copy-Item -Path "$Env:TEMP\OpenSSH-Win64\*" -Destination 'c:\Program Files\OpenSSH' -Recurse -Force
Write-Host "Done!"

Set-Location 'c:\Program Files\OpenSSH'
#Get-ChildItem
powershell.exe -ExecutionPolicy Bypass -File install-sshd.ps1

Write-Host "Configure Local Firewall Rules..."
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22 -ErrorAction SilentlyContinue
New-NetFirewallRule -Name sshd -DisplayName "OpenSSH Server (sshd)" -Service "sshd" -Enabled True -Direction Inbound -Protocol TCP -Action Allow -Profile Domain -ErrorAction SilentlyContinue
Write-Host "Done!"

Start-Service sshd 

Set-Service sshd -StartupType Automatic
Set-Service ssh-agent -StartupType Automatic

Write-Host "Set the default shell to PowerShell"
New-Item -Path "HKLM:\SOFTWARE" -Name "OpenSSH" -Force -ErrorAction SilentlyContinue | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name "DefaultShell" -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" | Out-Null
Write-Host "Done!"

Write-Host "Restart OpenSSH services..."
Get-Service sshd -ErrorAction SilentlyContinue | Stop-Service -Force
Get-Service sshd -ErrorAction SilentlyContinue | Start-Service
Get-Service ssh-agent -ErrorAction SilentlyContinue | Stop-Service -Force
Get-Service ssh-agent -ErrorAction SilentlyContinue | Start-Service  
Write-Host "Done!"

Write-Host "Successfully Installed OpenSSH"