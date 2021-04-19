call MAKE_Install.bat
call MAKE_Big_ControlBarPro_1440.bat

::Copy release files to game
xcopy /Y /S %ReleaseUnpackedDir_1440% %GameRootDir%
