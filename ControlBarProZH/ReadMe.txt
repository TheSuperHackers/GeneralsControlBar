1. Edit game directory in MAKE_Install.bat and save
2. Start cmd (Command Prompt) as Administrator
3. Run MAKE_Install_Run.bat


Guidelines for editing WND Files:

Never resize an element to 0 size, such as
  SCREENRECT = UPPERLEFT: 0 0,
               BOTTOMRIGHT: 0 0,

It can cause the game to crash.
