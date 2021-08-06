rem reads paths from path.txt and sets the path variables

rem https://stackoverflow.com/questions/18600317/batch-file-append-a-string-inside-a-for-loop/18600971

ECHO Setting PATH

SET CONFIG_FILE=%CONFIG_FOLDER%\path.txt
SET PATH_TEMP_FILE=%TEMP_FOLDER%\temp-path.txt
SET PATH_TEMP_FILE_2=%TEMP_FOLDER%\temp-path-2.txt

del %PATH_TEMP_FILE% >nul 2>&1
del %PATH_TEMP_FILE_2% >nul 2>&1

if not exist %CONFIG_FILE% (
	echo "Path Config file not found at: "%CONFIG_FILE%
	echo "Stopping Script Execution"
	exit /b
)

@call %UTIL%\sanitize.bat %CONFIG_FILE% %PATH_TEMP_FILE%

if not exist %PATH_TEMP_FILE% (
	echo %TAB%no paths to add
	goto end
)

@call %UTIL%\expand-variables.bat %PATH_TEMP_FILE%

for /F "tokens=*" %%a in (%PATH_TEMP_FILE%) do (
	if not exist %%a (
	    ECHO %TAB%Skipping. It does not exists. %%a
	) else IF not EXIST %%a\ (
		ECHO %TAB%Skipping. It is not a directory. %%a
	) else (
		echo %%a>>%PATH_TEMP_FILE_2%
	)
)

if not exist %PATH_TEMP_FILE_2% (
	echo %TAB%no valid paths to add
	goto end
)

SET T_PATH=
for /F "tokens=*" %%a in (%PATH_TEMP_FILE_2%) do (
	call set "T_PATH=%%T_PATH%%;%%a"
	echo %TAB%Adding to PATH:= %%a
)

set "PATH=%PATH%;%T_PATH%"

:end

SET CONFIG_FILE=
SET PATH_TEMP_FILE=
SET PATH_TEMP_FILE_2=
set expanded=
SET T_PATH=

ECHO.