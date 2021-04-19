call SETUP_Folders.bat
call MAKE_Big_HideIP.bat
call MAKE_Big_HideMail.bat
call MAKE_Big_ControlBarPro.bat
call MAKE_Big_ControlBarPro_720.bat
call MAKE_Big_ControlBarPro_900.bat
call MAKE_Big_ControlBarPro_1080.bat
call MAKE_Big_ControlBarPro_1440.bat
call MAKE_Big_ControlBarPro_2160.bat

:: Define archive name(s)
set ArchiveName=ControlBarProZH_v0.0

:: Generate Archive(s)
tar.exe -a -c -C %ReleaseUnpackedDir_Default% -f %ReleaseDir%\%ArchiveName%.zip *.*
tar.exe -a -c -C %ReleaseUnpackedDir_720% -f %ReleaseDir%\%ArchiveName%_x720.zip *.*
tar.exe -a -c -C %ReleaseUnpackedDir_900% -f %ReleaseDir%\%ArchiveName%_x900.zip *.*
tar.exe -a -c -C %ReleaseUnpackedDir_1080% -f %ReleaseDir%\%ArchiveName%_x1080.zip *.*
tar.exe -a -c -C %ReleaseUnpackedDir_1440% -f %ReleaseDir%\%ArchiveName%_x1440.zip *.*
tar.exe -a -c -C %ReleaseUnpackedDir_2160% -f %ReleaseDir%\%ArchiveName%_x2160.zip *.*
