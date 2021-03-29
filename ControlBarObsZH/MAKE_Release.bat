set ArchiveName=ControlBarObsEnglishZH_v1.4

:: Folders
set GameFilesDir=GameFilesEdited
set BigFilesUnpackedDir=.Generated\BigFilesUnpacked
set BigFilesDir=.Generated\BigFiles
set ReleaseUnpackedDir=ReleaseUnpacked
set ReleaseDir=Release

if not exist %BigFilesUnpackedDir% mkdir %BigFilesUnpackedDir%
if not exist %BigFilesDir% mkdir %BigFilesDir%
if not exist %ReleaseUnpackedDir% mkdir %ReleaseUnpackedDir%
if not exist %ReleaseDir% mkdir %ReleaseDir%

:: Big file names
set ControlBarObsBigName=200_ControlBarObsEnglishZH
set HideIPBigName=250_HideIP_WindowZH
set HideMailBigName=251_HideMail_WindowZH

setlocal enableextensions enabledelayedexpansion

:: Copy ControlBarObs contents
set DestControlBarObsArtTexturesDir=%BigFilesUnpackedDir%\%ControlBarObsBigName%\Art\Textures
set DestControlBarObsWindowDir=%BigFilesUnpackedDir%\%ControlBarObsBigName%\Window
set DestControlBarObsDataEnglishDir=%BigFilesUnpackedDir%\%ControlBarObsBigName%\Data\English
set DestControlBarObsDataINIDir=%BigFilesUnpackedDir%\%ControlBarObsBigName%\Data\INI
if not exist %DestControlBarObsArtTexturesDir% mkdir %DestControlBarObsArtTexturesDir%
if not exist %DestControlBarObsWindowDir% mkdir %DestControlBarObsWindowDir%
if not exist %DestControlBarObsDataEnglishDir% mkdir %DestControlBarObsDataEnglishDir%
if not exist %DestControlBarObsDataINIDir% mkdir %DestControlBarObsDataINIDir%
xcopy /Y %GameFilesDir%\Art\Textures %DestControlBarObsArtTexturesDir%
xcopy /Y %GameFilesDir%\Window %DestControlBarObsWindowDir%
xcopy /Y %GameFilesDir%\Data\English %DestControlBarObsDataEnglishDir%
xcopy /Y %GameFilesDir%\Data\INI %DestControlBarObsDataINIDir%

:: Copy HideIP contents
set DestHideIPWindowMenusDir=%BigFilesUnpackedDir%\%HideIPBigName%\Window\Menus
if not exist %DestHideIPWindowMenusDir% mkdir %DestHideIPWindowMenusDir%
xcopy /Y %GameFilesDir%\Window\Menus\NetworkDirectConnect.wnd %DestHideIPWindowMenusDir%
xcopy /Y %GameFilesDir%\Window\Menus\OptionsMenu.wnd %DestHideIPWindowMenusDir%

:: Copy HideMail contents
set DestHideMailWindowMenusDir=%BigFilesUnpackedDir%\%HideMailBigName%\Window\Menus
if not exist %DestHideMailWindowMenusDir% mkdir %DestHideMailWindowMenusDir%
xcopy /Y %GameFilesDir%\Window\Menus\GameSpyLoginProfile.wnd %DestHideMailWindowMenusDir%

:: Generate .big files
set GeneralsBigCreatorExe=..\Tools\GeneralsBigCreator\GeneralsBigCreator.exe
%GeneralsBigCreatorExe% -source %BigFilesUnpackedDir%\%ControlBarObsBigName%\ -dest %BigFilesDir%\%ControlBarObsBigName%.big
%GeneralsBigCreatorExe% -source %BigFilesUnpackedDir%\%HideIPBigName%\ -dest %BigFilesDir%\%HideIPBigName%.big
%GeneralsBigCreatorExe% -source %BigFilesUnpackedDir%\%HideMailBigName%\ -dest %BigFilesDir%\%HideMailBigName%.big

:: Generate Release archive
xcopy /Y %BigFilesDir%\%ControlBarObsBigName%.big %ReleaseUnpackedDir%\%ControlBarObsBigName%.big.bak
xcopy /Y %BigFilesDir%\%HideIPBigName%.big %ReleaseUnpackedDir%\%HideIPBigName%.big.bak
xcopy /Y %BigFilesDir%\%HideMailBigName%.big %ReleaseUnpackedDir%\%HideMailBigName%.big.bak

tar.exe -a -c -C %ReleaseUnpackedDir% -f %ReleaseDir%\%ArchiveName%.zip *.*
