if "%1" == "" goto :MISSINGARGUMENT

set TextureDir=%1
set TextureInfoFile=%TextureDir%\CrunchInfo.txt
:: Compress PSD to DDS and delete intermediate source copies
for /r %TextureDir% %%f in (*.psd) do (
  %ToolsDir%\crunch\crunch_x64.exe -file %%f -info >%TextureInfoFile%
  findstr /c:A8L8 /c:A8R8G8B8 %TextureInfoFile% >nul
  if not ERRORLEVEL 1 (
    :: Texture has alpha channel
    %ToolsDir%\crunch\crunch_x64.exe -file %%f -fileformat dds -outsamedir -dxt5 -quality 255 -mipmode none -lzmastats
  ) else (
    :: Texture does not have alpha channel
    %ToolsDir%\crunch\crunch_x64.exe -file %%f -fileformat dds -outsamedir -dxt1 -quality 255 -mipmode none -lzmastats
  )
  del /f /q %%f
)
del /f /q %TextureInfoFile%

:MISSINGDIRECTORY
