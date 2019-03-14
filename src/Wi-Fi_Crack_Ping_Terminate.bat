@echo off
title Wi-Fi Cracker Ping Terminate
set /P speed=<Wi-Fi_Crack_Ping_Terminate.ini
Wi-Fi_Crack_Wait.dll /w %speed%
taskkill /F /IM ping.exe > nul
exit