call SETUP_Folders.bat

:: Copy base release files
xcopy /Y /S %ReleaseUnpackedDir%\*.txt %ReleaseUnpackedDir_Default%\*.txt
xcopy /Y /S %ReleaseUnpackedDir%\*.dat %ReleaseUnpackedDir_Default%\*.dat
xcopy /Y /S %ReleaseUnpackedDir%\*.big %ReleaseUnpackedDir_Default%\*.big
xcopy /Y /S %ReleaseUnpackedDir%\*.exe %ReleaseUnpackedDir_Default%\*.exe
xcopy /Y /S %ReleaseUnpackedDir%\*.cmd %ReleaseUnpackedDir_Default%\*.cmd

:: Define big file name(s)
set BigName=340_ControlBarProZH

:: Free folders of big file contents
del /s /f /q %BigFilesUnpackedDir%\%BigName%
del /s /f /q %BigFilesDir%\%BigName%

setlocal enableextensions enabledelayedexpansion

:: Copy .big contents
xcopy /Y /S %GameFilesDir%\*.tga %BigFilesUnpackedDir%\%BigName%\
xcopy /Y /S %GameFilesDir%\*.dds %BigFilesUnpackedDir%\%BigName%\
xcopy /Y /S %GameFilesDir%\*.ini %BigFilesUnpackedDir%\%BigName%\
xcopy /Y /S %GameFilesDir%\*.wnd %BigFilesUnpackedDir%\%BigName%\

:: Generate .big file(s)
set GeneralsBigCreatorExe=..\Tools\GeneralsBigCreator\GeneralsBigCreator.exe
%GeneralsBigCreatorExe% -source %BigFilesUnpackedDir%\%BigName% -dest %BigFilesDir%\%BigName%.big

:: Generate Release file(s)
xcopy /Y %BigFilesDir%\%BigName%.big %ReleaseUnpackedDir_Default%\%BigName%.big.bak*
xcopy /Y %BigFilesDir%\%BigName%.big %ReleaseUnpackedDir_720%\%BigName%.big.bak*
xcopy /Y %BigFilesDir%\%BigName%.big %ReleaseUnpackedDir_900%\%BigName%.big.bak*
xcopy /Y %BigFilesDir%\%BigName%.big %ReleaseUnpackedDir_1080%\%BigName%.big.bak*
xcopy /Y %BigFilesDir%\%BigName%.big %ReleaseUnpackedDir_1440%\%BigName%.big.bak*
xcopy /Y %BigFilesDir%\%BigName%.big %ReleaseUnpackedDir_2160%\%BigName%.big.bak*
