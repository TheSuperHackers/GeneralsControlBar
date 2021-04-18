call SETUP_Folders.bat

:: Copy base release files
xcopy /Y /S %ReleaseUnpackedDir%\*.txt %ReleaseUnpacked900Dir%\*.txt
xcopy /Y /S %ReleaseUnpackedDir%\*.dat %ReleaseUnpacked900Dir%\*.dat
xcopy /Y /S %ReleaseUnpackedDir%\*.big %ReleaseUnpacked900Dir%\*.big
xcopy /Y /S %ReleaseUnpackedDir%\*.exe %ReleaseUnpacked900Dir%\*.exe
xcopy /Y /S %ReleaseUnpackedDir%\*.cmd %ReleaseUnpacked900Dir%\*.cmd
xcopy /Y /S %ReleaseUnpackedDir%\*.txt_900 %ReleaseUnpacked900Dir%\*.txt

:: Define big file name(s)
set BigName=340_ControlBarPro900ZH

:: Free folders of big file contents
del /s /f /q %BigFilesUnpackedDir%\%BigName%
del /s /f /q %BigFilesDir%\%BigName%

setlocal enableextensions enabledelayedexpansion

:: Copy .big contents
xcopy /Y /S %GameFilesDir%\*.ini_900 %BigFilesUnpackedDir%\%BigName%\*.ini

:: Generate .big file(s)
set GeneralsBigCreatorExe=..\Tools\GeneralsBigCreator\GeneralsBigCreator.exe
%GeneralsBigCreatorExe% -source %BigFilesUnpackedDir%\%BigName% -dest %BigFilesDir%\%BigName%.big

:: Generate Release file(s)
xcopy /Y %BigFilesDir%\%BigName%.big %ReleaseUnpacked900Dir%\%BigName%.big.bak*
