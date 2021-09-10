@echo off
cls

SET CURRENT_PATH=%~dp0
SET CURRENT_PATH=%CURRENT_PATH:~0,-1%
SET PAC=%CURRENT_PATH%
echo %PAC%

SET BIN_FOLDER=%CURRENT_PATH%\pac-bin
SET UTIL=%BIN_FOLDER%\util
SET CONFIG_FOLDER=%CURRENT_PATH%\pac-config
SET PAC_TEMP=%CURRENT_PATH%\pac-temp
SET APP_DIR=%CURRENT_PATH%\portable-apps


SET TAB=

@call %BIN_FOLDER%\path-task.bat
@call %BIN_FOLDER%\env-task.bat
@call %BIN_FOLDER%\copy-task.bat
@call %BIN_FOLDER%\startmenu-task.bat
@call %BIN_FOLDER%\startupdir-task.bat
cls
@call %BIN_FOLDER%\banner-task.bat


rem TODO add validations to check all app folders exists or not
rem TODO instead of stoping script if config file not found, we can simply skip that stage
rem TODO paths.bat if path is absolute then through error
rem TODO env.bat variable substitution in env.txt
rem TODO copy.bat variable substitution in copy.txt