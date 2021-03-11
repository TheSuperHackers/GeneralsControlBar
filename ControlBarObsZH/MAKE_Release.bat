:: Copy .big files to destination directory and create zip file

set ArchiveName=ControlBarObsEnglishZH_v1.3

set BigSrcDir=BigFilesUnpacked
set BigDestDir=ReleaseUnpacked
set ReleaseDir=Release

xcopy /Y %BigSrcDir%\200_ControlBarObsEnglishZH.big %BigDestDir%\200_ControlBarObsEnglishZH.big.bak
xcopy /Y %BigSrcDir%\250_HideIP_WindowZH.big %BigDestDir%\250_HideIP_WindowZH.big.bak
xcopy /Y %BigSrcDir%\251_HideMail_WindowZH.big %BigDestDir%\251_HideMail_WindowZH.big.bak

if not exist %ReleaseDir% mkdir %ReleaseDir%
tar.exe -a -c -C %BigDestDir% -f %ReleaseDir%\%ArchiveName%.zip *.*

pause
