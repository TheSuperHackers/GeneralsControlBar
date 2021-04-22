call MAKE_Install.bat
call MAKE_ControlBarProResXZH.bat 900

::Copy release files to game
xcopy /Y /S %GeneratedReleaseUnpacked900Dir% %GameRootDir%
