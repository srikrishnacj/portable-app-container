@Rem Filters only files that are exists

SET SOURCE=%1
SET DESTINATION=%TEMP_FOLDER%\temp-file-filter.txt

del %DESTINATION% >nul 2>&1

for /F "tokens=*" %%a in (%SOURCE%) do (
	if not exist %%a (
	    ECHO %TAB%Skipping. It does not exists. %%a
	) else IF EXIST %%a\* (
		ECHO %TAB%Skipping. It's a directory. %%a
	) else (
		echo %%a>>%DESTINATION%
	)
)

del %SOURCE% >nul 2>&1
for /F "tokens=*" %%a in (%DESTINATION%) do (
	echo %%a>>%SOURCE%
)