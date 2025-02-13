$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'apprenti-geometre*'
  file          = "C:\Program Files (x86)\Apprenti Géomètre 2\unins000.exe"
  fileType      = 'EXE'
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes= @(0)
  }

Uninstall-ChocolateyPackage @packageArgs

$Raccourci_Desktop = "C:\Users\Public\Desktop\Mathematiques\Apprenti Géomètre 2.lnk"
if (Test-path -Path $Raccourci_Desktop) {
    Remove-Item -Path "$Raccourci_Desktop" -Recurse -Force
}