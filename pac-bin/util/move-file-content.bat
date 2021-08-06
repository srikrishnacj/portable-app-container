SET SOURCE=%1
SET DESTINATION=%2

del %DESTINATION% >nul 2>&1
for /F "tokens=*" %%a in (%SOURCE%) do (
	echo %%a>>%DESTINATION%
)
del %SOURCE% >nul 2>&1