SET CURRENT_PATH=%~dp0
SET PAC=%CURRENT_PATH:~0,-1%

SET BIN_FOLDER=%PAC%\pac-bin
SET TOOL_FOLDER=%BIN_FOLDER%\tool
SET UTIL=%BIN_FOLDER%\util
SET CONFIG_FOLDER=%PAC%\pac-config
SET PAC_TEMP=%PAC%\pac-temp
SET APP_DIR=%PAC%\portable-apps
set "PATH=%PATH%;%TOOL_FOLDER%"

IF "%PAC_FIRST_RUN%" == "" (
    set PAC_FIRST_RUN=true
) else (
    set PAC_FIRST_RUN=false
)

SET "TAB=   "