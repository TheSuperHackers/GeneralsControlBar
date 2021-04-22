call MAKE_Install.bat
call MAKE_Big_ControlBarPro_ResX.bat 900

::Copy release files to game
xcopy /Y /S %GeneratedReleaseUnpacked900Dir% %GameRootDir%
