call SETUP_Folders.bat

:: Copy base release files
xcopy /Y /S %ReleaseUnpackedDir%\*.txt %ReleaseUnpacked2160Dir%\*.txt
xcopy /Y /S %ReleaseUnpackedDir%\*.dat %ReleaseUnpacked2160Dir%\*.dat
xcopy /Y /S %ReleaseUnpackedDir%\*.big %ReleaseUnpacked2160Dir%\*.big
xcopy /Y /S %ReleaseUnpackedDir%\*.exe %ReleaseUnpacked2160Dir%\*.exe
xcopy /Y /S %ReleaseUnpackedDir%\*.cmd %ReleaseUnpacked2160Dir%\*.cmd
xcopy /Y /S %ReleaseUnpackedDir%\*.txt_2160 %ReleaseUnpacked2160Dir%\*.txt


:: Define big file name(s)
set BigName=340_ControlBarPro2160ZH

:: Free folders of big file contents
del /s /f /q %BigFilesUnpackedDir%\%BigName%
del /s /f /q %BigFilesDir%\%BigName%

setlocal enableextensions enabledelayedexpansion

:: Copy .big contents
xcopy /Y /S %GameFilesDir%\*.ini_2160 %BigFilesUnpackedDir%\%BigName%\*.ini

:: Generate .big file(s)
set GeneralsBigCreatorExe=..\Tools\GeneralsBigCreator\GeneralsBigCreator.exe
%GeneralsBigCreatorExe% -source %BigFilesUnpackedDir%\%BigName% -dest %BigFilesDir%\%BigName%.big

:: Generate Release file(s)
xcopy /Y %BigFilesDir%\%BigName%.big %ReleaseUnpacked2160Dir%\%BigName%.big.bak*
