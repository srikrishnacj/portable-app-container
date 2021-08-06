rem https://stackoverflow.com/questions/3068929/how-to-read-file-contents-into-a-variable-in-a-batch-file

ECHO Setting ENV

SET CONFIG_FILE=%CONFIG_FOLDER%\env.txt
SET ENV_TEMP_FILE=%TEMP_FOLDER%\temp-env.txt
SET ENV_TEMP_FILE_2=%TEMP_FOLDER%\temp-env-2.txt
del %ENV_TEMP_FILE% >nul 2>&1
del %ENV_TEMP_FILE_2% >nul 2>&1

if not exist %CONFIG_FILE% (
	echo "Env Config file not found at: "%CONFIG_FILE%
	echo "Stopping Script Execution"
	exit /b
)

@call %UTIL%\sanitize.bat %CONFIG_FILE% %ENV_TEMP_FILE%

if not exist %ENV_TEMP_FILE% (
	echo %TAB%no env variables to add
	goto end
)

@call %UTIL%\expand-variables.bat %ENV_TEMP_FILE%

for /f "delims== tokens=1,2" %%G in (%ENV_TEMP_FILE%) do (
	set %%G=%%H
	echo %TAB%Adding Variable %%G = %%H
)

:end
SET CONFIG_FILE=
SET ENV_TEMP_FILE=
SET ENV_TEMP_FILE_2=
set key=
SET value=

ECHO.