@REM Does variable substitution on string given in a file

SET SOURCE=%1
SET DESTINATION=%TEMP_FOLDER%\temp-expand.txt

del %DESTINATION% >nul 2>&1

SETLOCAL ENABLEDELAYEDEXPANSION
for /F "tokens=*" %%a in (%SOURCE%) do (
	call set "expanded=%%a"
	echo !expanded!>>%DESTINATION%
)
endlocal

del %SOURCE% >nul 2>&1
for /F "tokens=*" %%a in (%DESTINATION%) do (
	echo %%a>>%SOURCE%
)