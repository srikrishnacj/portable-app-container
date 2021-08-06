rem https://www.zdnet.com/article/windows-10-tip-add-custom-shortcuts-to-the-start-menu/
rem https://superuser.com/questions/392061/how-to-make-a-shortcut-from-cmd
rem https://stackoverflow.com/questions/15567809/batch-extract-path-and-filename-from-a-variable

ECHO Adding StartMenu Entries
ECHO Warning! for each shortcut creation you may prompted for permission. 
ECHO Once shortcut created you wont be asked again for the same

SET "START_MENU_FOLDER=%AppData%\Microsoft\Windows\Start Menu\Programs"
SET CONFIG_FILE=%CONFIG_FOLDER%\startmenu.txt
SET SM_TEMP_FILE=%TEMP_FOLDER%\temp-startmenu.txt
SET SM_TEMP_FILE_2=%TEMP_FOLDER%\temp-startmenu-2.txt
del %SM_TEMP_FILE% >nul 2>&1
del %SM_TEMP_FILE_2% >nul 2>&1

if not exist %CONFIG_FILE% (
	echo "StartMenu Config file not found at: "%CONFIG_FILE%
	echo "Stopping Script Execution"
	EXIT /b
)

@call %UTIL%\sanitize.bat %CONFIG_FILE% %SM_TEMP_FILE%

if not exist %SM_TEMP_FILE% (
	echo %TAB%no start menu entires to create
	goto end
)

@call %UTIL%\expand-variables.bat %SM_TEMP_FILE%

@call %UTIL%\filter-files-exist.bat %SM_TEMP_FILE%

if not exist %SM_TEMP_FILE% (
	echo %TAB%no valid start menu entires to create
	goto end
)

SETLOCAL ENABLEDELAYEDEXPANSION
for /F "tokens=*" %%a in (%SM_TEMP_FILE%) do (
	SET NAME=%%~na
	set SHORTCUT="%START_MENU_FOLDER%\!NAME!.lnk"

	if exist !SHORTCUT! (
		echo %TAB%Skiping. Start menu entry already present. %%a
	) else (
		echo %TAB%Adding Start Menu Entry !SHORTCUT!
		@call %UTIL%\create-shortcut %%a !SHORTCUT!
	)
	
)
endlocal

:end

SET START_MENU_FOLDER=
SET CONFIG_FILE=
SET PATH_TEMP_FILE_2=
set SM_TEMP_FILE=
SET SM_TEMP_FILE_2=

ECHO.