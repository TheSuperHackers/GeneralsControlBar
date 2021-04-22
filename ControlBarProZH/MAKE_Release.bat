call MAKE_ControlBarProHideIpZH.bat
call MAKE_ControlBarProHideMailZH.bat
call MAKE_ControlBarProZH.bat
call MAKE_ControlBarProResXZH.bat 720
call MAKE_ControlBarProResXZH.bat 900
call MAKE_ControlBarProResXZH.bat 1080
call MAKE_ControlBarProResXZH.bat 1440
call MAKE_ControlBarProResXZH.bat 2160

:: Define archive name(s)
set ArchiveName=ControlBarProZH_v0.0

:: Generate Archive(s)
tar.exe -a -c -C %GeneratedReleaseUnpackedDir% -f %ReleaseDir%\%ArchiveName%.zip *.*
tar.exe -a -c -C %GeneratedReleaseUnpacked720Dir% -f %ReleaseDir%\%ArchiveName%_x720.zip *.*
tar.exe -a -c -C %GeneratedReleaseUnpacked900Dir% -f %ReleaseDir%\%ArchiveName%_x900.zip *.*
tar.exe -a -c -C %GeneratedReleaseUnpacked1080Dir% -f %ReleaseDir%\%ArchiveName%_x1080.zip *.*
tar.exe -a -c -C %GeneratedReleaseUnpacked1440Dir% -f %ReleaseDir%\%ArchiveName%_x1440.zip *.*
tar.exe -a -c -C %GeneratedReleaseUnpacked2160Dir% -f %ReleaseDir%\%ArchiveName%_x2160.zip *.*
