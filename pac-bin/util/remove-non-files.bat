@Rem Filters only files that are exists

SET TEMP_RNF_SOURCE=%1
SET TEMP_RNF_DEST=%PAC_TEMP%\remove-non-file.txt

@call %UTIL%\clean-file.bat %TEMP_RNF_DEST%

for /F "tokens=*" %%a in (%TEMP_RNF_SOURCE%) do (
	if not exist %%a (
@REM 	    ECHO %TAB%Skipping. It does not exists. %%a
	) else IF EXIST %%a\* (
@REM 		ECHO %TAB%Skipping. It's a directory. %%a
	) else (
		echo %%a>>%TEMP_RNF_DEST%
	)
)

@call %UTIL%\copy-file.bat %TEMP_RNF_DEST% %TEMP_RNF_SOURCE%

