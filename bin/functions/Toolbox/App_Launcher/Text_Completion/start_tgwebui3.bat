@echo off

:start_tgwebui3
REM Check if text-generation-webui-3.13 directory exists
if not exist "%tgwebui3_install_path%" (
    echo %red_bg%[%time%]%reset% %red_fg_strong%[ERROR] text-generation-webui-3.13 directory not found in: %text_completion_dir%%reset%
    pause
    goto :app_launcher_text_completion
)

REM Read modules-tgwebui3 and find the tgwebui3_start_command line
set "tgwebui3_start_command="

for /F "tokens=*" %%a in ('findstr /I "tgwebui3_start_command=" "%tgwebui3_modules_path%"') do (
    set "%%a"
)

REM If no saved command, build a default one
if not defined tgwebui3_start_command (
    set "tgwebui3_start_command=start start_windows.bat"
)

set "tgwebui3_start_command=%tgwebui3_start_command:tgwebui3_start_command=%"

REM Start Text generation web UI 3.13 with desired configurations
echo %blue_bg%[%time%]%reset% %blue_fg_strong%[INFO]%reset% Text generation web UI 3.13 launched in a new window.
cd /d "%tgwebui3_install_path%" && %tgwebui3_start_command%
goto :home
