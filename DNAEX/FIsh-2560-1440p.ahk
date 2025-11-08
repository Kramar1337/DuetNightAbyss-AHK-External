#NoEnv
SetWorkingDir %A_WorkingDir%
#SingleInstance force
DetectHiddenWindows On
Process, Priority,, High
SendMode Input
Setbatchlines,-1
SetKeyDelay,-1, -1
SetControlDelay, -1
SetMouseDelay, -1
SetWinDelay,-1
CoordMode, Mouse, Screen
CoordMode, ToolTip, Screen
CommandLine := DllCall("GetCommandLine", "Str")
If !(A_IsAdmin || RegExMatch(CommandLine, " /restart(?!\S)")) 
{
    Try 
	{
        If (A_IsCompiled) 
		{
            Run *RunAs "%A_ScriptFullPath%" /restart
        }
		Else 
		{
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
        }
    }
    ExitApp
}
key_Reload = Home
key_EndExitapp = End
Hotkey, *~$%key_Reload%, MetkaMenu4, on
Hotkey, *~$%key_EndExitapp%, MetkaMenu1, on

F4::
xS1:=round(A_ScreenWidth * (2070 / 2560))
yS1:=round(A_ScreenHeight * (1030 / 1440))
xS2:=round(A_ScreenWidth * (2290 / 2560))
yS2:=round(A_ScreenHeight * (1220 / 1440))
Prozra4nost = TransBlack
Tolerance = 100
Sleep 50
SendInput {Space}
Sleep 50
Toggle1Timer := !Toggle1Timer
if (Toggle1Timer)
SetTimer, TimerPlayer, on
Else
SetTimer, TimerPlayer, off
Tooltip
Return
TimerPlayer:
Tooltip Рыбалка, round(A_ScreenWidth * .5) - 50, 0
ImageSearch,,, xS1, yS1, xS2, yS2, *%Tolerance%, *%Prozra4nost% %A_ScriptDir%\data\pick\1.png
if (ErrorLevel = 0)
{
	Sleep 100
	SendInput {Space}
	Sleep 5000
	xSkip:=round(A_ScreenWidth * (1280 / 2560))
	ySkip:=round(A_ScreenHeight * (1095 / 1440))
	Click %xSkip% %ySkip%
	Sleep 2000
	xSkip:=round(A_ScreenWidth * (1280 / 2560))
	ySkip:=round(A_ScreenHeight * (1095 / 1440))
	Click %xSkip% %ySkip%
	Sleep 2000
	SendInput {Space}
	Sleep 1000
	SendInput {E}
	Sleep 1000
}
Return













MetkaMenu4:
Reload
Return

MetkaMenu1:
Exitapp
Return