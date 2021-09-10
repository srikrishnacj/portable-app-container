SET TEMP_RNDP_SOURCE=%1
SET TEMP_RNDP_DEST=%PAC_TEMP%\remove-non-dir-paths.txt

@call %UTIL%\clean-file.bat %TEMP_RNDP_DEST%

for /F "tokens=*" %%a in (%TEMP_RNDP_SOURCE%) do (
	IF exist %%a\nul ( echo %%a>>%TEMP_RNDP_DEST% )
)

@call %UTIL%\copy-file.bat %TEMP_RNDP_DEST% %TEMP_RNDP_SOURCE%