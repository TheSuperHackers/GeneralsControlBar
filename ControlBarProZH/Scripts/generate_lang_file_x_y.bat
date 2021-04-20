set GameDataDir=..\GameFilesEdited\Data

for %%l in (Brazilian,Chinese,English,French,German,Italian,Korean,Polish,Spanish) do (
	copy %GameDataDir%\%%l\*.%1 %GameDataDir%\%%l\*.%2
)
