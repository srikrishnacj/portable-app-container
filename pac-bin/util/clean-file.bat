@REM delete and recreate file

SET TEMP_CLEAN_SOURCE=%1

del %TEMP_CLEAN_SOURCE% >nul 2>&1
type nul > %TEMP_CLEAN_SOURCE%