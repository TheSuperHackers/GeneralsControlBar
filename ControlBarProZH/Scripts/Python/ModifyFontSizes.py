import os
from io import BufferedWriter
from dataclasses import dataclass
from typing import Any
from parse import search


g_fontResList   = [ 720, 900, 1080, 1440, 2160 ]
g_fontScaleList = [ 0.9, 0.9,  1.0,  1.2,  1.9 ]


def GetFileName(file: str) -> str:
    path, file = os.path.split(file)
    return file


def GetAbsFileDir(file: str) -> str:
    dir: str
    dir = os.path.dirname(file)
    dir = os.path.abspath(dir)
    return dir


def MakeDirsForFile(file: str) -> None:
    os.makedirs(GetAbsFileDir(file), exist_ok=True)


def ReadFile(path: str) -> str:
    content: str = ""
    with open(path) as file:
        content = file.read()
    return content


def WriteFile(path: str, content: str):
    file: BufferedWriter = open(path, "w")
    file.write(content)
    file.close()


def AllowScale(s: str) -> bool:
    return s.find('NoScale') < 0


def ReScale(s: str, scale: float) -> float:
    rescale: float = scale
    if rescale > 1.0:
        upScaleMult = search('UpScaleMult={:f}', s)
        if upScaleMult is not None:
            rescale = 1.0 + (rescale - 1.0) * upScaleMult[0]
    return rescale


def ScaleFontSizesInHeaderTemplateIni(inText: str, fontScale: float) -> str:
    outText: str = ""
    headerTemplateIniPattern: str = 'Point = {:d}'
    line: str

    for line in inText.splitlines():
        if AllowScale(line):
            pointSize: int = search(headerTemplateIniPattern, line)

            if pointSize is not None:
                rescale: float = ReScale(line, fontScale)
                newPointSize: int = round(pointSize[0] * rescale)
                curPointStr: str = headerTemplateIniPattern.format(pointSize[0])
                newPointStr: str = headerTemplateIniPattern.format(newPointSize)
                line = line.replace(curPointStr, newPointStr)
                print(curPointStr + ' -> ' + newPointStr)

        outText += line + "\n"

    return outText


def ScaleFontSizesInLanguageIni(inText: str, fontScale: float) -> str:
    outText: str = ""
    languageIniPatternA: str = '{:d} Yes'
    languageIniPatternB: str = '{:d} No'
    line: str

    for line in inText.splitlines():
        if AllowScale(line):
            pattern: str = languageIniPatternA
            pointSize: int = search(pattern, line)

            if pointSize is None:
                pattern = languageIniPatternB
                pointSize = search(pattern, line)

            if pointSize is not None:
                rescale: float = ReScale(line, fontScale)
                newPointSize: int = round(pointSize[0] * rescale)
                curPointStr: str = pattern.format(pointSize[0])
                newPointStr: str = pattern.format(newPointSize)
                line = line.replace(curPointStr, newPointStr)
                print(curPointStr + ' -> ' + newPointStr)

        outText += line + "\n"

    return outText


def OnPreBuild(**kwargs) -> None:
    buildDir: str = kwargs.get("_absBuildDir")
    bundleItem: Any = kwargs.get("_bundleItem")
    resolution: int = kwargs.get("size")

    assert buildDir != None, "_buildDir kwargs not found"
    assert bundleItem != None, "_bundleItem kwargs not found"
    assert resolution != None, "size kwargs not found"

    subBuildDir: str = os.path.join(buildDir, "ModifyFontSizes", str(resolution))
    fontScale: float = 1.0
    index: int
    bundleFile: Any

    for index in range(len(g_fontResList)):
        if g_fontResList[index] == resolution:
            fontScale = g_fontScaleList[index]
            break

    if fontScale == 1.0:
        return

    for bundleFile in bundleItem.files:
        inFilePath: str = bundleFile.absSourceFile

        print(f"Read file '{inFilePath}'")
        fileContent: str = ReadFile(inFilePath)

        print(f"Modify file ...")
        fileName: str = GetFileName(inFilePath).lower()
        fileContentModified: str = None
        if fileName == "headertemplate.ini":
            fileContentModified = ScaleFontSizesInHeaderTemplateIni(fileContent, fontScale)
        elif fileName == "language.ini":
            fileContentModified = ScaleFontSizesInLanguageIni(fileContent, fontScale)

        if fileContentModified != None:
            outFilePath: str = os.path.join(subBuildDir, bundleFile.relTargetFile)
            bundleFile.absSourceFile = outFilePath
            print(f"Write file '{outFilePath}'")
            MakeDirsForFile(outFilePath)
            WriteFile(outFilePath, fileContentModified)


if __name__ == "__main__":

    @dataclass
    class BundleFile:
        absSourceFile: str
        relTargetFile: str

    @dataclass
    class BundleItem:
        files: list[BundleFile]

    thisDir: str = GetAbsFileDir(__file__)

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

    OnPreBuild(**kwargs)
