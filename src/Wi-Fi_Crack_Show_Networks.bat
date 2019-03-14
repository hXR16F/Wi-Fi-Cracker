@echo off
color 07& mode 50,60 & title Wi-Fi Cracker - Networks
Wi-Fi_Crack_Tool_Window.dll "Wi-Fi Cracker - Networks"
Wi-Fi_Crack_Move_Window.dll "Wi-Fi Cracker - Networks" 0 0
netsh wlan show networks
for /L %%n in (0,0,1) do pause > nul