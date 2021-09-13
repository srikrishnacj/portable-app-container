@call %UTIL%\remove-temp-variables.bat
echo Setting Alias
SET TEMP_ALIAS_CONFIG=%CONFIG_FOLDER%\alias-task-config.txt
SET TEMP_ALIAS_TEMP=%PAC_TEMP%\alias-task-config.txt

if not exist %TEMP_ALIAS_CONFIG% (
	echo "Alias Config file not found at: "%TEMP_ALIAS_CONFIG%
	echo "Stopping Script Execution"
	EXIT /b
)

@call %UTIL%\copy-file.bat %TEMP_ALIAS_CONFIG% %TEMP_ALIAS_TEMP%
@call %UTIL%\remove-comments-from-file.bat %TEMP_ALIAS_TEMP%
@call %UTIL%\remove-white-spaces-in-file.bat %TEMP_ALIAS_TEMP%
@call %UTIL%\expand-variables.bat %TEMP_ALIAS_TEMP%

@doskey /macrofile=%TEMP_ALIAS_TEMP%

for /F "tokens=*" %%A in (%TEMP_ALIAS_TEMP%) do echo %TAB%%%A

echo.
@call %UTIL%\remove-temp-variables.bat