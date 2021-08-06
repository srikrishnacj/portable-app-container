@Rem Remove the whites spaces and Comment lines from text file

SET SOURCE=%1
SET DESTINATION=%2

SET SANITIZE_TEMP_FILE=%TEMP_FOLDER%\temp-sanatize.txt
del %SANITIZE_TEMP_FILE% >nul 2>&1

for /f "usebackq tokens=* delims=" %%a in (%SOURCE%) do (
	echo %%a>>%SANITIZE_TEMP_FILE% 2>&1
)

rem SANITIZE_TEMP_FILE wont exist source file is empty
if exist %SANITIZE_TEMP_FILE% (
	for /f "eol=# delims=" %%a in (%SANITIZE_TEMP_FILE%) do (
		echo %%a>>%DESTINATION%
	)
)
