set ThisDir1="%~dp0."
call %ThisDir1%\SETUP_Folders.bat

:: Copy base release files
xcopy /y /s %ReleaseUnpackedDir%\* %GeneratedReleaseUnpackedDir%\*

:: Define big file name(s)
set BigName=340_ControlBarProZH

:: Free folders of big file contents
del /f /q /s %GeneratedBigFilesUnpackedDir%\%BigName%
del /f /q    %GeneratedBigFilesDir%\%BigName%.big

:: Copy .big contents
xcopy /y /s %GameFilesDir%\*.tga %GeneratedBigFilesUnpackedDir%\%BigName%\
xcopy /y /s %GameFilesDir%\*.psd %GeneratedBigFilesUnpackedDir%\%BigName%\
xcopy /y /s %GameFilesDir%\*.ini %GeneratedBigFilesUnpackedDir%\%BigName%\
xcopy /y /s %GameFilesDir%\*.wnd %GeneratedBigFilesUnpackedDir%\%BigName%\
xcopy /y /s %GameFilesDir%\*.dat %GeneratedBigFilesUnpackedDir%\%BigName%\
xcopy /y /s %GameFilesDir%\*.txt %GeneratedBigFilesUnpackedDir%\%BigName%\

:: Compress TGA and PSD to DDS and delete intermediate source copies
for /r %GeneratedBigFilesUnpackedDir%\%BigName%\ %%f in (*.tga, *.psd) do (
    %ToolsDir%\crunch\crunch_x64.exe ^
	-file %%f ^
	-fileformat dds ^
	-outsamedir -dxt5 ^
	-quality 255 ^
	-mipmode none ^
	-lzmastats
	del /f /q %%f
)

:: Generate .big file(s)
%ToolsDir%\GeneralsBigCreator\GeneralsBigCreator.exe -source %GeneratedBigFilesUnpackedDir%\%BigName% -dest %GeneratedBigFilesDir%\%BigName%.big

:: Generate Release file(s)
xcopy /y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpackedDir%\%BigName%.big*
xcopy /y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked720Dir%\%BigName%.big*
xcopy /y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked900Dir%\%BigName%.big*
xcopy /y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked1080Dir%\%BigName%.big*
xcopy /y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked1440Dir%\%BigName%.big*
xcopy /y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpacked2160Dir%\%BigName%.big*
