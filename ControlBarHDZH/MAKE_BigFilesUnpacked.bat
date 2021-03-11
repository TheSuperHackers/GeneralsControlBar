:: Generates Big File contents that can be put in .big files

setlocal enableextensions enabledelayedexpansion
set SrcDir=GameFilesEdited
set DestDir=BigFilesUnpacked
set BigNameBegin=400_ControlBarHD
set BigNameEnd=ZH

set SrcArtTexturesDir=%SrcDir%\Art\Textures
set DestArtTexturesDir=%DestDir%\%BigNameBegin%Base%BigNameEnd%\Art\Textures
if not exist %DestArtTexturesDir% mkdir %DestArtTexturesDir%
xcopy /Y %SrcArtTexturesDir% %DestArtTexturesDir%

for %%l in (Brazilian,Chinese,English,French,German,Italian,Korean,Polish,Spanish) do (
	set SrcDataLangArtTexturesDir=%SrcDir%\Data\Language\Art\Texture
	set DestDataLangArtTexturesDir=%DestDir%\%BigNameBegin%%%l%BigNameEnd%\Data\%%l\Art\Textures
	if not exist !DestDataLangArtTexturesDir! mkdir !DestDataLangArtTexturesDir!
	xcopy /Y !SrcDataLangArtTexturesDir! !DestDataLangArtTexturesDir!
)

pause
