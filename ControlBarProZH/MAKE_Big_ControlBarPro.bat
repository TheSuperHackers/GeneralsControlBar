call SETUP_Folders.bat

:: Copy base release files
xcopy /Y /S %ReleaseUnpackedDir%\*.txt %ReleaseUnpackedDefaultDir%\*.txt
xcopy /Y /S %ReleaseUnpackedDir%\*.dat %ReleaseUnpackedDefaultDir%\*.dat
xcopy /Y /S %ReleaseUnpackedDir%\*.big %ReleaseUnpackedDefaultDir%\*.big
xcopy /Y /S %ReleaseUnpackedDir%\*.exe %ReleaseUnpackedDefaultDir%\*.exe
xcopy /Y /S %ReleaseUnpackedDir%\*.cmd %ReleaseUnpackedDefaultDir%\*.cmd

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
xcopy /Y %BigFilesDir%\%BigName%.big %ReleaseUnpackedDefaultDir%\%BigName%.big.bak*
xcopy /Y %BigFilesDir%\%BigName%.big %ReleaseUnpacked720Dir%\%BigName%.big.bak*
xcopy /Y %BigFilesDir%\%BigName%.big %ReleaseUnpacked900Dir%\%BigName%.big.bak*
xcopy /Y %BigFilesDir%\%BigName%.big %ReleaseUnpacked1080Dir%\%BigName%.big.bak*
xcopy /Y %BigFilesDir%\%BigName%.big %ReleaseUnpacked1440Dir%\%BigName%.big.bak*
xcopy /Y %BigFilesDir%\%BigName%.big %ReleaseUnpacked2160Dir%\%BigName%.big.bak*
