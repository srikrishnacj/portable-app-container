@REM Does variable substitution on string given in a file

SET TEMP_EV_SOURCE=%1
SET TEMP_EV_DST=%PAC_TEMP%\expand-variables.txt

del %TEMP_EV_DST% >nul 2>&1

SETLOCAL ENABLEDELAYEDEXPANSION
for /F "tokens=*" %%a in (%TEMP_EV_SOURCE%) do (
	call set "expanded=%%a"
	echo !expanded!>>%TEMP_EV_DST%
)
endlocal

@call %UTIL%\copy-file.bat %TEMP_EV_DST% %TEMP_EV_SOURCE%
