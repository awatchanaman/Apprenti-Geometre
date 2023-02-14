$ErrorActionPreference = 'Stop';

$unzipLocation = "$env:TEMP\$packagename"

$packageArgs = @{
  packageName   = 'apprenti-geometre'
  unzipLocation = $unzipLocation
  Url           = "https://github.com/awatchanaman/Apprenti-Geometre/raw/main/apprenti-geometre/install_geometre.zip"
  checksum      = '018B5EB2E6A6DD0A3C5246E1ACD3CE53F2950BC9E930E46FD2343C065E11E194'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName    = 'apprenti-geometre'
  softwareName   = 'apprenti-geometre*'
  fileType       = 'exe'
  file          = "$unzipLocation\install_geometre.exe"
  silentArgs     = '/S'
  validExitCodes = @(0)
  checksum       = '108C772787C3A2AF5189B61ACF132E6A08DAA4285B6BBAB26D81C6B77E415851'
  checksumType   = 'sha256'
  }

Install-ChocolateyInstallPackage @packageArgs

# Mise en place du Raccourci dans Menu Demarrer
$filepath = Join-Path "$env:ProgramFiles\Apprenti-Geometre" 'Apprenti_Geometre.exe'
Install-ChocolateyShortcut -ShortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Apprenti_Geometre.lnk" -TargetPath "$filepath"


# Mise en place du Raccourci dans Menu Demarrer (si le params est renseigné --params /DesktopShortcut)

if ((Get-PackageParameters).DesktopShortcut) {
Install-ChocolateyShortcut -ShortcutFilePath "$env:Public\Desktop\Apprenti_Geometre.lnk" -TargetPath "$filepath"
}
