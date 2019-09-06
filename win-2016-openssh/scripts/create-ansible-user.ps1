
param (
    [string]$AnsiblePWD = "vagrant1234!"
)

$ErrorActionPreference = "Stop"

$newUser = "ansible"
$passwd = $AnsiblePWD

$Password = ConvertTo-SecureString $passwd -AsPlainText -Force
New-LocalUser -Name $newUser `
    -Description "Ansbile Deploy User" `
    -FullName "Ansible User" `
    -PasswordNeverExpires `
    -AccountNeverExpires `
    -Password $Password `
    -Confirm:$false

Add-LocalGroup -Group "Users" `
    -Member $newUser

Add-LocalGroup -Group "Administrators" `
    -Member $newUser