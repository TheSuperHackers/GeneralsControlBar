:: Generates Big File contents that can be put in .big files

setlocal enableextensions enabledelayedexpansion
set SrcDir=GameFilesEdited
set DestDir=BigFilesUnpacked
set ControlBarObsBigName=200_ControlBarObsEnglishZH
set HideIPBigName=250_HideIP_WindowZH
set HideMailBigName=251_HideMail_WindowZH

:: ControlBarObs
set DestControlBarObsArtTexturesDir=%DestDir%\%ControlBarObsBigName%\Art\Textures
set DestControlBarObsWindowDir=%DestDir%\%ControlBarObsBigName%\Window
set DestControlBarObsDataEnglishDir=%DestDir%\%ControlBarObsBigName%\Data\English
set DestControlBarObsDataINIDir=%DestDir%\%ControlBarObsBigName%\Data\INI
if not exist %DestControlBarObsArtTexturesDir% mkdir %DestControlBarObsArtTexturesDir%
if not exist %DestControlBarObsWindowDir% mkdir %DestControlBarObsWindowDir%
if not exist %DestControlBarObsDataEnglishDir% mkdir %DestControlBarObsDataEnglishDir%
if not exist %DestControlBarObsDataINIDir% mkdir %DestControlBarObsDataINIDir%
xcopy /Y %SrcDir%\Art\Textures %DestControlBarObsArtTexturesDir%
xcopy /Y %SrcDir%\Window %DestControlBarObsWindowDir%
xcopy /Y %SrcDir%\Data\English %DestControlBarObsDataEnglishDir%
xcopy /Y %SrcDir%\Data\INI %DestControlBarObsDataINIDir%

:: HideIP
set DestHideIPWindowMenusDir=%DestDir%\%HideIPBigName%\Window\Menus
if not exist %DestHideIPWindowMenusDir% mkdir %DestHideIPWindowMenusDir%
xcopy /Y %SrcDir%\Window\Menus\NetworkDirectConnect.wnd %DestHideIPWindowMenusDir%
xcopy /Y %SrcDir%\Window\Menus\OptionsMenu.wnd %DestHideIPWindowMenusDir%

:: HideMail
set DestHideMailWindowMenusDir=%DestDir%\%HideMailBigName%\Window\Menus
if not exist %DestHideMailWindowMenusDir% mkdir %DestHideMailWindowMenusDir%
xcopy /Y %SrcDir%\Window\Menus\GameSpyLoginProfile.wnd %DestHideMailWindowMenusDir%

pause
