call MAKE_Big_HideIP.bat
call MAKE_Big_HideMail.bat
call MAKE_Big_ControlBarPro.bat

set GameRootDir="C:\Program Files (x86)\EA Games\Command & Conquer The First Decade\Command & Conquer(tm) Generals Zero Hour"

::Copy release files to game
xcopy /Y /S %ReleaseUnpackedDir_Default% %GameRootDir%
