Control Bar Pro for COMMAND AND CONQUER GENERALS: ZERO HOUR

Author(s): EA Games, FAS, xezon

Code & Assets Source: https://github.com/xezon/GeneralsControlBar


-----------------------------------------------------------------------------------------------
--- REQUIREMENTS ------------------------------------------------------------------------------

+ This addon requires GenTool 8.1 or higher to be run properly:
  > http://www.gentool.net

+ Generals.exe must be launched with -forcefullviewport command line argument,
  or with the bundled Generals Proxy Launcher (v2.0+).


-----------------------------------------------------------------------------------------------
--- REGULAR INSTALL ---------------------------------------------------------------------------

1. Copy all files and folders into the game install directory, for example:
   > C:\Program Files (x86)\EA Games\Command & Conquer Generals Zero Hour
   
   > On English install it would then look like so:
   > ...\EA Games\Command & Conquer Generals Zero Hour\launcherControlBarProZH
   > ...\EA Games\Command & Conquer Generals Zero Hour\launcherControlBarProZHShell
   > ...\EA Games\Command & Conquer Generals Zero Hour\340_ControlBarProZH.big.bak
   > ...\EA Games\Command & Conquer Generals Zero Hour\GeneralsControlBarPro.cmd
   > ...\EA Games\Command & Conquer Generals Zero Hour\GeneralsControlBarProShell.cmd

2. Run GeneralsControlBarPro.cmd
   or  GeneralsControlBarProShell.cmd if the first does not work properly

3. If IPv4 address and/or E-Mail address need to be hidden in game for streaming purposes,
   then open launcherControlBarProZH\big.txt file with text editor
   and add following 2 lines. Then save the file changes.

..\250_HideIP_WindowZH.big
..\251_HideMail_WindowZH.big


-----------------------------------------------------------------------------------------------
--- GameRanger INSTALL ------------------------------------------------------------------------

1. Follow step 1 from "Regular Install"

2. Start GameRanger

3. Open Edit > Options > Games

4. Select the game from the list

5. Click Browse... and navigate to generals.exe in launcher directory, for example:
   > C:\Program Files (x86)\EA Games\Command & Conquer Generals Zero Hour\
     launcherControlBarProZH\generals.exe


-----------------------------------------------------------------------------------------------
--- CUSTOMIZATIONS ----------------------------------------------------------------------------

+ Edit launcherControlBarProZH\commandline.txt
  to append custom command line arguments to executable.

+ Edit launcherControlBarProZH\big.txt to enable
  custom .big files located relative to launcher folder.
  For example specifying "..\MyBigFile.big" would enable loading of MyBigFile.big
  in game root directory when using proxy generals.exe.


-----------------------------------------------------------------------------------------------
--- COMPATIBILITY -----------------------------------------------------------------------------

+ This addon is compatible with COMMAND AND CONQUER GENERALS: ZERO HOUR:
  Chinese, English, French, German, Italian, Korean, Polish, Spanish

+ No mismatch between player installation in Network and Online.

+ Best visual quality is served in 1920 x 1080 window resolution.

+ This pack combines well with the Control Bar HD Pack for upscaled icon textures.
  > http://gentool.net/download/controlbar


-----------------------------------------------------------------------------------------------
--- CHANGELOG ---------------------------------------------------------------------------------

v1.0:
- Initial release
