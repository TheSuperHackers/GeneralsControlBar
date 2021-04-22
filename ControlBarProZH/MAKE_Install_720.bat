call MAKE_Install.bat
call MAKE_ControlBarProResXZH.bat 720

::Copy release files to game
xcopy /Y /S %GeneratedReleaseUnpacked720Dir% %GameRootDir%
