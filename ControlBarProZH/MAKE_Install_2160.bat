call MAKE_Install.bat
call MAKE_Big_ControlBarPro_2160.bat

::Copy release files to game
xcopy /Y /S %ReleaseUnpackedDir_2160% %GameRootDir%
