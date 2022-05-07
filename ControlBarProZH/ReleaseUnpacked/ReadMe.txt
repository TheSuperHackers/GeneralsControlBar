Control Bar Pro for COMMAND AND CONQUER GENERALS: ZERO HOUR

Author(s): EA Games, FAS, xezon

Original download from: http://gentool.net/download/controlbarpro

Code & Assets Source: https://github.com/TheSuperHackers/GeneralsControlBar


-----------------------------------------------------------------------------------------------
--- REQUIREMENTS ------------------------------------------------------------------------------

+ This addon requires GenTool 8.5 or higher to be run properly:
  > http://www.gentool.net


-----------------------------------------------------------------------------------------------
--- INSTALL -----------------------------------------------------------------------------------

1. [OPTIONAL] Delete files of prior install of Control Bar Pro if applicable.

2. Copy all files into the game install directory, for example:
   > C:\Program Files (x86)\EA Games\Command & Conquer Generals Zero Hour
   > On English install it would then look like so:
   > ...\EA Games\Command & Conquer Generals Zero Hour\339_ControlBarProHideIpZH.big.BAK
   > ...\EA Games\Command & Conquer Generals Zero Hour\339_ControlBarProHideMailZH.big.BAK
   > ...\EA Games\Command & Conquer Generals Zero Hour\340_ControlBarPro1080ZH.big
   > ...\EA Games\Command & Conquer Generals Zero Hour\340_ControlBarProZH.big

3. [OPTIONAL] If IPv4 address and/or E-Mail address need to be hidden in game
   for streaming purposes, then run ControlBarPro_ON_OFF_HideIP_HideMail.bat once.

4. Start the game (Run generals.exe)


-----------------------------------------------------------------------------------------------
--- FUNCTIONALTY ------------------------------------------------------------------------------

Control Bar Pro preserves all original game functionality.


-----------------------------------------------------------------------------------------------
--- COMPATIBILITY -----------------------------------------------------------------------------

+ This addon is compatible with COMMAND AND CONQUER GENERALS: ZERO HOUR:
  Brazilian, Chinese, English, French, German, Italian, Korean, Polish, Spanish

+ No mismatch between player installation in Network and Online.

+ Best visual quality is served in 1920x1080 and 3840x2160 window resolutions.

+ This addon combines well with the Control Bar HD Addon for upscaled icon textures.
  > http://gentool.net/download/controlbar

+ This addon is self contained and has no dependencies other than original game and GenTool.
  Some features may not work correctly if you have other third party modifications installed.
  
  The following files MUST not be modified:
  > Data\Language\HeaderTemplate.ini
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
  > Window\QuitMenu.wnd
  > Window\QuitMessageBox.wnd
  > Window\QuitNoSave.wnd


-----------------------------------------------------------------------------------------------
--- TROUBLESHOOTING ---------------------------------------------------------------------------

+ If Control Bar Pro does not look correct, then game has modified files that are loaded
  instead of the files provided by this Addon. In that case, other modified files must be
  deleted. NOTE: Game files outside of BIG files are loaded before any files in BIG files.
  And BIG files with names in less alphabetical order are loaded before BIG files with names
  in greater alphabetical order.

+ If original control bar textures are shown, then likely game has modified INI and/or WND
  files somewhere that break the install of this addon. See list above of which files must not
  be changed by other game modifications.

+ If texts in menus are very small, then Data\Language\HeaderTemplate.ini is modified
  somewhere.

+ If you are unsure how to fix the modifications you have applied to the game,
  then uninstall Generals Zero Hour, delete all remaining files in the game install directory,
  reinstall Generals Zero Hour, (Run GenPatcher), install GenTool, install Control Bar Pro.


-----------------------------------------------------------------------------------------------
--- INFO FOR MOD CREATORS ---------------------------------------------------------------------

This Addon can be modified and redistributed under the MIT License.

When adapting to a custom Mod, please pay special attention to the HeaderTemplate.ini files
supplied by Control Bar Pro. It contains 4 new definitions starting with
"ControlBarProScrollListBox", which are used in various WND files.

The HeaderTemplate definitions and their references in WND files should be replicated, if a Mod
is intended to gracefully support large resolutions, such as 2560x1440 or 3840x2160.


-----------------------------------------------------------------------------------------------
--- CHANGELOG ---------------------------------------------------------------------------------

v1.0:
- Initial release

v1.1:
- Simplified viewport setup with GenTool 8.5
- Fixed scrolling inconsistencies with GenTool 8.5
- Removed GeneralsProxyLauncher files
- Added button to minimize control bar
- Moved message texts 12 pixels lower
- Increased click area of generals powers button
- Fixed scroll list text errors in 3840x2160 and 2560x1440 by reducing font scaling
- Changed textures next to money text and gen power window title texts

v1.2:
- Added high resolution textures for 3840x2160 and 2560x1440 presets
- Added slight transparency to major areas of the Command Bar
- Added DDS DXT formats for all textures
- Added new Quit Menu for Single Player
- Decreased faction icon sizes in Upgrades Window
- Decreased font sizes in 720, 900, 1440, 2160 presets
- Increased font size of group numbers
- Fixed scroll list box text sizes in Disconnect and Diplomacy Window
- Fixed position of Available Gen Points number
- Fixed missing mission log in Single Player diplomacy window
- Improved batch scripts that can toggle this Addon on and off
