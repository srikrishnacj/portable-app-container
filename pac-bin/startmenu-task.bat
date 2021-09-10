rem https://www.zdnet.com/article/windows-10-tip-add-custom-shortcuts-to-the-start-menu/
rem https://superuser.com/questions/392061/how-to-make-a-shortcut-from-cmd
rem https://stackoverflow.com/questions/15567809/batch-extract-path-and-filename-from-a-variable

@call %UTIL%\remove-temp-variables.bat

ECHO Adding StartMenu Entries

SET "START_MENU_FOLDER=%AppData%\Microsoft\Windows\Start Menu\Programs"

SET START_MENU_CONFIG=%CONFIG_FOLDER%\startmenu.txt
SET TEMP_START_MENU_CONFIG=%PAC_TEMP%\startmenu.txt

if not exist %START_MENU_CONFIG% (
	echo "StartMenu Config file not found at: "%CONFIG_FILE%
	echo "Stopping Script Execution"
	EXIT /b
)

@call %UTIL%\clean-file.bat %TEMP_START_MENU_CONFIG%
@call %UTIL%\copy-file.bat %START_MENU_CONFIG% %TEMP_START_MENU_CONFIG%
@call %UTIL%\remove-comments-from-file.bat %TEMP_START_MENU_CONFIG%
@call %UTIL%\remove-white-spaces-in-file.bat %TEMP_START_MENU_CONFIG%
@call %UTIL%\expand-variables.bat %TEMP_START_MENU_CONFIG%
@call %UTIL%\remove-non-files.bat %TEMP_START_MENU_CONFIG%

SETLOCAL ENABLEDELAYEDEXPANSION
for /F "tokens=*" %%a in (%TEMP_START_MENU_CONFIG%) do (
	SET NAME=%%~na
	set SHORTCUT="%START_MENU_FOLDER%\!NAME!.lnk"

	if exist !SHORTCUT! (
@REM 		echo %TAB%Skiping. Start menu entry already present. %%a
	) else (
		echo %TAB%Adding Start Menu Entry !SHORTCUT!
		@call %UTIL%\create-shortcut %%a !SHORTCUT!
	)
	
)
endlocal

ECHO.