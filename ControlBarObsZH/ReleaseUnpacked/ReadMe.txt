Control Bar Observer for COMMAND AND CONQUER GENERALS: ZERO HOUR

Author(s): EA Games, xezon, Legionnaire, FAS

Original download from: http://gentool.net/download/controlbarobs

Code & Assets: https://github.com/xezon/GeneralsControlBar

-----------------------------------------------------------------------------------------------
--- Regular Install ---------------------------------------------------------------------------

1. Copy all files and folders into the game install directory, for example:
   > C:\Program Files (x86)\EA Games\Command & Conquer Generals Zero Hour
   
   > On English install it would then look like so:
   > ...\EA Games\Command & Conquer Generals Zero Hour\launcherControlBarObsEnglishZH
   > ...\EA Games\Command & Conquer Generals Zero Hour\launcherControlBarObsEnglishZHShell
   > ...\EA Games\Command & Conquer Generals Zero Hour\200_ControlBarObsEnglishZH.big.bak
   > ...\EA Games\Command & Conquer Generals Zero Hour\250_HideIP_WindowZH.big.bak
   > ...\EA Games\Command & Conquer Generals Zero Hour\251_HideMail_WindowZH.big.bak
   > ...\EA Games\Command & Conquer Generals Zero Hour\GeneralsControlBarObs.cmd
   > ...\EA Games\Command & Conquer Generals Zero Hour\GeneralsControlBarObsShell.cmd

2. Run GeneralsControlBarObs.cmd
   or  GeneralsControlBarObsShell.cmd if the first does not work properly

3. If IPv4 address and/or E-Mail address need to be hidden in game for streaming purposes,
   then open launcherControlBarObsEnglishZH\big.txt file with text editor
   and add following 2 lines. Then save the file changes.

..\250_HideIP_WindowZH.big
..\251_HideMail_WindowZH.big


-----------------------------------------------------------------------------------------------
--- GameRanger Install ------------------------------------------------------------------------

1. Follow step 1 from "Regular Install"

2. Start GameRanger

3. Open Edit > Options > Games

4. Select the game from the list

5. Click Browse... and navigate to generals.exe in launcher directory, for example:
   > C:\Program Files (x86)\EA Games\Command & Conquer Generals Zero Hour\
       launcherControlBarObsEnglishZH\generals.exe


-----------------------------------------------------------------------------------------------
--- Customizations ----------------------------------------------------------------------------

+ Edit launcherControlBarObsEnglishZH\commandline.txt
  to append custom command line arguments to executable.

+ Edit launcherControlBarObsEnglishZH\big.txt to enable
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

v1.1
- Added white border around radar box
- Added Generals Proxy Launcher 1.8

v1.2
- Added Generals Proxy Launcher 1.9

v1.3
- Added 250_HideIP_WindowZH.big and 251_HideMail_WindowZH.big.bak

v1.4
- Added Generals Proxy Launcher 2.0
- Fixed invisible button bug in Replay mode
- Fixed positioning of upgrade icons in grid
- Fixed too large player names
- Fixed and removed power bars in Game mode
- Changed color of upgrades grid
