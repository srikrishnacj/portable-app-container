@call %UTIL%\remove-temp-variables.bat

SET TEMP_STARTUP_CONFIG=%CONFIG_FOLDER%\startupdir.txt
SET TEMP_STARTUP_TEMP=%PAC_TEMP%\startupdir.txt

@REM // TODO SKIP if config file not found

@call %UTIL%\copy-file.bat %TEMP_STARTUP_CONFIG% %TEMP_STARTUP_TEMP%
@call %UTIL%\remove-comments-from-file.bat %TEMP_STARTUP_TEMP%
@call %UTIL%\remove-white-spaces-in-file.bat %TEMP_STARTUP_TEMP%
@call %UTIL%\expand-variables.bat %TEMP_STARTUP_TEMP%
@call %UTIL%\remove-non-dir-paths.bat %TEMP_STARTUP_TEMP%

for /F "tokens=*" %%a in (%TEMP_STARTUP_TEMP%) do (
    echo Switching to: %%a
	cd /d %%a
)

@call %UTIL%\remove-temp-variables.bat