@echo off

:install_yq
title STL [INSTALL-YQ]
echo %blue_bg%[%time%]%reset% %blue_fg_strong%[INFO]%reset% Installing yq...
winget install -e --id MikeFarah.yq
echo %blue_bg%[%time%]%reset% %blue_fg_strong%[INFO]%reset% %green_fg_strong%yq is installed.%reset%

if not defined STL_LAUNCHER set "STL_LAUNCHER=Launcher.bat"
REM Prompt user to restart
echo Restarting launcher...
timeout /t 5
cd /d %stl_root%
start %stl_root%%STL_LAUNCHER%
exit