rem https://stackoverflow.com/questions/3068929/how-to-read-file-contents-into-a-variable-in-a-batch-file

@call %UTIL%\remove-temp-variables.bat

ECHO Setting Environment Variables

SET ENV_CONFIG=%CONFIG_FOLDER%\env.txt
SET TEMP_ENV_CONFIG=%PAC_TEMP%\env.txt

if not exist %ENV_CONFIG% (
	echo "Env Config file not found at: "%CONFIG_FILE%
	echo "Stopping Script Execution"
	exit /b
)

@call %UTIL%\clean-file.bat %TEMP_ENV_CONFIG%
@call %UTIL%\copy-file.bat %ENV_CONFIG% %TEMP_ENV_CONFIG%
@call %UTIL%\remove-comments-from-file.bat %TEMP_ENV_CONFIG%
@call %UTIL%\remove-white-spaces-in-file.bat %TEMP_ENV_CONFIG%
@call %UTIL%\expand-variables.bat %TEMP_ENV_CONFIG%

for /f "delims== tokens=1,2" %%G in (%TEMP_ENV_CONFIG%) do (
	set %%G=%%H
	echo %TAB%Adding Variable %%G = %%H
)

ECHO.