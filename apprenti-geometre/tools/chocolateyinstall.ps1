$ErrorActionPreference = 'Stop'

$toolsDir  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Url64      = "https://firebasestorage.googleapis.com/v0/b/project-359443804751131057.appspot.com/o/logiciels%2FAG%2FAG%202.6.9%20(x%2064).exe?alt=media&token=780f02bd-8c16-4697-84d2-e18ac4fd418b"
  checksum      = '54F3BBD91F84C3448590AD3238DA50F105D9F0BF3C969242F865D32C28DC0143'
  checksumType  = 'sha256'
}


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit      = $url64
  softwareName  = 'apprenti-geometre*'
  checksum64      = '54F3BBD91F84C3448590AD3238DA50F105D9F0BF3C969242F865D32C28DC0143'
  checksumType64   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
  }

Install-ChocolateyPackage @packageArgs

#$packageArgs = @{
 

  # MSI
  #silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  #validExitCodes= @(0, 3010, 1641)
  # OTHERS
  # Uncomment matching EXE type (sorted by most to least common)
  #silentArgs   = '/S'           # NSIS
  #silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
  #silentArgs   = '/s'           # InstallShield
  #silentArgs   = '/s /v"/qn"'   # InstallShield with MSI
  #silentArgs   = '/s'           # Wise InstallMaster
  #silentArgs   = '-s'           # Squirrel
  #silentArgs   = '-q'           # Install4j
  #silentArgs   = '-s'           # Ghost
  # Note that some installers, in addition to the silentArgs above, may also need assistance of AHK to achieve silence.
  #silentArgs   = ''             # none; make silent with input macro script like AutoHotKey (AHK)
                                 #       https://community.chocolatey.org/packages/autohotkey.portable




# Mise en place du Raccourci dans Menu Demarrer
#$filepath = Join-Path "$env:ProgramFiles\Apprenti-Geometre" 'Apprenti_Geometre.exe'
#Install-ChocolateyShortcut -ShortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Apprenti_Geometre.lnk" -TargetPath "$filepath"


# Mise en place du Raccourci dans Menu Demarrer (si le params est renseigné --params /DesktopShortcut)

#if ((Get-PackageParameters).DesktopShortcut) {
#Install-ChocolateyShortcut -ShortcutFilePath "$env:Public\Desktop\Apprenti_Geometre.lnk" -TargetPath "$filepath"
#}
