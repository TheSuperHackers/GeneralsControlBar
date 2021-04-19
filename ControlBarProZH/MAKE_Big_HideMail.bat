call SETUP_Folders.bat

:: Define big file name(s)
set BigName=251_HideMail_WindowZH

:: Free folders of big file contents
del /s /f /q %BigFilesUnpackedDir%\%BigName%
del /s /f /q %BigFilesDir%\%BigName%

setlocal enableextensions enabledelayedexpansion

:: Copy .big contents
xcopy /Y /S %GameFilesDir%\*.wnd_hidemail %BigFilesUnpackedDir%\%BigName%\*.wnd

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
