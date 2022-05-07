import os
from io import BufferedWriter


def GetFileName(file: str) -> str:
    path, file = os.path.split(file)
    return file


def GetFileExt(file: str) -> str:
    path, ext = os.path.splitext(file)
    if ext and ext[0] == '.':
        ext = ext[1:]
    return ext


def HasFileExt(file: str, expectedExt: str) -> bool:
    fileExt: str = GetFileExt(file)
    return fileExt.lower() == expectedExt.lower()


def GetAbsFileDir(file: str) -> str:
    dir: str
    dir = os.path.dirname(file)
    dir = os.path.abspath(dir)
    return dir


def MakeDirsForFile(file: str) -> None:
    os.makedirs(GetAbsFileDir(file), exist_ok=True)


def ReadTextFile(path: str) -> str:
    content: str = ""
    with open(path, "r") as file:
        content = file.read()
    return content


def WriteTextFile(path: str, content: str):
    with open(path, "w") as file:
        file.write(content)
