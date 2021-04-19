call MAKE_Install.bat
call MAKE_Big_ControlBarPro_1080.bat

::Copy release files to game
xcopy /Y /S %ReleaseUnpackedDir_1080% %GameRootDir%
