import os
from dataclasses import dataclass
from typing import Any
from common import util
from common.parse import search


def AllowScale(s: str) -> bool:
    return s.find("NoScale") < 0


def ReScale(s: str, scale: float) -> float:
    rescale: float = scale
    if rescale > 1.0:
        upScaleMult = search("UpScaleMult={:f}", s)
        if upScaleMult != None:
            rescale = 1.0 + (rescale - 1.0) * upScaleMult[0]
    return rescale


def ScaleFontSizesInHeaderTemplateIni(inText: str, fontScale: float) -> str:
    outText: str = ""
    headerTemplateIniPattern: str = "Point = {:d}"
    line: str

    for line in inText.splitlines(keepends=True):
        if AllowScale(line):
            pointSize: int = search(headerTemplateIniPattern, line)

            if pointSize != None:
                rescale: float = ReScale(line, fontScale)
                newPointSize: int = round(pointSize[0] * rescale)
                curPointStr: str = headerTemplateIniPattern.format(pointSize[0])
                newPointStr: str = headerTemplateIniPattern.format(newPointSize)
                line = line.replace(curPointStr, newPointStr)
                print(curPointStr + " -> " + newPointStr)

        outText += line

    return outText


def ScaleFontSizesInLanguageIni(inText: str, fontScale: float) -> str:
    outText: str = ""
    languageIniPatternA: str = "{:d} Yes"
    languageIniPatternB: str = "{:d} No"
    line: str

    for line in inText.splitlines(keepends=True):
        if AllowScale(line):
            pattern: str = languageIniPatternA
            pointSize: int = search(pattern, line)

            if pointSize == None:
                pattern = languageIniPatternB
                pointSize = search(pattern, line)

            if pointSize != None:
                rescale: float = ReScale(line, fontScale)
                newPointSize: int = round(pointSize[0] * rescale)
                curPointStr: str = pattern.format(pointSize[0])
                newPointStr: str = pattern.format(newPointSize)
                line = line.replace(curPointStr, newPointStr)
                print(curPointStr + " -> " + newPointStr)

        outText += line

    return outText


def OnEvent(**kwargs) -> None:
    print("Modify Font Sizes ...")

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

    subBuildDir: str = os.path.join(buildDir, "ModifyFontSizes", str(size))

    for bundleFile in bundleItem.files:
        inFilePath: str = bundleFile.absSourceFile
        fileName: str = util.GetFileName(inFilePath).lower()

        isHeaderTemplateIni: bool = fileName == "headertemplate.ini"
        isLanguageIni: bool = fileName == "language.ini"

        if not isHeaderTemplateIni and not isLanguageIni:
            continue

        print(f"Read file '{inFilePath}'")

        text: str = util.ReadTextFile(inFilePath)

        modifiedText: str = None
        if isHeaderTemplateIni:
            modifiedText = ScaleFontSizesInHeaderTemplateIni(text, scale)
        elif isLanguageIni:
            modifiedText = ScaleFontSizesInLanguageIni(text, scale)

        assert modifiedText != None

        outFilePath: str = os.path.join(subBuildDir, bundleFile.relTargetFile)

        print(f"Write file '{outFilePath}'")

        util.MakeDirsForFile(outFilePath)
        util.WriteTextFile(outFilePath, modifiedText)

        bundleFile.absSourceFile = outFilePath


if __name__ == "__main__":

    @dataclass
    class BundleFile:
        absSourceFile: str
        relTargetFile: str

    @dataclass
    class BundleItem:
        files: list[BundleFile]

    thisDir: str = util.GetAbsFileDir(__file__)

    bundleFiles = [
        BundleFile(
            absSourceFile=os.path.join(thisDir, "..", "..", "GameFilesEditedLanguage", "Data", "English", "HeaderTemplate.ini"),
            relTargetFile=os.path.join("Data", "English", "HeaderTemplate.ini")),
        BundleFile(
            absSourceFile=os.path.join(thisDir, "..", "..", "GameFilesEditedLanguage", "Data", "English", "Language.ini"),
            relTargetFile=os.path.join("Data", "English", "Language.ini")),
    ]

    for bundleFile in bundleFiles:
        bundleFile.absSourceFile = os.path.normpath(bundleFile.absSourceFile)
        bundleFile.relTargetFile = os.path.normpath(bundleFile.relTargetFile)

    absBuildDir: str = os.path.join(thisDir, "..", "..", ".Build")
    absBuildDir = os.path.normpath(absBuildDir)

    kwargs = {
        "_absBuildDir": absBuildDir,
        "_bundleItem": BundleItem(files=bundleFiles),
        "size": 720
        }

    OnEvent(**kwargs)
