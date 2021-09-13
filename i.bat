@echo off
cls

@call %~dp0index.bat

@call %BIN_FOLDER%\alias-task.bat
@call %BIN_FOLDER%\path-task.bat
@call %BIN_FOLDER%\env-task.bat
@call %BIN_FOLDER%\copy-task.bat
@call %BIN_FOLDER%\startmenu-task.bat
@call %BIN_FOLDER%\startupdir-task.bat
call cls
@call %BIN_FOLDER%\banner-task.bat