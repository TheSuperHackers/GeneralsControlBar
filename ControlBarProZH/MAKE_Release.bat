call SETUP_Folders.bat
call MAKE_Big_HideIP.bat
call MAKE_Big_HideMail.bat
call MAKE_Big_ControlBarPro.bat
call MAKE_Big_ControlBarPro720.bat
call MAKE_Big_ControlBarPro900.bat
call MAKE_Big_ControlBarPro1080.bat
call MAKE_Big_ControlBarPro1440.bat
call MAKE_Big_ControlBarPro2160.bat

:: Define archive name(s)
set ArchiveName=ControlBarProZH_v0.0

:: Generate Archive(s)
tar.exe -a -c -C %ReleaseUnpackedDefaultDir% -f %ReleaseDir%\%ArchiveName%.zip *.*
tar.exe -a -c -C %ReleaseUnpacked720Dir% -f %ReleaseDir%\%ArchiveName%_x720.zip *.*
tar.exe -a -c -C %ReleaseUnpacked900Dir% -f %ReleaseDir%\%ArchiveName%_x900.zip *.*
tar.exe -a -c -C %ReleaseUnpacked1080Dir% -f %ReleaseDir%\%ArchiveName%_x1080.zip *.*
tar.exe -a -c -C %ReleaseUnpacked1440Dir% -f %ReleaseDir%\%ArchiveName%_x1440.zip *.*
tar.exe -a -c -C %ReleaseUnpacked2160Dir% -f %ReleaseDir%\%ArchiveName%_x2160.zip *.*
