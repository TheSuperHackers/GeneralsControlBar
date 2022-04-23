# ControlBarProZH

#### How to make game changes
* Add and edit game files in **GameFilesEdited** folder.
* When adding an original game file with text contents, please submit the file as is first before adding any changes. This will preserve change history.

#### Guidelines for editing WND Files:
* Never resize an element to 0 size. It can cause the game to crash. Example:
```
  SCREENRECT = UPPERLEFT: 0 0,
               BOTTOMRIGHT: 0 0,
```
