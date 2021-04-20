set GameDataDir=..\GameFilesEdited\Data

for %%l in (Brazilian,Chinese,English,French,German,Italian,Korean,Polish,Spanish) do (
	ren %GameDataDir%\%%l\*.%1 *.%2
)
