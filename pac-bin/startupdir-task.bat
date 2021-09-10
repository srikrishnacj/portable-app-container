@call %UTIL%\remove-temp-variables.bat

SET TEMP_STARTUP_CONFIG=%CONFIG_FOLDER%\startupdir.txt
SET TEMP_STARTUP_TEMP=%PAC_TEMP%\startupdir.txt

if not exist %TEMP_STARTUP_CONFIG% (
	echo "startupdir Config file not found at: "%TEMP_STARTUP_CONFIG%
	echo "Stopping Script Execution"
)

@call %UTIL%\copy-file.bat %TEMP_STARTUP_CONFIG% %TEMP_STARTUP_TEMP%
@call %UTIL%\remove-comments-from-file.bat %TEMP_STARTUP_TEMP%
@call %UTIL%\remove-white-spaces-in-file.bat %TEMP_STARTUP_TEMP%
@call %UTIL%\expand-variables.bat %TEMP_STARTUP_TEMP%
@call %UTIL%\remove-non-dir-paths.bat %TEMP_STARTUP_TEMP%

for /F "tokens=*" %%a in (%TEMP_STARTUP_TEMP%) do (
    IF "%PAC_FIRST_RUN%"=="true" (
        echo Switching to: %%a
	    cd /d %%a
	)
)

@call %UTIL%\remove-temp-variables.bat