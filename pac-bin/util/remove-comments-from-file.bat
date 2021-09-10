SET TEMP_RCFF_SOURCE=%1
SET TEMP_RCFF_DEST=%PAC_TEMP%\remove-comments.txt

findstr /r /v /c:"^#" %TEMP_RCFF_SOURCE% > %TEMP_RCFF_DEST%
@call %UTIL%\copy-file.bat %TEMP_RCFF_DEST% %TEMP_RCFF_SOURCE%

findstr /r /i /v /c:"^@rem" %TEMP_RCFF_SOURCE% > %TEMP_RCFF_DEST%
@call %UTIL%\copy-file.bat %TEMP_RCFF_DEST% %TEMP_RCFF_SOURCE%

findstr /r /i /v /c:"^rem" %TEMP_RCFF_SOURCE% > %TEMP_RCFF_DEST%
@call %UTIL%\copy-file.bat %TEMP_RCFF_DEST% %TEMP_RCFF_SOURCE%

