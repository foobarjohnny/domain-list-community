REM 本程序由 ChatGPT 生成

@ECHO OFF
REM fix_the_bug_of_attribute_cn.cmd
REM Replace all occurrences of "@cn" -> "@maybe_can_be_accessed_directly_inside_cn" in files of current directory (non-recursive)
REM Uses sed.exe. Creates .bak backups for modified files.

PUSHD .
CD /D "%~dp0"
CD ../data

SETLOCAL
SET "SCRIPTNAME=%~nx0"

ECHO Processing files in "%CD%" ...
REM ECHO (Backups will be created with .bak extension for modified files.)
ECHO.

REM Loop over all files in current directory
FOR %%F IN (*) DO (
    REM Skip directories and the script itself
    IF NOT "%%F"=="%SCRIPTNAME%" (
        IF EXIST "%%F" (
            REM Check if file contains @cn
            FINDSTR /C:"@cn" "%%F" >NUL
            IF NOT ERRORLEVEL 1 (
                ECHO Modifying: %%F
REM                COPY /Y "%%F" "%%F.bak" >NUL
                REM Replace in-place using sed
                sed -i "s/@cn/@maybe_can_be_accessed_directly_inside_cn/g" "%%F"
            )
        )
    )
)

ECHO.
ECHO Done.
ENDLOCAL
POPD
