ECHO Coping User Files

SET COPY_CONFIG=%CONFIG_FOLDER%\copy.txt
SET TEMP_COPY_CONFIG=%PAC_TEMP%\copy.txt
SET TEMP_COPY_CONFIG2=%PAC_TEMP%\copy2.txt

@call %UTIL%\clean-file.bat %TEMP_COPY_CONFIG%
@call %UTIL%\clean-file.bat %TEMP_COPY_CONFIG2%
@call %UTIL%\copy-file.bat %COPY_CONFIG% %TEMP_COPY_CONFIG%

if not exist %COPY_CONFIG% (
	echo "Copy Config file not found at: "%CONFIG_FILE%
	echo "Stopping Script Execution"
	exit /b
)

@call %UTIL%\remove-comments-from-file.bat %TEMP_COPY_CONFIG%
@call %UTIL%\remove-white-spaces-in-file.bat %TEMP_COPY_CONFIG%
@call %UTIL%\expand-variables.bat %TEMP_COPY_CONFIG%

for /f "delims== tokens=1,2" %%G in (%TEMP_COPY_CONFIG%) do (
	if not exist %%G (
@REM 	    ECHO %TAB%Skipping. It does not exists. %%G
	) else IF EXIST %%G\* (
@REM 		ECHO %TAB%Skipping. It is a directory. %%G
	) else (
		echo %%G=%%H>>%TEMP_COPY_CONFIG2%
	)
)

for /f "delims== tokens=1,2" %%G in (%TEMP_COPY_CONFIG2%) do (
	echo %TAB% copying file
	echo %TAB% %TAB% from: %%G
	echo %TAB% %TAB% to: %%H
	echo F|xcopy /S /Q /Y /F %%G %%H >nul 2>&1
)

ECHO.