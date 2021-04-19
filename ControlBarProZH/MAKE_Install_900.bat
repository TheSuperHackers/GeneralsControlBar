call MAKE_Install.bat
call MAKE_Big_ControlBarPro_900.bat

::Copy release files to game
xcopy /Y /S %ReleaseUnpackedDir_900% %GameRootDir%
