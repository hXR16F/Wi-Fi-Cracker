;Programmed by hXR16F
;hXR16F.ar@gmail.com

#NoTrayIcon
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

#Region ### START Koda GUI section ###
$Form1 = GUICreate("", 256, 336, 396, 116)
GUISetIcon("C:\Windows\System32\shell32.dll", -51)
GUISetBkColor(0xFFFFFF)

$Group1 = GUICtrlCreateGroup("Wi-Fi Cracker", 10, 8, 235, 291)
$Input1 = GUICtrlCreateInput("", 28, 50, 197, 21)
$Label1 = GUICtrlCreateLabel("SSID:", 22, 32, 32, 17)
$Label2 = GUICtrlCreateLabel("WORDLIST:", 22, 86, 65, 17)
$Input2 = GUICtrlCreateInput("Wi-Fi_Crack_Wordlist.txt", 28, 104, 197, 21)
$Label3 = GUICtrlCreateLabel("SPEED:", 22, 140, 43, 17)
$Combo1 = GUICtrlCreateCombo("", 28, 158, 197, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "ULTRA FAST|VERY FAST|FAST|NORMAL|SLOW|VERY SLOW", "NORMAL")
$Button1 = GUICtrlCreateButton("CRACK", 80, 252, 91, 25)
$Label4 = GUICtrlCreateLabel("AUTHENTICATION:", 22, 194, 102, 17)
$Input3 = GUICtrlCreateInput("WPA2PSK", 28, 212, 197, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_UPPERCASE))
GUICtrlCreateGroup("", -99, -99, 1, 1)

$StatusBar1 = _GUICtrlStatusBar_Create($Form1)
Dim $StatusBar1_PartsWidth[1] = [-1]
_GUICtrlStatusBar_SetParts($StatusBar1, $StatusBar1_PartsWidth)
_GUICtrlStatusBar_SetText($StatusBar1, @TAB & "hXR16F", 0)
_GUICtrlStatusBar_SetBkColor($StatusBar1, 0xFFFFFF)

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			FileDelete("Wi-Fi_Crack_Profile.xml")
			FileDelete("Wi-Fi_Crack_Ping_Terminate.ini")
			WinClose("Wi-Fi Cracker - Networks")
			Exit

		Case $Button1
			Local $SSIDData = GUICtrlRead($Input1)
			Local $WordlistData = GUICtrlRead($Input2)
			Local $Speed = GUICtrlRead($Combo1)
			Local $AuthData = GUICtrlRead($Input3)

			If $Speed = "ULTRA FAST" Then
				$SpeedData = 6
			ElseIf $Speed = "VERY FAST" Then
				$SpeedData = 5
			ElseIf $Speed = "FAST" Then
				$SpeedData = 4
			ElseIf $Speed = "NORMAL" Then
				$SpeedData = 3
			ElseIf $Speed = "SLOW" Then
				$SpeedData = 2
			ElseIf $Speed = "VERY SLOW" Then
				$SpeedData = 1
			EndIf

			FileWrite(@ScriptDir & "\input.ini", $SSIDData & @CRLF & $WordlistData & @CRLF & $SpeedData & @CRLF & $AuthData)
			ShellExecute(@ScriptDir & "\Wi-Fi_Crack.bat")

	EndSwitch
WEnd
