import os
from enum import Enum, auto
from typing import Any, Callable
from glob import glob
from common import util
from common.parse import search, Result


ModifyTextFuncT = Callable[[Any], None]


class FileType(Enum):
    Irrelevant = 0
    Window = auto()
    MappedImage = auto()
    Ui = auto()


def ReplacePatternInText(pattern: str, inText: str, ModifyTextFunc: ModifyTextFuncT) -> str:
    out: str = inText
    res: Result = search(pattern, inText)
    idx: int = 0

    if res != None:
        for idx in reversed(range(len(res.fixed))):
            rawValue: int = res.fixed[idx]
            modifiedValue: int = ModifyTextFunc(rawValue)
            lo: int = res.spans[idx][0]
            hi: int = res.spans[idx][1]
            out = out[:lo] + str(modifiedValue) + out[hi:]

    return out


def ScalePositionsInWindowText(inText: str, ScaleFunc: ModifyTextFuncT) -> str:
    outText: str = ""
    line: str

    for line in inText.splitlines(keepends=True):
        line = ReplacePatternInText("UPPERLEFT: {:d} {:d}", line, ScaleFunc)
        line = ReplacePatternInText("BOTTOMRIGHT: {:d} {:d}", line, ScaleFunc)
        line = ReplacePatternInText("CREATIONRESOLUTION: {:d} {:d}", line, ScaleFunc)
        outText += line

    return outText


def ScalePositionsInMappedImageText(inText: str, ScaleFunc: ModifyTextFuncT):
    outText: str = ""
    line: str

    for line in inText.splitlines(keepends=True):
        line = ReplacePatternInText("TextureWidth = {:d}", line, ScaleFunc)
        line = ReplacePatternInText("TextureHeight = {:d}", line, ScaleFunc)
        line = ReplacePatternInText("Coords = Left:{:d} Top:{:d} Right:{:d} Bottom:{:d}", line, ScaleFunc)
        outText += line

    return outText


def ScalePositionsInUiText(inText: str, ScaleFunc: ModifyTextFuncT):
    outText: str = ""
    line: str

    enableModification = True

    for line in inText.splitlines(keepends=True):
        modifypositions: Result = search("modifypositions = {:d}", line)
        if modifypositions:
            enableModification = modifypositions[0] > 0

        if enableModification:
            line = ReplacePatternInText("X:{:d} Y:{:d}", line, ScaleFunc)

        outText += line

    return outText


def OnEvent(**kwargs) -> None:
    print("Modify INI/WND Positions ...")

    buildDir: str = kwargs.get("_absBuildDir")
    bundleItem: Any = kwargs.get("_bundleItem")
    size: int = kwargs.get("size")
    scale: float = kwargs.get("scale")

    assert buildDir != None, "_buildDir kwargs not found"
    assert bundleItem != None, "_bundleItem kwargs not found"
    assert size != None, "size kwargs not found"
    assert scale != None, "scale kwargs not found"

    if scale == 1.0:
        return

    def ScaleFunc(value: int) -> int:
        multipleOf: int = int(1 / scale)
        if value % multipleOf != 0:
            raise ValueError(f"{value} is not a multiple of {multipleOf}")
        return int(value * scale)

    subBuildDir: str = os.path.join(buildDir, "ModifyPositions", str(size))

    for bundleFile in bundleItem.files:
        inFilePath: str = bundleFile.absSourceFile
        fileType = FileType.Irrelevant

        if util.HasFileExt(inFilePath, "wnd"):
            fileType = FileType.Window
        elif util.HasFileExt(inFilePath, "ini"):
            if "mappedimages" in inFilePath.lower():
                fileType = FileType.MappedImage
            else:
                fileType = FileType.Ui

        if fileType == fileType.Irrelevant:
            continue

        print(f"Read file '{inFilePath}'")

        text: str = util.ReadTextFile(inFilePath)

        modifiedText: str = None
        if fileType == FileType.Window:
            modifiedText = ScalePositionsInWindowText(text, ScaleFunc)
        elif fileType == FileType.MappedImage:
            modifiedText = ScalePositionsInMappedImageText(text, ScaleFunc)
        elif fileType == FileType.Ui:
            modifiedText = ScalePositionsInUiText(text, ScaleFunc)

        assert modifiedText != None

        outFilePath: str = os.path.join(subBuildDir, bundleFile.relTargetFile)

        print(f"Write file '{outFilePath}'")

        util.MakeDirsForFile(outFilePath)
        util.WriteTextFile(outFilePath, modifiedText)

        bundleFile.absSourceFile = outFilePath


def ScalePositionsInWindowFiles(files: list[str], ScaleFunc: Callable):
    file: str

    for file in files:
        text: str = util.ReadTextFile(file)
        modifiedText: str = ScalePositionsInWindowText(text, ScaleFunc)
        util.WriteTextFile(file, modifiedText)


def ScalePositionsInMappedImageFiles(files: list[str], ScaleFunc: Callable):
    file: str

    for file in files:
        text: str = util.ReadTextFile(file)
        modifiedText: str = ScalePositionsInMappedImageText(text, ScaleFunc)
        util.WriteTextFile(file, modifiedText)


def ScalePositionsInUiFiles(files: list[str], ScaleFunc: Callable):
    file: str

    for file in files:
        text: str = util.ReadTextFile(file)
        modifiedText: str = ScalePositionsInUiText(text, ScaleFunc)
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
