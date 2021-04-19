call SETUP_Folders.bat

:: Copy base release files
xcopy /Y /S %ReleaseUnpackedDir%\*.txt %ReleaseUnpackedDir_720%\*.txt
xcopy /Y /S %ReleaseUnpackedDir%\*.dat %ReleaseUnpackedDir_720%\*.dat
xcopy /Y /S %ReleaseUnpackedDir%\*.big %ReleaseUnpackedDir_720%\*.big
xcopy /Y /S %ReleaseUnpackedDir%\*.exe %ReleaseUnpackedDir_720%\*.exe
xcopy /Y /S %ReleaseUnpackedDir%\*.cmd %ReleaseUnpackedDir_720%\*.cmd
xcopy /Y /S %ReleaseUnpackedDir%\*.txt_720 %ReleaseUnpackedDir_720%\*.txt

:: Define big file name(s)
set BigName=340_ControlBarPro720ZH

:: Free folders of big file contents
del /s /f /q %BigFilesUnpackedDir%\%BigName%
del /s /f /q %BigFilesDir%\%BigName%

setlocal enableextensions enabledelayedexpansion

:: Copy .big contents
xcopy /Y /S %GameFilesDir%\*.ini_720 %BigFilesUnpackedDir%\%BigName%\*.ini

:: Generate .big file(s)
set GeneralsBigCreatorExe=..\Tools\GeneralsBigCreator\GeneralsBigCreator.exe
%GeneralsBigCreatorExe% -source %BigFilesUnpackedDir%\%BigName% -dest %BigFilesDir%\%BigName%.big

:: Generate Release file(s)
xcopy /Y %BigFilesDir%\%BigName%.big %ReleaseUnpackedDir_720%\%BigName%.big.bak*
