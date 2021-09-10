SET TEMP_COPY_SOURCE=%1
SET TEMP_COPY_DESTINATION=%2

@REM echo before copy
@REM echo source: %TEMP_COPY_SOURCE%
@REM echo destination: %TEMP_COPY_DESTINATION%
copy %TEMP_COPY_SOURCE% %TEMP_COPY_DESTINATION% >nul 2>&1
@REM echo after copy
@REM echo source: %TEMP_COPY_SOURCE%
@REM echo destination: %TEMP_COPY_DESTINATION%
