@echo off
title Loading
chcp 65001 >nul

:Loading
title Loading..
cls
echo.
echo  Made By/
echo   [Kxp3r]
echo.
set /p Username=Username: 
ping localhost -n 2 >nul
goto Main

:Main
cls
title Multitool - Kcp :)
echo.
echo        __  __     ______     ______  
echo       /\ \/ /    /\  ___\   /\  == \ 
echo       \ \  _"-.  \ \ \____  \ \  _-/ 
echo        \ \_\ \_\  \ \_____\  \ \_\   
echo         \/_/\/_/   \/_____/   \/_/  
echo.
echo           Welcome! %Username%
echo.
echo           [1] Ping a host
echo           [2] Traceroute a host
echo           [3] Check open ports
echo           [4] Exit
set /p choice=Choose an option: 

if "%choice%"=="1" goto Ping
if "%choice%"=="2" goto Traceroute
if "%choice%"=="3" goto PortScanner
if "%choice%"=="4" goto Exit

goto Main

:Ping
cls
set /p Host=Enter host or IP to ping: 
ping %Host%
pause
goto Main

:Traceroute
cls
set /p Host=Enter host or IP to traceroute: 
echo Tracerouting %Host%...
tracert %Host%
pause
goto Main

:PortScanner
cls
set /p Host=Enter host or IP to scan for open ports: 
echo Scanning %Host% for open ports...
for /L %%p in (1,1,1024) do (
    powershell -Command "if(Test-NetConnection -ComputerName %Host% -Port %%p){echo Port %%p is open} else {echo Port %%p is closed}"
)
pause
goto Main

:Exit
cls
echo Goodbye, %Username%!
ping localhost -n 2 >nul
exit
