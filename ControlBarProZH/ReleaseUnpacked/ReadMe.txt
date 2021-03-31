Control Bar Pro for COMMAND AND CONQUER GENERALS: ZERO HOUR

Author(s): EA Games, FAS, xezon

Code & Assets: https://github.com/xezon/GeneralsControlBar

-----------------------------------------------------------------------------------------------
--- Regular Install ---------------------------------------------------------------------------

1. Copy all files and folders into the game install directory, for example:
   > C:\Program Files (x86)\EA Games\Command & Conquer Generals Zero Hour
   
   > On English install it would then look like so:
   > ...\EA Games\Command & Conquer Generals Zero Hour\launcherControlBarProZH
   > ...\EA Games\Command & Conquer Generals Zero Hour\launcherControlBarProZHShell
   > ...\EA Games\Command & Conquer Generals Zero Hour\180_ControlBarProZH.big.bak
   > ...\EA Games\Command & Conquer Generals Zero Hour\GeneralsControlBarPro.cmd
   > ...\EA Games\Command & Conquer Generals Zero Hour\GeneralsControlBarProShell.cmd

2. Run GeneralsControlBarPro.cmd
   or  GeneralsControlBarProShell.cmd if the first does not work properly


-----------------------------------------------------------------------------------------------
--- GameRanger Install ------------------------------------------------------------------------

1. Follow step 1 from "Regular Install"

2. Start GameRanger

3. Open Edit > Options > Games

4. Select the game from the list

5. Click Browse... and navigate to generals.exe in launcher directory, for example:
   > C:\Program Files (x86)\EA Games\Command & Conquer Generals Zero Hour\
     launcherControlBarProZH\generals.exe


-----------------------------------------------------------------------------------------------
--- Customizations ----------------------------------------------------------------------------

+ Edit launcherControlBarProZH\commandline.txt
  to append custom command line arguments to executable.

+ Edit launcherControlBarProZH\big.txt to enable
  custom .big files located relative to launcher folder.
  For example specifying "..\MyBigFile.big" would enable loading of MyBigFile.big
  in game root directory when using proxy generals.exe.


-----------------------------------------------------------------------------------------------
--- Compatibility -----------------------------------------------------------------------------

This pack combines well with the Control Bar HD Remastered Pack
for upscaled controlbar textures. See: http://gentool.net/download/controlbar


-----------------------------------------------------------------------------------------------
--- Changelog ---------------------------------------------------------------------------------

v1.0:
- Initial release
