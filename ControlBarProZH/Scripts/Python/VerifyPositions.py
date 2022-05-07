import os
from glob import glob
from common import util
from common.parse import search, Result


class VerifyError:
    file: str
    text: str
    lineNum: str
    desc: str


VerifyErrors = list[VerifyError]


def VerifyOnPatternInText(pattern: str, file: str, text: str, lineNum: int, errors: VerifyErrors) -> None:
    res: Result = search(pattern, text)
    idx: int = 0

    if res != None:
        for idx in reversed(range(len(res.fixed))):
            value: int = res.fixed[idx]
            if value & 1 != 0:
                error = VerifyError()
                error.file = file
                error.text = text
                error.lineNum = lineNum
                error.desc = f"{value} is not a multiple of 2"
                errors.append(error)


def VerifyPositionsInWindowFiles(files: list[str], errors: VerifyErrors):
    file: str

    for file in files:
        print(f"Verify positions in window file {file} ...")
        line: str
        text: str = util.ReadTextFile(file)
        lineNum: int = 1

        for line in text.splitlines():
            VerifyOnPatternInText('UPPERLEFT: {:d} {:d}', file, line, lineNum, errors)
            VerifyOnPatternInText('BOTTOMRIGHT: {:d} {:d}', file, line, lineNum, errors)
            VerifyOnPatternInText('CREATIONRESOLUTION: {:d} {:d}', file, line, lineNum, errors)
            lineNum += 1


def VerifyPositionsInMappedImageFiles(files: list[str], errors: VerifyErrors):
    file: str

    for file in files:
        print(f"Verify positions in mapped image file {file} ...")
        line: str
        text: str = util.ReadTextFile(file)
        lineNum: int = 1

        for line in text.splitlines():
            VerifyOnPatternInText('TextureWidth = {:d}', file, line, lineNum, errors)
            VerifyOnPatternInText('TextureHeight = {:d}', file, line, lineNum, errors)
            VerifyOnPatternInText('Coords = Left:{:d} Top:{:d} Right:{:d} Bottom:{:d}', file, line, lineNum, errors)
            lineNum += 1


def VerifyPositionsInUiFiles(files: list[str], errors: VerifyErrors):
    file: str

    for file in files:
        print(f"Verify positions in ui file {file} ...")
        line: str
        text: str = util.ReadTextFile(file)
        lineNum: int = 1

        for line in text.splitlines():
            VerifyOnPatternInText('X:{:d} Y:{:d}', file, line, lineNum, errors)
            lineNum += 1


def VerifyPositionsInFiles(windowFiles: list[str], mappedImageFiles: list[str], uiFiles: list[str]) -> None:
    errors = VerifyErrors()

    VerifyPositionsInWindowFiles(windowFiles, errors)
    VerifyPositionsInMappedImageFiles(mappedImageFiles, errors)
    VerifyPositionsInUiFiles(uiFiles, errors)

    error: VerifyError
    for error in errors:
        print(f"Position error in file {error.file}")
        print(f"Line {error.lineNum}: {error.text}")
        print(f"Info: {error.desc}")

    if len(errors) > 0:
        raise Exception("Coordinate position errors were found")


def OnEvent(**kwargs) -> None:
    print("Verify Positions ...")

    buildThing = kwargs.get("_rawBuildThing")
    assert buildThing != None

    windowFiles = list[str]()
    mappedImageFiles = list[str]()
    uiFiles = list[str]()

    for buildFile in buildThing.files:
        if buildFile.RequiresRebuild():
            filePath: str = buildFile.AbsRealSource()

            if util.HasFileExt(filePath, "wnd"):
                windowFiles.append(filePath)
            elif util.HasFileExt(filePath, "ini"):
                if "mappedimages" in filePath.lower():
                    mappedImageFiles.append(filePath)
                else:
                    uiFiles.append(filePath)

    VerifyPositionsInFiles(windowFiles, mappedImageFiles, uiFiles)


def Main() -> None:
    thisDir: str = util.GetAbsFileDir(__file__)
    gameFilesDir: str = os.path.normpath(os.path.join(thisDir, "..", "..", "GameFilesEdited"))
    windowFiles: list[str] = glob(os.path.join(gameFilesDir, "Window", "**", "*.wnd"), recursive=True)
    mappedImageFiles: list[str] = glob(os.path.join(gameFilesDir, "Data", "INI", "MappedImages", "HandCreated", "*.ini"))
    uiFiles: list[str] = [os.path.join(gameFilesDir, "Data", "INI", "ControlBarScheme.ini")]

    assert len(windowFiles) > 0, "Window file count should not be 0"
    assert len(mappedImageFiles) > 0, "Mapped Images file count should not be 0"
    assert len(uiFiles) > 0, "UI file count should not be 0"

    VerifyPositionsInFiles(windowFiles, mappedImageFiles, uiFiles)


if __name__ == "__main__":
    Main()
