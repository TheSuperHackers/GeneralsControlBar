:: Setup work folders
set ToolsDir=..\Tools

set GameFilesDir=GameFilesEdited
set ReleaseUnpackedDir=ReleaseUnpacked
set ReleaseDir=Release

set GeneratedBigFilesUnpackedDir=.Generated\BigFilesUnpacked
set GeneratedBigFilesDir=.Generated\BigFiles

set GeneratedReleaseUnpackedDir=.Generated\ReleaseUnpacked
set GeneratedReleaseUnpacked720Dir=.Generated\ReleaseUnpacked720
set GeneratedReleaseUnpacked900Dir=.Generated\ReleaseUnpacked900
set GeneratedReleaseUnpacked1080Dir=.Generated\ReleaseUnpacked1080
set GeneratedReleaseUnpacked1440Dir=.Generated\ReleaseUnpacked1440
set GeneratedReleaseUnpacked2160Dir=.Generated\ReleaseUnpacked2160

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
