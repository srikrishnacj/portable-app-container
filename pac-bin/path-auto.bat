rem automatically added all portable applications in path portable-apps folder.
rem note: only adds the root folders in portable-apps. if you dont want automatically add folder to path put it in sub folder

ECHO Setting AUTO PATH

SET TEMP1=%TEMP_FOLDER%\temp-path-auto.txt
del %TEMP1% >nul 2>&1

@echo off
for /d %%i in ("%APP_DIR%\*") do (
    echo %%i>>%TEMP1%
    echo %%i\bin>>%TEMP1%
)

SET T_PATH=
for /F "tokens=*" %%a in (%TEMP1%) do (
	call set "T_PATH=%%T_PATH%%;%%a"
	echo %TAB%Adding to PATH:= %%a
)

set "PATH=%PATH%;%T_PATH%"
ECHO.