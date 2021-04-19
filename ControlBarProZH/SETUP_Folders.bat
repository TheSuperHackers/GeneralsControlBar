:: Setup work folders
set GameFilesDir=GameFilesEdited
set ReleaseUnpackedDir=ReleaseUnpacked
set ReleaseDir=Release

set BigFilesUnpackedDir=.Generated\BigFilesUnpacked
set BigFilesDir=.Generated\BigFiles

set ReleaseUnpackedDir_Default=.Generated\ReleaseUnpackedDefault
set ReleaseUnpackedDir_720=.Generated\ReleaseUnpacked720
set ReleaseUnpackedDir_900=.Generated\ReleaseUnpacked900
set ReleaseUnpackedDir_1080=.Generated\ReleaseUnpacked1080
set ReleaseUnpackedDir_1440=.Generated\ReleaseUnpacked1440
set ReleaseUnpackedDir_2160=.Generated\ReleaseUnpacked2160

:: Create folders
if not exist %BigFilesUnpackedDir% mkdir %BigFilesUnpackedDir%
if not exist %BigFilesDir% mkdir %BigFilesDir%
if not exist %ReleaseUnpackedDir_Default% mkdir %ReleaseUnpackedDir_Default%
if not exist %ReleaseUnpackedDir_720% mkdir %ReleaseUnpackedDir_720%
if not exist %ReleaseUnpackedDir_900% mkdir %ReleaseUnpackedDir_900%
if not exist %ReleaseUnpackedDir_1080% mkdir %ReleaseUnpackedDir_1080%
if not exist %ReleaseUnpackedDir_1440% mkdir %ReleaseUnpackedDir_1440%
if not exist %ReleaseUnpackedDir_2160% mkdir %ReleaseUnpackedDir_2160%
