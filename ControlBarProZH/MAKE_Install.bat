call SETUP_Folders.bat
call MAKE_Big_HideIP.bat
call MAKE_Big_HideMail.bat
call MAKE_Big_ControlBarPro.bat
call MAKE_Big_ControlBarPro1080.bat

set GameRootDir="C:\Program Files (x86)\EA Games\Command & Conquer The First Decade\Command & Conquer(tm) Generals Zero Hour"

::Copy release files to game
xcopy /Y /S %ReleaseUnpacked1080Dir% %GameRootDir%
