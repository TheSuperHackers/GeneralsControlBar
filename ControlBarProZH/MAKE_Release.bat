set ThisDir0=%~dp0
call %ThisDir0%Scripts\MAKE_ControlBarProHideIpZH.bat
call %ThisDir0%Scripts\MAKE_ControlBarProHideMailZH.bat
call %ThisDir0%Scripts\MAKE_ControlBarProZH.bat
call %ThisDir0%Scripts\MAKE_ControlBarProResXZH.bat 720
call %ThisDir0%Scripts\MAKE_ControlBarProResXZH.bat 900
call %ThisDir0%Scripts\MAKE_ControlBarProResXZH.bat 1080
call %ThisDir0%Scripts\MAKE_ControlBarProResXZH.bat 1440
call %ThisDir0%Scripts\MAKE_ControlBarProResXZH.bat 2160

:: Define archive name(s)
set ArchiveName=ControlBarProZH_v1.2

:: Generate Archive(s)
tar.exe -a -c -C %GeneratedReleaseUnpacked720Dir% -f %ReleaseDir%\%ArchiveName%_1280x720.zip *.*
tar.exe -a -c -C %GeneratedReleaseUnpacked900Dir% -f %ReleaseDir%\%ArchiveName%_1600x900.zip *.*
tar.exe -a -c -C %GeneratedReleaseUnpacked1080Dir% -f %ReleaseDir%\%ArchiveName%_1920x1080.zip *.*
tar.exe -a -c -C %GeneratedReleaseUnpacked1440Dir% -f %ReleaseDir%\%ArchiveName%_2560x1440.zip *.*
tar.exe -a -c -C %GeneratedReleaseUnpacked2160Dir% -f %ReleaseDir%\%ArchiveName%_3840x2160.zip *.*

:: LEGACY Release without ResX big file no longer works. All SCROLLLISTBOX use new HeaderTemplate font.
::tar.exe -a -c -C %GeneratedReleaseUnpackedDir% -f %ReleaseDir%\%ArchiveName%.zip *.*
