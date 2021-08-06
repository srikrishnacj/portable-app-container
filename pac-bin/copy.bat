ECHO Coping User Files

SET CONFIG_FILE=%CONFIG_FOLDER%\copy.txt
SET COPY_TEMP_FILE=%TEMP_FOLDER%\temp-copy.txt
SET COPY_TEMP_FILE_2=%TEMP_FOLDER%\temp-copy-2.txt

del %COPY_TEMP_FILE% >nul 2>&1
del %COPY_TEMP_FILE_2% >nul 2>&1

if not exist %CONFIG_FILE% (
	echo "Copy Config file not found at: "%CONFIG_FILE%
	echo "Stopping Script Execution"
	exit /b
)

@call %UTIL%\sanitize.bat %CONFIG_FILE% %COPY_TEMP_FILE%

if not exist %COPY_TEMP_FILE% (
	echo %TAB%no paths to add
	goto end
)

@call %UTIL%\expand-variables.bat %COPY_TEMP_FILE%


for /f "delims== tokens=1,2" %%G in (%COPY_TEMP_FILE%) do (
	if not exist %%G (
	    ECHO %TAB%Skipping. It does not exists. %%G
	) else IF EXIST %%G\* (
		ECHO %TAB%Skipping. It is a directory. %%G
	) else (
		echo %%G=%%H>>%COPY_TEMP_FILE_2%
	)
)

if not exist %COPY_TEMP_FILE_2% (
	echo %TAB%no valid files to copy
	goto end
)

for /f "delims== tokens=1,2" %%G in (%COPY_TEMP_FILE_2%) do (
	echo %TAB% copying file from %%G to %%H
	echo F|xcopy /S /Q /Y /F %%G %%H >nul 2>&1
)

:end
ECHO.