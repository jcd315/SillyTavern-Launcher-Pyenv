@echo off

:install_nodejs
title STL [INSTALL NODEJS]
echo %blue_bg%[%time%]%reset% %blue_fg_strong%[INFO]%reset% Installing Node.js...
winget install -e --id OpenJS.NodeJS.LTS
echo %blue_bg%[%time%]%reset% %blue_fg_strong%[INFO]%reset% %green_fg_strong%Node.js is installed.%reset%

if not defined STL_LAUNCHER set "STL_LAUNCHER=Launcher.bat"
REM Prompt user to restart
echo Restarting launcher...
timeout /t 5
cd /d %stl_root%
start %stl_root%%STL_LAUNCHER%
exit