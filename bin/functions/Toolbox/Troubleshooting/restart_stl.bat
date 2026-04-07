if not defined STL_LAUNCHER set "STL_LAUNCHER=Launcher.bat"
echo Restarting launcher...
timeout /t 3
cd /d %stl_root%
start %stl_root%%STL_LAUNCHER%
exit