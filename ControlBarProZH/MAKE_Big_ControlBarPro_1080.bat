call SETUP_Folders.bat

:: Copy base release files
xcopy /Y /S %ReleaseUnpackedDir%\*.txt %ReleaseUnpackedDir_1080%\*.txt
xcopy /Y /S %ReleaseUnpackedDir%\*.dat %ReleaseUnpackedDir_1080%\*.dat
xcopy /Y /S %ReleaseUnpackedDir%\*.big %ReleaseUnpackedDir_1080%\*.big
xcopy /Y /S %ReleaseUnpackedDir%\*.exe %ReleaseUnpackedDir_1080%\*.exe
xcopy /Y /S %ReleaseUnpackedDir%\*.cmd %ReleaseUnpackedDir_1080%\*.cmd
xcopy /Y /S %ReleaseUnpackedDir%\*.txt_1080 %ReleaseUnpackedDir_1080%\*.txt

:: Define big file name(s)
set BigName=340_ControlBarPro1080ZH

:: Free folders of big file contents
del /s /f /q %BigFilesUnpackedDir%\%BigName%
del /s /f /q %BigFilesDir%\%BigName%

setlocal enableextensions enabledelayedexpansion

:: Copy .big contents
xcopy /Y /S %GameFilesDir%\*.ini_1080 %BigFilesUnpackedDir%\%BigName%\*.ini

:: Generate .big file(s)
set GeneralsBigCreatorExe=..\Tools\GeneralsBigCreator\GeneralsBigCreator.exe
%GeneralsBigCreatorExe% -source %BigFilesUnpackedDir%\%BigName% -dest %BigFilesDir%\%BigName%.big

:: Generate Release file(s)
xcopy /Y %BigFilesDir%\%BigName%.big %ReleaseUnpackedDir_1080%\%BigName%.big.bak*
