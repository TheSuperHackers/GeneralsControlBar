call MAKE_Release.bat

set GameRootDir="C:\Program Files (x86)\EA Games\Command & Conquer The First Decade\Command & Conquer(tm) Generals Zero Hour"

::Copy release files to game
xcopy /Y /S %ReleaseUnpackedDir% %GameRootDir%
