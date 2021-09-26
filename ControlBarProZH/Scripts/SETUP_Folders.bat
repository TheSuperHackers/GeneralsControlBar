:: Setup work folders
set ProjectDir="%~dp0.."
set ToolsDir=%ProjectDir%\..\Tools
set GameFilesDir=%ProjectDir%\GameFilesEdited
set ReleaseUnpackedDir=%ProjectDir%\ReleaseUnpacked
set ReleaseDir=%ProjectDir%\.Release

set GeneratedBigFilesUnpackedDir=%ProjectDir%\.Generated\BigFilesUnpacked
set GeneratedBigFilesDir=%ProjectDir%\.Generated\BigFiles

set GeneratedReleaseUnpackedDir=%ProjectDir%\.Generated\ReleaseUnpacked
set GeneratedReleaseUnpacked720Dir=%ProjectDir%\.Generated\ReleaseUnpacked720
set GeneratedReleaseUnpacked900Dir=%ProjectDir%\.Generated\ReleaseUnpacked900
set GeneratedReleaseUnpacked1080Dir=%ProjectDir%\.Generated\ReleaseUnpacked1080
set GeneratedReleaseUnpacked1440Dir=%ProjectDir%\.Generated\ReleaseUnpacked1440
set GeneratedReleaseUnpacked2160Dir=%ProjectDir%\.Generated\ReleaseUnpacked2160

:: Create folders
if not exist %ReleaseDir% mkdir %ReleaseDir%
if not exist %GeneratedBigFilesUnpackedDir% mkdir %GeneratedBigFilesUnpackedDir%
if not exist %GeneratedBigFilesDir% mkdir %GeneratedBigFilesDir%
if not exist %GeneratedReleaseUnpackedDir% mkdir %GeneratedReleaseUnpackedDir%
if not exist %GeneratedReleaseUnpacked720Dir% mkdir %GeneratedReleaseUnpacked720Dir%
if not exist %GeneratedReleaseUnpacked900Dir% mkdir %GeneratedReleaseUnpacked900Dir%
if not exist %GeneratedReleaseUnpacked1080Dir% mkdir %GeneratedReleaseUnpacked1080Dir%
if not exist %GeneratedReleaseUnpacked1440Dir% mkdir %GeneratedReleaseUnpacked1440Dir%
if not exist %GeneratedReleaseUnpacked2160Dir% mkdir %GeneratedReleaseUnpacked2160Dir%

setlocal enableextensions enabledelayedexpansion
