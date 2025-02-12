$ErrorActionPreference = 'Stop'

$toolsDir  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$Url64      = "https://github.com/awatchanaman/Apprenti-Geometre/raw/refs/heads/main/apprenti-geometre/tools/AG%202.6.9%20(x%2064).exe"

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