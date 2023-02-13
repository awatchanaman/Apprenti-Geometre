$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'apprenti-geometre'
  softwareName   = 'apprenti-geometre*'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://github.com/awatchanaman/Apprenti-Geometre/raw/main/apprenti-geometre/tools/install_geometre.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  checksum       = '108C772787C3A2AF5189B61ACF132E6A08DAA4285B6BBAB26D81C6B77E415851'
  checksumType   = 'sha256'
  }


Install-ChocolateyPackage @packageArgs

# Mise en place du Raccourci dans Menu Demarrer
$filepath = Join-Path "$env:ProgramFiles\Apprenti-Geometre" 'Apprenti_Geometre.exe'
Install-ChocolateyShortcut -ShortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Apprenti_Geometre.lnk" -TargetPath "$filepath"


# Mise en place du Raccourci dans Menu Demarrer (si le params est renseigné --params /DesktopShortcut)

if ((Get-PackageParameters).DesktopShortcut) {
Install-ChocolateyShortcut -ShortcutFilePath "$env:Public\Desktop\Apprenti_Geometre.lnk" -TargetPath "$filepath"
}
