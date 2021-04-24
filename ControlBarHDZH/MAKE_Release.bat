:: Generates Big File contents that can be put in .big files

setlocal enableextensions enabledelayedexpansion

set ArchiveName=ControlBarHDZH_v1.0

:: Setup folders
set ToolsDir=..\Tools
set GameFilesDir=GameFilesEdited
set GeneratedBigFilesUnpackedDir=.Generated\BigFilesUnpacked
set GeneratedBigFilesDir=.Generated\BigFiles
set ReleaseUnpackedDir=ReleaseUnpacked
set ReleaseDir=Release
set BigNameBegin=400_ControlBarHD
set BigNameEnd=ZH

:: Create folders
if not exist %GeneratedBigFilesUnpackedDir% mkdir %GeneratedBigFilesUnpackedDir%
if not exist %GeneratedBigFilesDir% mkdir %GeneratedBigFilesDir%
if not exist %ReleaseDir% mkdir %ReleaseDir%


:: Create Control Bar HD Base
set BaseBigName=%BigNameBegin%Base%BigNameEnd%

:: Free folders of big file contents
del /s /f /q %GeneratedBigFilesUnpackedDir%\%BaseBigName%
del /s /f /q %GeneratedBigFilesDir%\%BaseBigName%.big

:: Copy .big contents
set SrcArtTexturesDir=%GameFilesDir%\Art\Textures
set DestArtTexturesDir=%GeneratedBigFilesUnpackedDir%\%BaseBigName%\Art\Textures
if not exist %DestArtTexturesDir% mkdir %DestArtTexturesDir%
xcopy /Y %SrcArtTexturesDir% %DestArtTexturesDir%

:: Generate .big file(s)
%ToolsDir%\GeneralsBigCreator\GeneralsBigCreator.exe -source %GeneratedBigFilesUnpackedDir%\%BaseBigName% -dest %GeneratedBigFilesDir%\%BaseBigName%.big


for %%l in (Brazilian,Chinese,English,French,German,Italian,Korean,Polish,Spanish) do (
	:: Create Control Bar HD Languages
	set LanguageBigName=%BigNameBegin%%%l%BigNameEnd%
	set GeneratedReleaseUnpackedDir=.Generated\ReleaseUnpacked%%l
	
	:: Free folders of big file contents
	del /s /f /q %GeneratedBigFilesUnpackedDir%\!LanguageBigName!
	del /s /f /q %GeneratedBigFilesDir%\!LanguageBigName!.big
	
	:: Copy .big contents
	set SrcDataLangArtTexturesDir=%GameFilesDir%\Data\Language\Art\Texture
	set DestDataLangArtTexturesDir=%GeneratedBigFilesUnpackedDir%\!LanguageBigName!\Data\%%l\Art\Textures
	if not exist !DestDataLangArtTexturesDir! mkdir !DestDataLangArtTexturesDir!
	xcopy /Y !SrcDataLangArtTexturesDir! !DestDataLangArtTexturesDir!

	:: Generate .big file(s)
	%ToolsDir%\GeneralsBigCreator\GeneralsBigCreator.exe -source %GeneratedBigFilesUnpackedDir%\!LanguageBigName! -dest %GeneratedBigFilesDir%\!LanguageBigName!.big
	
	:: Generate Release file(s)
	xcopy /Y %GeneratedBigFilesDir%\%BaseBigName%.big !GeneratedReleaseUnpackedDir!\*
	xcopy /Y %GeneratedBigFilesDir%\!LanguageBigName!.big !GeneratedReleaseUnpackedDir!\*
	xcopy /Y %ReleaseUnpackedDir%\* !GeneratedReleaseUnpackedDir!\*
	
	:: Generate Archive(s)
	tar.exe -a -c -C !GeneratedReleaseUnpackedDir! -f %ReleaseDir%\%ArchiveName%_%%l.zip *.*
)
