@echo off

REM ############################################################
REM ######### EDIT TGWEBUI3 MODULES - FRONTEND #################
REM ############################################################
:edit_tgwebui3_modules
title STL [EDIT TGWEBUI3 MODULES]
cls
echo %blue_fg_strong%/ Home / Toolbox / Editor / Text Completion / Edit Text generation web UI 3.13%reset%
echo -------------------------------------------------------------
echo Choose Text generation web UI 3.13 options to enable or disable
echo (e.g., "1 2" to enable OpenAI extension and listen)



REM Display module options with colors based on their status
call :printModule "1. extensions openai (--extensions openai)" %tgwebui3_extopenai_trigger%
call :printModule "2. listen (--listen)" %tgwebui3_listen_trigger%
call :printModule "3. listen-port 7860 (--listen-port 7860)" %tgwebui3_listenport_trigger%
call :printModule "4. api-port 5000 (--api-port 5000)" %tgwebui3_apiport_trigger%
call :printModule "5. autolaunch (--auto-launch)" %tgwebui3_autolaunch_trigger%
call :printModule "6. verbose (--verbose)" %tgwebui3_verbose_trigger%

echo 00. Quick Start Text generation web UI 3.13
echo 0. Back

set /p tgwebui3_module_choices=Choose options to enable/disable:

REM Handle the user's module choices
for %%i in (%tgwebui3_module_choices%) do (
    if "%%i"=="1" (
        if "%tgwebui3_extopenai_trigger%"=="true" (
            set "tgwebui3_extopenai_trigger=false"
        ) else (
            set "tgwebui3_extopenai_trigger=true"
        )

    ) else if "%%i"=="2" (
        if "%tgwebui3_listen_trigger%"=="true" (
            set "tgwebui3_listen_trigger=false"
        ) else (
            set "tgwebui3_listen_trigger=true"
        )

    ) else if "%%i"=="3" (
        if "%tgwebui3_listenport_trigger%"=="true" (
            set "tgwebui3_listenport_trigger=false"
        ) else (
            set "tgwebui3_listenport_trigger=true"
        )

    ) else if "%%i"=="4" (
        if "%tgwebui3_apiport_trigger%"=="true" (
            set "tgwebui3_apiport_trigger=false"
        ) else (
            set "tgwebui3_apiport_trigger=true"
        )

    ) else if "%%i"=="5" (
        if "%tgwebui3_autolaunch_trigger%"=="true" (
            set "tgwebui3_autolaunch_trigger=false"
        ) else (
            set "tgwebui3_autolaunch_trigger=true"
        )

    ) else if "%%i"=="6" (
        if "%tgwebui3_verbose_trigger%"=="true" (
            set "tgwebui3_verbose_trigger=false"
        ) else (
            set "tgwebui3_verbose_trigger=true"
        )

    ) else if "%%i"=="00" (
        goto :start_tgwebui3

    ) else if "%%i"=="0" (
        goto :editor_text_completion
    )
)

REM Save the module flags to modules-tgwebui3
echo tgwebui3_extopenai_trigger=%tgwebui3_extopenai_trigger%>%tgwebui3_modules_path%
echo tgwebui3_listen_trigger=%tgwebui3_listen_trigger%>>%tgwebui3_modules_path%
echo tgwebui3_listenport_trigger=%tgwebui3_listenport_trigger%>>%tgwebui3_modules_path%
echo tgwebui3_apiport_trigger=%tgwebui3_apiport_trigger%>>%tgwebui3_modules_path%
echo tgwebui3_autolaunch_trigger=%tgwebui3_autolaunch_trigger%>>%tgwebui3_modules_path%
echo tgwebui3_verbose_trigger=%tgwebui3_verbose_trigger%>>%tgwebui3_modules_path%

REM Compile the start command
set "start_command=start start_windows.bat"
if "%tgwebui3_extopenai_trigger%"=="true" (
    set "start_command=%start_command% --extensions openai"
)
if "%tgwebui3_listen_trigger%"=="true" (
    set "start_command=%start_command% --listen"
)
if "%tgwebui3_listenport_trigger%"=="true" (
    set "start_command=%start_command% --listen-port 7860"
)
if "%tgwebui3_apiport_trigger%"=="true" (
    set "start_command=%start_command% --api-port 5000"
)
if "%tgwebui3_autolaunch_trigger%"=="true" (
    set "start_command=%start_command% --auto-launch"
)
if "%tgwebui3_verbose_trigger%"=="true" (
    set "start_command=%start_command% --verbose"
)

REM Save the constructed start command to modules-tgwebui3
echo tgwebui3_start_command=%start_command%>>%tgwebui3_modules_path%
goto :edit_tgwebui3_modules

REM Function to print module options with color based on their status
:printModule
if "%2"=="true" (
    echo %green_fg_strong%%1 [Enabled]%reset%
) else (
    echo %red_fg_strong%%1 [Disabled]%reset%
)
exit /b
