import os
import sys
import argparse
from pathlib import Path
from parse import *


g_fontResList   = [ 720, 900, 1080, 1440, 2160 ]
g_fontScaleList = [ 0.9, 0.9,  1.0,  1.2,  1.9 ]


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
    parser = argparse.ArgumentParser(prog='MAKE_Language_Ini.py')
    parser.add_argument('-resolution', nargs=1, type=int)
    parser.add_argument('-source', nargs=1, type=ascii)
    parser.add_argument('-dest', nargs=1, type=ascii)
    args = parser.parse_args()
    resolution = args.resolution[0]
    sourceDir = os.path.normpath(args.source[0].strip("'"))
    destDir = os.path.normpath(args.dest[0].strip("'"))
    print('resolution:' + str(resolution))
    print('source:' + sourceDir)
    print('dest:' + destDir)
    for resIndex in range(len(g_fontResList)):
        if g_fontResList[resIndex] == resolution:
            fontScale = g_fontScaleList[resIndex]
            pathList = Path(sourceDir).glob('*.ini_resx')
            for path in pathList:
                inputFileName = str(path)
                fileName = os.path.basename(path)
                fileNameWithoutExt = os.path.splitext(fileName)[0]
                fileContent = ReadFileContent(inputFileName)
                outputFileName = destDir + '\\' + fileNameWithoutExt + '.ini'
                fileContentModified = ScaleFontSizes(fileContent, fontScale)
                WriteFileContent(outputFileName, fileContentModified)
                print("Write file :" + outputFileName)
                print(fileContentModified)


main()
