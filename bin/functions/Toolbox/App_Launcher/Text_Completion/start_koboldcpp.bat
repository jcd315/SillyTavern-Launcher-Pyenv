@echo off

:start_koboldcpp
REM Check if dev-koboldcpp directory exists
if not exist "%koboldcpp_install_path%" (
    echo %red_bg%[%time%]%reset% %red_fg_strong%[ERROR] dev-koboldcpp directory not found in: %text_completion_dir%%reset%
    pause
    goto :home
)

cd /d "%koboldcpp_install_path%"

REM Read saved flags from modules-koboldcpp
set "koboldcpp_flags="
for /F "tokens=*" %%a in ('findstr /I "koboldcpp_flags=" "%koboldcpp_modules_path%"') do (
    set "%%a"
)
set "koboldcpp_flags=%koboldcpp_flags:koboldcpp_flags=%"

REM Check if koboldcpp file exists [koboldcpp NVIDIA]
if exist "%koboldcpp_install_path%\koboldcpp.exe" (
    echo %blue_bg%[%time%]%reset% %blue_fg_strong%[INFO]%reset% koboldcpp launched in a new window.
    start "" "koboldcpp.exe" %koboldcpp_flags%
    goto :home
)

REM Check if koboldcpp file exists [koboldcpp AMD]
if exist "%koboldcpp_install_path%\koboldcpp_rocm.exe" (
    echo %blue_bg%[%time%]%reset% %blue_fg_strong%[INFO]%reset% koboldcpp launched in a new window.
    start "" "koboldcpp_rocm.exe" %koboldcpp_flags%
    goto :home
)

echo %red_bg%[%time%]%reset% %red_fg_strong%[ERROR] koboldcpp.exe or koboldcpp_rocm.exe not found in: %koboldcpp_install_path%%reset%
pause
goto :home
