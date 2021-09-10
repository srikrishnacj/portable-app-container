@REM backups the path variable and calls path-auto.bat and path-conf.bat

if defined orig_path set path=%orig_path%
if not defined orig_path set orig_path=%path%

@call %BIN_FOLDER%\path-conf.bat
@call %BIN_FOLDER%\path-auto.bat