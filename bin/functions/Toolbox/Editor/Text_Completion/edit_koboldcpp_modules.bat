@echo off

REM ############################################################
REM ########## EDIT KOBOLDCPP MODULES - FRONTEND ###############
REM ############################################################
:edit_koboldcpp_modules
title STL [EDIT KOBOLDCPP MODULES]
cls
echo %blue_fg_strong%/ Home / Toolbox / Editor / Text Completion / Edit koboldcpp%reset%
echo -------------------------------------------------------------
echo Choose koboldcpp launch options to enable or disable
echo (e.g., "1 2" to skip launcher dialog and auto-launch browser)
echo.
echo Current port: %koboldcpp_port%
echo.



REM Display module options with colors based on their status
call :printModule "1. Skip launcher dialog (--skiplauncher)" %koboldcpp_skiplauncher_trigger%
call :printModule "2. Auto-launch browser (--launch)" %koboldcpp_launch_trigger%
call :printModule "3. Custom port - %koboldcpp_port% (--port %koboldcpp_port%)" %koboldcpp_port_trigger%
call :printModule "4. Listen on all interfaces (--host 0.0.0.0)" %koboldcpp_host_trigger%

echo 00. Quick Start koboldcpp
echo 0. Back

set /p koboldcpp_module_choices=Choose options to enable/disable:

REM Handle the user's choices
for %%i in (%koboldcpp_module_choices%) do (
    if "%%i"=="1" (
        if "%koboldcpp_skiplauncher_trigger%"=="true" (
            set "koboldcpp_skiplauncher_trigger=false"
        ) else (
            set "koboldcpp_skiplauncher_trigger=true"
        )

    ) else if "%%i"=="2" (
        if "%koboldcpp_launch_trigger%"=="true" (
            set "koboldcpp_launch_trigger=false"
        ) else (
            set "koboldcpp_launch_trigger=true"
        )

    ) else if "%%i"=="3" (
        if "%koboldcpp_port_trigger%"=="true" (
            set "koboldcpp_port_trigger=false"
        ) else (
            set "koboldcpp_port_trigger=true"
            set /p "koboldcpp_port=Enter port number (default 5001): "
            if "!koboldcpp_port!"=="" set "koboldcpp_port=5001"
        )

    ) else if "%%i"=="4" (
        if "%koboldcpp_host_trigger%"=="true" (
            set "koboldcpp_host_trigger=false"
        ) else (
            set "koboldcpp_host_trigger=true"
        )

    ) else if "%%i"=="00" (
        goto :start_koboldcpp

    ) else if "%%i"=="0" (
        goto :editor_text_completion
    )
)

REM Save the module flags to modules-koboldcpp
echo koboldcpp_skiplauncher_trigger=%koboldcpp_skiplauncher_trigger%>%koboldcpp_modules_path%
echo koboldcpp_launch_trigger=%koboldcpp_launch_trigger%>>%koboldcpp_modules_path%
echo koboldcpp_port_trigger=%koboldcpp_port_trigger%>>%koboldcpp_modules_path%
echo koboldcpp_port=%koboldcpp_port%>>%koboldcpp_modules_path%
echo koboldcpp_host_trigger=%koboldcpp_host_trigger%>>%koboldcpp_modules_path%

REM Compile the start command flags
set "koboldcpp_flags="
if "%koboldcpp_skiplauncher_trigger%"=="true" (
    set "koboldcpp_flags=%koboldcpp_flags% --skiplauncher"
)
if "%koboldcpp_launch_trigger%"=="true" (
    set "koboldcpp_flags=%koboldcpp_flags% --launch"
)
if "%koboldcpp_port_trigger%"=="true" (
    set "koboldcpp_flags=%koboldcpp_flags% --port %koboldcpp_port%"
)
if "%koboldcpp_host_trigger%"=="true" (
    set "koboldcpp_flags=%koboldcpp_flags% --host 0.0.0.0"
)

echo koboldcpp_flags=%koboldcpp_flags%>>%koboldcpp_modules_path%
goto :edit_koboldcpp_modules

REM Function to print module options with color based on their status
:printModule
if "%2"=="true" (
    echo %green_fg_strong%%1 [Enabled]%reset%
) else (
    echo %red_fg_strong%%1 [Disabled]%reset%
)
exit /b
