call SETUP_Folders.bat

:: Define big file name(s)
set BigName=340_ControlBarProHideMailZH

:: Free folders of big file contents
del /s /f /q %GeneratedBigFilesUnpackedDir%\%BigName%
del /s /f /q %GeneratedBigFilesDir%\%BigName%

:: Copy .big contents
xcopy /Y /S %GameFilesDir%\*.wnd_hidemail %GeneratedBigFilesUnpackedDir%\%BigName%\*.wnd

:: Generate .big file(s)
%ToolsDir%\GeneralsBigCreator\GeneralsBigCreator.exe -source %GeneratedBigFilesUnpackedDir%\%BigName% -dest %GeneratedBigFilesDir%\%BigName%.big

:: Generate Release file(s)
xcopy /Y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpackedDir%\%BigName%.big.bak*
xcopy /Y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked720Dir%\%BigName%.big.bak*
xcopy /Y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked900Dir%\%BigName%.big.bak*
xcopy /Y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked1080Dir%\%BigName%.big.bak*
xcopy /Y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked1440Dir%\%BigName%.big.bak*
xcopy /Y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked2160Dir%\%BigName%.big.bak*
