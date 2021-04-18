:: Setup work folders
set GameFilesDir=GameFilesEdited
set ReleaseUnpackedDir=ReleaseUnpacked
set ReleaseDir=Release

set BigFilesUnpackedDir=.Generated\BigFilesUnpacked
set BigFilesDir=.Generated\BigFiles

set ReleaseUnpackedDefaultDir=.Generated\ReleaseUnpackedDefault
set ReleaseUnpacked720Dir=.Generated\ReleaseUnpacked720
set ReleaseUnpacked900Dir=.Generated\ReleaseUnpacked900
set ReleaseUnpacked1080Dir=.Generated\ReleaseUnpacked1080
set ReleaseUnpacked1440Dir=.Generated\ReleaseUnpacked1440
set ReleaseUnpacked2160Dir=.Generated\ReleaseUnpacked2160

:: Create folders
if not exist %BigFilesUnpackedDir% mkdir %BigFilesUnpackedDir%
if not exist %BigFilesDir% mkdir %BigFilesDir%
if not exist %ReleaseUnpackedDefaultDir% mkdir %ReleaseUnpackedDefaultDir%
if not exist %ReleaseUnpacked720Dir% mkdir %ReleaseUnpacked720Dir%
if not exist %ReleaseUnpacked900Dir% mkdir %ReleaseUnpacked900Dir%
if not exist %ReleaseUnpacked1080Dir% mkdir %ReleaseUnpacked1080Dir%
if not exist %ReleaseUnpacked1440Dir% mkdir %ReleaseUnpacked1440Dir%
if not exist %ReleaseUnpacked2160Dir% mkdir %ReleaseUnpacked2160Dir%
