call MAKE_Install.bat
call MAKE_Big_ControlBarPro_ResX.bat 1080

::Copy release files to game
xcopy /Y /S %GeneratedReleaseUnpacked1080Dir% %GameRootDir%
