rem reads paths from path.txt and sets the path variables
rem https://stackoverflow.com/questions/18600317/batch-file-append-a-string-inside-a-for-loop/18600971

@call %UTIL%\remove-temp-variables.bat

ECHO Setting MANUAL PATH

SET PATH_CONFIG=%CONFIG_FOLDER%\path-config.txt
SET TEMP_PATH_CONFIG=%PAC_TEMP%\path-config.txt


if not exist %PATH_CONFIG% (
	echo "Path Config file not found at: "%TEMP_PATH_CONFIG%
	echo "Stopping Script Execution"
	exit /b
)

@call %UTIL%\clean-file.bat %TEMP_PATH_CONFIG%
@call %UTIL%\copy-file.bat %PATH_CONFIG% %TEMP_PATH_CONFIG%
@call %UTIL%\remove-comments-from-file.bat %TEMP_PATH_CONFIG%
@call %UTIL%\remove-white-spaces-in-file.bat %TEMP_PATH_CONFIG%
@call %UTIL%\expand-variables.bat %TEMP_PATH_CONFIG%
@call %UTIL%\remove-non-dir-paths.bat %TEMP_PATH_CONFIG%

SET T_PATH=
for /F "tokens=*" %%a in (%TEMP_PATH_CONFIG%) do (
	call set "T_PATH=%%T_PATH%%;%%a"
	echo %TAB%PATH+=%%a
)

set "PATH=%PATH%;%T_PATH%"

echo.