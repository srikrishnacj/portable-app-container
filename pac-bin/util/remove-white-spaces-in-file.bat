SET TEMP_RWSFF_SOURCE=%1
SET TEMP_RWSFF_DEST=%PAC_TEMP%\remove-white-spaces.txt

findstr /rc:"[^ <tab>]" %TEMP_RWSFF_SOURCE% >%TEMP_RWSFF_DEST%
@call %UTIL%\copy-file.bat %TEMP_RWSFF_DEST% %TEMP_RWSFF_SOURCE%

findstr /rc:"[^<space>]" %TEMP_RWSFF_SOURCE% > %TEMP_RWSFF_DEST%
@call %UTIL%\copy-file.bat %TEMP_RWSFF_DEST% %TEMP_RWSFF_SOURCE%