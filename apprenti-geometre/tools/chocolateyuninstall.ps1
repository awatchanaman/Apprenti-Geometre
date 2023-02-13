$ErrorActionPreference = 'Stop'; # stop on all errors
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'apprenti-geometre*'
  fileType      = 'EXE'
  silentArgs    = "/S"
  validExitCodes= @(0)
  }

Remove-Item -Path "$env:ProgramFiles\Apprenti-Geometre" -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Apprenti_Geometre.lnk" -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:Public\Desktop\Apprenti_Geometre.lnk" -Recurse -ErrorAction SilentlyContinue