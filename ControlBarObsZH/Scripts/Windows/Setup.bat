@echo off

set SetupDir=%~dp0.

set ModBuilderVer=1.3
set ModBuilderDir=%SetupDir%\.GeneralsModBuilder\v%ModBuilderVer%
set ModBuilderExe=%ModBuilderDir%\generalsmodbuilder.exe
set ModBuilderZip=%ModBuilderDir%\generalsmodbuilder.zip
set ModBuilderZipUrl=https://github.com/TheSuperHackers/GeneralsTools/raw/main/Tools/generalsmodbuilder/v%ModBuilderVer%/generalsmodbuilder_v%ModBuilderVer%.zip
set ModBuilderZipSha256=3084a157402863622f81cfccf245b7e4e9d7be38233b56b7e3a2c235f1eaac79
set ModBuilderZipSize=7885138

set ConfigDir=%SetupDir%\..\..
set ConfigFiles=^
    "%ConfigDir%\ModBundleItems.json" ^
    "%ConfigDir%\ModBundlePacks.json" ^
    "%ConfigDir%\ModFolders.json" ^
    "%ConfigDir%\ModRunner.json"

if [%~1]==[print] (
    echo SETUP. Using Generals Mod Builder:
    echo ver... %ModBuilderVer%
    echo dir... %ModBuilderDir%
    echo exe... %ModBuilderExe%
    echo zip... %ModBuilderZip%
    echo zipurl %ModBuilderZipUrl%
    echo zipsha %ModBuilderZipSha256%
    echo zipsiz %ModBuilderZipSize%
    for %%f in (%ConfigFiles%) do (
        echo config %%f
    )
    echo SETUP END.
)
