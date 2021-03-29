set GameRootDir="C:\Program Files (x86)\EA Games\Command & Conquer The First Decade\Command & Conquer(tm) Generals Zero Hour"

set SourceDir=ReleaseUnpacked

call MAKE_Release.bat

xcopy /Y /S %SourceDir% %GameRootDir%
