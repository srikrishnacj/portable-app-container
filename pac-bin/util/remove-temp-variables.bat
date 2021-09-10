@REM echo Removing temp variables

for /f "delims== tokens=1,2" %%a in ('set ^| findstr /i / "^TEMP"') do (
@REM   echo Variable: %%a, Value: %%b
@REM   echo %%a
  set "%%a="
@REM   echo %%a
)