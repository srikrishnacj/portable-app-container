SET CURRENT_PATH=%~dp0
SET PAC=%CURRENT_PATH:~0,-1%

SET BIN_FOLDER=%PAC%\pac-bin
SET UTIL=%BIN_FOLDER%\util
SET CONFIG_FOLDER=%PAC%\pac-config
SET PAC_TEMP=%PAC%\pac-temp
SET APP_DIR=%PAC%\portable-apps

IF "%PAC_FIRST_RUN%" == "" (
    set PAC_FIRST_RUN=true
) else (
    set PAC_FIRST_RUN=false
)

SET TAB=

@call %BIN_FOLDER%\alias-task.bat
@call %BIN_FOLDER%\path-task.bat
@call %BIN_FOLDER%\env-task.bat
@call %BIN_FOLDER%\copy-task.bat
@call %BIN_FOLDER%\startmenu-task.bat
@call %BIN_FOLDER%\startupdir-task.bat
if not "%1"=="debug" call cls
@call %BIN_FOLDER%\banner-task.bat