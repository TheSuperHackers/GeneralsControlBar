call SETUP_Folders.bat

:: Copy base release files
xcopy /Y /S %ReleaseUnpackedDir%\*.txt %GeneratedReleaseUnpackedDir%\*.txt
xcopy /Y /S %ReleaseUnpackedDir%\*.dat %GeneratedReleaseUnpackedDir%\*.dat
xcopy /Y /S %ReleaseUnpackedDir%\*.big %GeneratedReleaseUnpackedDir%\*.big
xcopy /Y /S %ReleaseUnpackedDir%\*.exe %GeneratedReleaseUnpackedDir%\*.exe
xcopy /Y /S %ReleaseUnpackedDir%\*.cmd %GeneratedReleaseUnpackedDir%\*.cmd

:: Define big file name(s)
set BigName=340_ControlBarProZH

:: Free folders of big file contents
del /s /f /q %GeneratedBigFilesUnpackedDir%\%BigName%
del /s /f /q %GeneratedBigFilesDir%\%BigName%

:: Copy .big contents
xcopy /Y /S %GameFilesDir%\*.tga %GeneratedBigFilesUnpackedDir%\%BigName%\
xcopy /Y /S %GameFilesDir%\*.dds %GeneratedBigFilesUnpackedDir%\%BigName%\
xcopy /Y /S %GameFilesDir%\*.ini %GeneratedBigFilesUnpackedDir%\%BigName%\
xcopy /Y /S %GameFilesDir%\*.wnd %GeneratedBigFilesUnpackedDir%\%BigName%\

:: Generate .big file(s)
%ToolsDir%\GeneralsBigCreator\GeneralsBigCreator.exe -source %GeneratedBigFilesUnpackedDir%\%BigName% -dest %GeneratedBigFilesDir%\%BigName%.big

:: Generate Release file(s)
xcopy /Y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpackedDir%\%BigName%.big.bak*
xcopy /Y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked720Dir%\%BigName%.big.bak*
xcopy /Y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked900Dir%\%BigName%.big.bak*
xcopy /Y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked1080Dir%\%BigName%.big.bak*
xcopy /Y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked1440Dir%\%BigName%.big.bak*
xcopy /Y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked2160Dir%\%BigName%.big.bak*
