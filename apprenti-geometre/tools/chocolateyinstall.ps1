$ErrorActionPreference = 'Stop'

$toolsDir  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$Url64      = "https://firebasestorage.googleapis.com/v0/b/project-359443804751131057.appspot.com/o/logiciels%2FAG%2FAG%202.6.9%20(x%2064).exe?alt=media&token=780f02bd-8c16-4697-84d2-e18ac4fd418b"
$uninstall = "C:\Program Files (x86)\Apprenti Géomètre 2\unins000.exe"


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit      = $url64
  softwareName  = 'apprenti-geometre*'
  checksum64      = '54F3BBD91F84C3448590AD3238DA50F105D9F0BF3C969242F865D32C28DC0143'
  checksumType64   = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
  }

# Desinstallation de la version precedente
if (Test-path -Path "C:\Program Files (x86)\Apprenti Géomètre 2\unins000.exe") {
  Write-Host "Desinstallation de la version precedente"
  Start-Process -FilePath $uninstall -ArgumentList "-arg1 /VERYSILENT -arg2 /SUPPRESSMSGBOXES -arg3 /NORESTART -arg4 /SP-" -NoNewWindow -Wait
}

Install-ChocolateyPackage @packageArgs

# Mise en place du Raccourci bureau
if (Test-path -Path "C:\Users\Public\Desktop\Mathematiques") {
  $filepath = Join-Path "C:\Program Files (x86)\Apprenti Géomètre 2" 'AG2.exe'
  Install-ChocolateyShortcut -ShortcutFilePath "C:\Users\Public\Desktop\Mathematiques\Apprenti Géomètre 2.lnk" -TargetPath "$filepath"
}