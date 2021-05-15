import os
from pathlib import Path
from parse import *


g_iniExtList    = [ ".ini_720", ".ini_900", ".ini_1080", ".ini_1440", ".ini_2160" ]
g_fontScaleList = [ 1.0       , 1.1       , 1.0        , 1.4        , 2.0         ]

# Note: Original font sizes scaled by 2.0 or higher will cause issues with text in Load Replay scroll box.
# Tested in English and German languages.


def ReadFileContent(path):
    fileOutput = ""
    file = open(path, "r")
    for line in file:
        fileOutput += line
    file.close()
    return fileOutput


def WriteFileContent(path, fileContent):
    file = open(path, "w")
    file.write(fileContent)
    file.close()


def ScaleFontSizes(inText, fontScale):
    outText = ""
    headerTemplateIniPattern = 'Point = {:d}'
    languageIniPatternA = '{:d} Yes'
    languageIniPatternB = '{:d} No'
    noScalePattern = 'NoScale'
    upScaleMultPattern = 'UpScaleMult={:f}'
    
    for line in inText.splitlines():
        if line.find(noScalePattern) < 0:
            # Scale given font scale
            newFontScale = fontScale;
            if newFontScale > 1.0:
                upScaleMult = search(upScaleMultPattern, line)
                if upScaleMult is not None:
                    newFontScale = 1.0 + (newFontScale - 1.0) * upScaleMult[0]
            # HeaderTemplate.ini pattern
            pointSize = search(headerTemplateIniPattern, line)
            if pointSize is not None:
                newPointSize = round(pointSize[0] * newFontScale)
                curPointStr = headerTemplateIniPattern.format(pointSize[0])
                newPointStr = headerTemplateIniPattern.format(newPointSize)
                line = line.replace(curPointStr, newPointStr)
                print(curPointStr + ' -> ' + newPointStr)
            else:
                #Language.ini pattern
                pattern = languageIniPatternA
                pointSize = search(pattern, line)
                if pointSize is None:
                    pattern = languageIniPatternB
                    pointSize = search(pattern, line)
                if pointSize is not None:
                    newPointSize = round(pointSize[0] * newFontScale)
                    curPointStr = pattern.format(pointSize[0])
                    newPointStr = pattern.format(newPointSize)
                    line = line.replace(curPointStr, newPointStr)
                    print(curPointStr + ' -> ' + newPointStr)
        # Add original or modified line to output text
        outText += line + "\n"
    return outText


def main():
    pathList = Path("../GameFilesEdited/Data/").glob('**/*.ini_resx')
    for path in pathList:
        fileName = str(path)
        fileNameWithoutExt = os.path.splitext(fileName)[0]
        fileContent = ReadFileContent(fileName)
        for iniIndex in range(len(g_iniExtList)):
            iniExt = g_iniExtList[iniIndex]
            fontScale = g_fontScaleList[iniIndex]
            fileNameModified = fileNameWithoutExt + iniExt
            fileContentModified = ScaleFontSizes(fileContent, fontScale)
            WriteFileContent(fileNameModified, fileContentModified)
            print("Write file :" + fileNameModified)
            print(fileContentModified)


main()
