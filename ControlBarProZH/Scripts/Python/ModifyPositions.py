import os
from typing import Callable
from glob import glob
from common import util
from common.parse import search, Result


def ReplacePatternInText(pattern: str, text: str, func: Callable) -> str:
    res: Result = search(pattern, text)
    out: str = text
    idx: int = 0

    if res != None:
        for idx in reversed(range(len(res.fixed))):
            val: int = func(res.fixed[idx])
            lo: int = res.spans[idx][0]
            hi: int = res.spans[idx][1]
            out = out[:lo] + str(val) + out[hi:]
    return out


def ScalePositionsInWindowFiles(files: list[str], ScaleFunc: Callable):
    file: str

    for file in files:
        line: str
        text: str = util.ReadTextFile(file)
        modifiedText: str = ""

        for line in text.splitlines(keepends=True):
            line = ReplacePatternInText('UPPERLEFT: {:d} {:d}', line, ScaleFunc)
            line = ReplacePatternInText('BOTTOMRIGHT: {:d} {:d}', line, ScaleFunc)
            line = ReplacePatternInText('CREATIONRESOLUTION: {:d} {:d}', line, ScaleFunc)

            modifiedText += line

        util.WriteTextFile(file, modifiedText)


def ScalePositionsInMappedImageFiles(files: list[str], ScaleFunc: Callable):
    file: str

    for file in files:
        line: str
        text: str = util.ReadTextFile(file)
        modifiedText: str = ""

        for line in text.splitlines(keepends=True):
            line = ReplacePatternInText('TextureWidth = {:d}', line, ScaleFunc)
            line = ReplacePatternInText('TextureHeight = {:d}', line, ScaleFunc)
            line = ReplacePatternInText('Coords = Left:{:d} Top:{:d} Right:{:d} Bottom:{:d}', line, ScaleFunc)

            modifiedText += line

        util.WriteTextFile(file, modifiedText)


def ScalePositionsInUiFiles(files: list[str], ScaleFunc: Callable):
    file: str

    for file in files:
        line: str
        text: str = util.ReadTextFile(file)
        modifiedText: str = ""

        for line in text.splitlines(keepends=True):
            line = ReplacePatternInText('X:{:d} Y:{:d}', line, ScaleFunc)

            modifiedText += line

        util.WriteTextFile(file, modifiedText)


def Main() -> None:
    thisDir: str = util.GetAbsFileDir(__file__)
    gameFilesDir: str = os.path.normpath(os.path.join(thisDir, "..", "..", "GameFilesEdited"))
    windowFiles: list[str] = glob(os.path.join(gameFilesDir, "Window", "**", "*.wnd"), recursive=True)
    mappedImageFiles: list[str] = glob(os.path.join(gameFilesDir, "Data", "INI", "MappedImages", "HandCreated", "*.ini"))
    uiFiles: list[str] = [os.path.join(gameFilesDir, "Data", "INI", "ControlBarScheme.ini")]

    assert len(windowFiles) > 0, "Window file count should not be 0"
    assert len(mappedImageFiles) > 0, "Mapped Images file count should not be 0"
    assert len(uiFiles) > 0, "UI file count should not be 0"

    ScaleFunc = lambda value: int(value * 2.0)

    ScalePositionsInWindowFiles(windowFiles, ScaleFunc)
    ScalePositionsInMappedImageFiles(mappedImageFiles, ScaleFunc)
    ScalePositionsInUiFiles(uiFiles, ScaleFunc)


if __name__ == "__main__":
    Main()
