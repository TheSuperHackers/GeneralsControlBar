set ThisDir1="%~dp0."
call %ThisDir1%\SETUP_Folders.bat

:: Define big file name(s)
set BigName=339_ControlBarProHideIpZH

:: Free folders of big file contents
del /f /q /s %GeneratedBigFilesUnpackedDir%\%BigName%
del /f /q    %GeneratedBigFilesDir%\%BigName%.big

:: Copy .big contents
xcopy /y /s %GameFilesDir%\*.wnd_hideip %GeneratedBigFilesUnpackedDir%\%BigName%\*.wnd

:: Generate .big file(s)
%ToolsDir%\GeneralsBigCreator\GeneralsBigCreator.exe -source %GeneratedBigFilesUnpackedDir%\%BigName% -dest %GeneratedBigFilesDir%\%BigName%.big

:: Generate Release file(s)
xcopy /y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpackedDir%\%BigName%.big.BAK*
xcopy /y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked720Dir%\%BigName%.big.BAK*
xcopy /y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked900Dir%\%BigName%.big.BAK*
xcopy /y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked1080Dir%\%BigName%.big.BAK*
xcopy /y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked1440Dir%\%BigName%.big.BAK*
xcopy /y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked2160Dir%\%BigName%.big.BAK*
