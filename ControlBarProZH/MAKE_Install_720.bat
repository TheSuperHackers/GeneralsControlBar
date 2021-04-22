call MAKE_Install.bat
call MAKE_Big_ControlBarPro_ResX.bat 720

::Copy release files to game
xcopy /Y /S %GeneratedReleaseUnpacked720Dir% %GameRootDir%
