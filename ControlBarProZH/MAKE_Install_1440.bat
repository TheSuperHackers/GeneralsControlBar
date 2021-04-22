call MAKE_Install.bat
call MAKE_ControlBarProResXZH.bat 1440

::Copy release files to game
xcopy /Y /S %GeneratedReleaseUnpacked1440Dir% %GameRootDir%
