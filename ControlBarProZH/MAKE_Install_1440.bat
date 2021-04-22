call MAKE_Install.bat
call MAKE_Big_ControlBarPro_ResX.bat 1440

::Copy release files to game
xcopy /Y /S %GeneratedReleaseUnpacked1440Dir% %GameRootDir%
