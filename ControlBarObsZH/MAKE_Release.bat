:: Define archive name(s)
set ArchiveName=ControlBarObsEnglishZH_v1.4

:: Define big file name(s)
set ControlBarObsBigName=200_ControlBarObsEnglishZH
set HideIPBigName=250_HideIP_WindowZH
set HideMailBigName=251_HideMail_WindowZH

:: Setup work folders
set ProjectDir=%~dp0
set ToolsDir=%ProjectDir%..\Tools
set GameFilesDir=%ProjectDir%GameFilesEdited
set BigFilesUnpackedDir=%ProjectDir%.Generated\BigFilesUnpacked
set BigFilesDir=%ProjectDir%.Generated\BigFiles
set ReleaseUnpackedDir=%ProjectDir%ReleaseUnpacked
set ReleaseDir=%ProjectDir%Release

if not exist %BigFilesUnpackedDir% mkdir %BigFilesUnpackedDir%
if not exist %BigFilesDir% mkdir %BigFilesDir%
if not exist %ReleaseUnpackedDir% mkdir %ReleaseUnpackedDir%
if not exist %ReleaseDir% mkdir %ReleaseDir%

:: Free folders of big file contents
del /s /f /q %BigFilesUnpackedDir%
del /s /f /q %BigFilesDir%

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
xcopy /Y %GameFilesDir%\Art\Textures %DestControlBarObsArtTexturesDir%\
xcopy /Y %GameFilesDir%\Window %DestControlBarObsWindowDir%\
xcopy /Y %GameFilesDir%\Data\English %DestControlBarObsDataEnglishDir%\
xcopy /Y %GameFilesDir%\Data\INI %DestControlBarObsDataINIDir%\

:: Copy HideIP contents
set DestHideIPWindowMenusDir=%BigFilesUnpackedDir%\%HideIPBigName%\Window\Menus
if not exist %DestHideIPWindowMenusDir% mkdir %DestHideIPWindowMenusDir%
xcopy /Y %GameFilesDir%\Window\Menus\NetworkDirectConnect.wnd %DestHideIPWindowMenusDir%\
xcopy /Y %GameFilesDir%\Window\Menus\OptionsMenu.wnd %DestHideIPWindowMenusDir%\

:: Copy HideMail contents
set DestHideMailWindowMenusDir=%BigFilesUnpackedDir%\%HideMailBigName%\Window\Menus
if not exist %DestHideMailWindowMenusDir% mkdir %DestHideMailWindowMenusDir%
xcopy /Y %GameFilesDir%\Window\Menus\GameSpyLoginProfile.wnd %DestHideMailWindowMenusDir%\

:: Generate .big file(s)
set GeneralsBigCreatorExe=%ToolsDir%\GeneralsBigCreator\GeneralsBigCreator.exe
%GeneralsBigCreatorExe% -source %BigFilesUnpackedDir%\%ControlBarObsBigName% -dest %BigFilesDir%\%ControlBarObsBigName%.big
%GeneralsBigCreatorExe% -source %BigFilesUnpackedDir%\%HideIPBigName% -dest %BigFilesDir%\%HideIPBigName%.big
%GeneralsBigCreatorExe% -source %BigFilesUnpackedDir%\%HideMailBigName% -dest %BigFilesDir%\%HideMailBigName%.big

:: Generate Release file(s)
xcopy /Y %BigFilesDir%\%ControlBarObsBigName%.big %ReleaseUnpackedDir%\%ControlBarObsBigName%.big.bak*
xcopy /Y %BigFilesDir%\%HideIPBigName%.big %ReleaseUnpackedDir%\%HideIPBigName%.big.bak*
xcopy /Y %BigFilesDir%\%HideMailBigName%.big %ReleaseUnpackedDir%\%HideMailBigName%.big.bak*

:: Generate Archive(s)
tar.exe -a -c -C %ReleaseUnpackedDir% -f %ReleaseDir%\%ArchiveName%.zip *.*
