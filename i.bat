@echo off
cls

SET CURRENT_PATH=%~dp0
SET CURRENT_PATH=%CURRENT_PATH:~0,-1%
SET PAC=%CURRENT_PATH%
echo %PAC%

SET BIN_FOLDER=%CURRENT_PATH%\pac-bin
SET UTIL=%BIN_FOLDER%\util
SET CONFIG_FOLDER=%CURRENT_PATH%\pac-config
SET TEMP_FOLDER=%CURRENT_PATH%\pac-temp


@call %BIN_FOLDER%\index.bat


rem TODO add validations to check all app folders exists or not
rem TODO instead of stoping script if config file not found, we can simply skip that stage
rem TODO paths.bat if path is absolute then through error
rem TODO env.bat variable substitution in env.txt
rem TODO copy.bat variable substitution in copy.txt