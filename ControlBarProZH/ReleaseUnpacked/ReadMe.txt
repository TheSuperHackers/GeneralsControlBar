Control Bar Pro for COMMAND AND CONQUER GENERALS: ZERO HOUR

Author(s): EA Games, FAS, xezon

Download from: http://gentool.net/download/controlbarpro

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
   or  GeneralsControlBarProShell.cmd if the non-shell does not work properly

3. If IPv4 address and/or E-Mail address need to be hidden in game for streaming purposes,
   then open launcherControlBarProZH\big.txt file with text editor
   and add following 2 lines. Then save the file changes.

..\340_ControlBarProHideIpZH.big
..\340_ControlBarProHideMailZH.big


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
  Brazilian, Chinese, English, French, German, Italian, Korean, Polish, Spanish

+ No mismatch between player installation in Network and Online.

+ Best visual quality is served in 1920 x 1080 window resolution.

+ This addon combines well with the Control Bar HD Addon for upscaled icon textures.
  > http://gentool.net/download/controlbar

+ This product is self contained and has no dependencies other than the original game.
  Some features may not work correctly if you have other third party modifications installed.
  
  The following files MUST not be modified:
  > Data\INI\ControlBarScheme.ini
  > Window\ControlBar.wnd
  > Window\GeneralsExpPoints.wnd
  > Window\GenPowersShortcutBarChina.wnd
  > Window\GenPowersShortcutBarGLA.wnd
  > Window\GenPowersShortcutBarUS.wnd
  > Window\ReplayControl.wnd
  
  The following files SHOULD not be modified for the best experience:
  > Window\ControlBarPopupDescription.wnd
  > Window\Diplomacy.wnd
  > Window\InGameChat.wnd
  > Window\DisconnectScreen.wnd
  > Window\MessageBox.wnd
  > Window\PopupBuddyListNotification.wnd
  > Window\QuitMessageBox.wnd
  > Window\QuitNoSave.wnd


-----------------------------------------------------------------------------------------------
--- CHANGELOG ---------------------------------------------------------------------------------

v1.0:
- Initial release
