call MAKE_Install.bat
call MAKE_Big_ControlBarPro_720.bat

::Copy release files to game
xcopy /Y /S %ReleaseUnpackedDir_720% %GameRootDir%
