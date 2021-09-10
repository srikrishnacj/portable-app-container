rem automatically added all portable applications in path portable-apps folder.
rem note: only adds the root folders in portable-apps. if you dont want automatically add folder to path put it in sub folder

ECHO Setting DEFAULT PATHS

SET TEMP_DEFAULT_PATH_CONFIG=%PAC_TEMP%\default-path.txt

@call %UTIL%\clean-file.bat %TEMP_DEFAULT_PATH_CONFIG%

@echo off
for /d %%i in ("%APP_DIR%\*") do (
    echo %%i>>%TEMP_DEFAULT_PATH_CONFIG%
    echo %%i\bin>>%TEMP_DEFAULT_PATH_CONFIG%
)

SET T_PATH=
for /F "tokens=*" %%a in (%TEMP_DEFAULT_PATH_CONFIG%) do (
	call set "T_PATH=%%T_PATH%%;%%a"
	echo %TAB%Adding to PATH:= %%a
)

set "PATH=%PATH%;%T_PATH%"

ECHO.