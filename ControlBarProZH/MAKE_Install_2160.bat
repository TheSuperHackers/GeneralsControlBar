call MAKE_Install.bat
call MAKE_ControlBarProResXZH.bat 2160

::Copy release files to game
xcopy /Y /S %GeneratedReleaseUnpacked2160Dir% %GameRootDir%
