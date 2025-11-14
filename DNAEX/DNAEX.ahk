/*
123
https://www.unknowncheats.me/forum/other-mmorpg-and-strategy/723122-duet-night-abyss-reversal-structs-offsets.html
constexpr int32 GObjects = 0x06AEED80;
constexpr int32 AppendString = 0x02608350;
constexpr int32 GNames = 0x06E2CF40;
constexpr int32 GWorld = 0x06FD7578;
constexpr int32 ProcessEvent = 0x02816480;
constexpr int32 ProcessEventIdx = 0x00000044;

PlayerSpeed:
Code:
[[[[[["EM-Win64-Shipping.exe"+offsets.GWorld]+190]+38]+0]+30]+2D0]+C8
GravityScale:
Code:
[[[[[[["EM-Win64-Shipping.exe"+offsets.GWorld]+190]+38]+0]+30]+2D0]+308]+150
WalkSpeed:
Code:
[[[[[["EM-Win64-Shipping.exe"+offsets.GWorld]+190]+38]+0]+30]+2D0]+DB0
CrouchSpeed:
Code:
[[[[[["EM-Win64-Shipping.exe"+offsets.GWorld]+190]+38]+0]+30]+2D0]+DB4
Value all in float type.

GOBjects: 48 8B 05 ?? ?? ?? ?? 48 8B 0C C8 4C 8D 04 D1 EB 03 4C 8B C6 41 8B 40 08 0F BA E0 1E 72 21 66 0F 1F 84 00 00 00 00 00
GNames: 48 8D 0D ?? ?? ?? ?? E8 ?? ?? ?? ?? 4C 8B C0 C6 05 ?? ?? ?? ?? ?? 48 8B 44 24 38 48 C1 E8 20 8D 0C 00 49 8B 44 F8 10 0F B7 14 08 48 83 C1 02 8B FA
GWorld: 48 8B 1D ?? ?? ?? ?? 48 85 DB 74 3B 41 B0 01 33 D2 48 8B CB


https://boarhat.gg/games/duet-night-abyss/tier-list/
*/
class offsets
{
static GWorld = 0x6FD7578
}

PlayerSpeed1 = 1
PlayerSpeed2 = 2
PlayerSpeed3 = 6

GravityScale1 = 2.8
GravityScale2 = 0.1

AutoExitAHK = 0
key_Reload = Home
key_EndExitapp = End
WindowFocus = ahk_class UnrealWindow
GameEXE:= "ahk_exe EM-Win64-Shipping.exe"

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force
DetectHiddenWindows, On
DetectHiddenText, On
CoordMode Mouse, Screen
CoordMode Pixel, Screen
SetTitleMatchMode, 2
Process, Priority,, High
Setbatchlines,-1
SetKeyDelay,-1, -1
SetControlDelay, -1
SetMouseDelay, -1
SetWinDelay,-1
Menu,Tray, Icon, data\icon.ico, ,1
#include %A_ScriptDir%\data\classMemory.ahk

CommandLine := DllCall("GetCommandLine", "Str")
If !(A_IsAdmin || RegExMatch(CommandLine, " /restart(?!\S)")) 
{
	Try 
	{
		If (A_IsCompiled) 
			Run *RunAs "%A_ScriptFullPath%" /restart
		Else 
			Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
	}
	ExitApp
}


AntiVACHashChanger:="fghfh3534gjdgdfgfj6867jhmbdsq4123asddfgdfgaszxxcasdf423dfght7657ghnbnghrtwer32esdfgr65475dgdgdf6867ghjkhji7456wsdfsf34sdfsdf324sdfgdfg453453453456345gdgdgdfsf"
Menu,Tray,NoStandard
Menu,Tray,DeleteAll
Menu,Tray, add, Reload, MetkaMenu4
Menu,Tray, Icon, Reload, shell32.dll, 239, 16
Menu,Tray, Default, Reload
Menu,Tray, add, Pause-Play, MetkaMenu3
Menu,Tray, Icon, Pause-Play, imageres.dll, 233, 16
Menu,Tray, add
Menu,Tray, add, Exit, MetkaMenu1
Menu,Tray, Icon, Exit, shell32.dll,28, 16

Hotkey, *~$%key_Reload%, MetkaMenu4, on
Hotkey, *~$%key_EndExitapp%, MetkaMenu1, on
if AutoExitAHK
	SetTimer, ExitOnGameClose, 3000
Return

/*
F5::
1337flex := new _ClassMemory(GameEXE)
baseAddress := 1337flex.getProcessBaseAddress(GameEXE)
LocalPlayer := 1337flex.getAddressFromOffsets(baseAddress + offsets.GWorld, 0x190, 0x38, 0x0, 0x30, 0x2D0, 0xC8)
GravityScale := 1337flex.getAddressFromOffsets(baseAddress + offsets.GWorld, 0x190, 0x38, 0x0, 0x30, 0x2D0, 0x308, 0x150)
GravityScale := 1337flex.getAddressFromOffsets(baseAddress + offsets.GWorld, 0x190, 0x38)
                    ; <Offset>150</Offset>
                    ; <Offset>308</Offset>
                    ; <Offset>320</Offset>
                    ; <Offset>30</Offset>
                    ; <Offset>0</Offset>
                    ; <Offset>38</Offset>
					
                        ; <Offset>8</Offset>
                        ; <Offset>690</Offset>
                        ; <Offset>A90</Offset>
                        ; <Offset>320</Offset>
                        ; <Offset>30</Offset>
                        ; <Offset>0</Offset>
                        ; <Offset>38</Offset>
; PlayerSpeed := 1337flex.Read(baseAddress + offsets.GWorld, "float", 0x190, 0x38, 0x0, 0x30, 0x320, 0xA90, 0x690, 0x690, 0x8)
; LocalPlayer := 1337flex.getAddressFromOffsets(baseAddress + offsets.GWorld)
msgbox % HexFormat(GravityScale)
; if PlayerSpeed > 0.1
1337flex := ""
Return
*/

F1::
1337flex := new _ClassMemory(GameEXE)
baseAddress := 1337flex.getProcessBaseAddress(GameEXE)
PlayerSpeed := 1337flex.Read(baseAddress + offsets.GWorld, "float", 0x190, 0x38, 0x0, 0x30, 0x2D0, 0xC8)
if PlayerSpeed > 0.1
1337flex.write(baseAddress + offsets.GWorld, PlayerSpeed1,"float", 0x190, 0x38, 0x0, 0x30, 0x2D0, 0xC8)
1337flex := ""
Tooltip Speed 1,round(A_ScreenWidth * .5),0
Sleep 300
Tooltip
Return

F2::
1337flex := new _ClassMemory(GameEXE)
baseAddress := 1337flex.getProcessBaseAddress(GameEXE)
PlayerSpeed := 1337flex.Read(baseAddress + offsets.GWorld, "float", 0x190, 0x38, 0x0, 0x30, 0x2D0, 0xC8)
if PlayerSpeed > 0.1
1337flex.write(baseAddress + offsets.GWorld, PlayerSpeed3,"float", 0x190, 0x38, 0x0, 0x30, 0x2D0, 0xC8)
1337flex := ""
Tooltip Speed 4,round(A_ScreenWidth * .5),0
Sleep 300
Tooltip
Return

;========================================Гравитация
XButton1::
Sleep 15
IfWinNotActive, %WindowFocus%
	Return
if !FuncCursorVisible()
{
1337flex := new _ClassMemory(GameEXE)
baseAddress := 1337flex.getProcessBaseAddress(GameEXE)
GravityScale := 1337flex.Read(baseAddress + offsets.GWorld, "float", 0x190, 0x38, 0x0, 0x30, 0x2D0, 0x308, 0x150)
if GravityScale > 0
1337flex.write(baseAddress + offsets.GWorld, GravityScale2,"float", 0x190, 0x38, 0x0, 0x30, 0x2D0, 0x308, 0x150)
1337flex := ""
while (GetKeyState("XButton1", "P"))
{
	sleep 50
}
1337flex := new _ClassMemory(GameEXE)
baseAddress := 1337flex.getProcessBaseAddress(GameEXE)
GravityScale := 1337flex.Read(baseAddress + offsets.GWorld, "float", 0x190, 0x38, 0x0, 0x30, 0x2D0, 0x308, 0x150)
if GravityScale > 0
1337flex.write(baseAddress + offsets.GWorld, GravityScale1,"float", 0x190, 0x38, 0x0, 0x30, 0x2D0, 0x308, 0x150)
1337flex := ""
}
Return

;========================================Ускорение + гравитация пеерключение
XButton2::
Sleep 15
IfWinNotActive, %WindowFocus%
	Return
Toggle1Timer := !Toggle1Timer
if (Toggle1Timer)
{
SetTimer, TimerPlayerSpeed, on
}
Else
{
SetTimer, TimerPlayerSpeed, off
1337flex := new _ClassMemory(GameEXE)
baseAddress := 1337flex.getProcessBaseAddress(GameEXE)
PlayerSpeed := 1337flex.Read(baseAddress + offsets.GWorld, "float", 0x190, 0x38, 0x0, 0x30, 0x2D0, 0xC8)
if PlayerSpeed > 0.1
	1337flex.write(baseAddress + offsets.GWorld, PlayerSpeed1,"float", 0x190, 0x38, 0x0, 0x30, 0x2D0, 0xC8)
GravityScale := 1337flex.Read(baseAddress + offsets.GWorld, "float", 0x190, 0x38, 0x0, 0x30, 0x2D0, 0x308, 0x150)
if GravityScale > 0
	1337flex.write(baseAddress + offsets.GWorld, GravityScale1,"float", 0x190, 0x38, 0x0, 0x30, 0x2D0, 0x308, 0x150)
1337flex := ""
}
Return
;========================================Таймер Ускорение + гравитация пеерключение
TimerPlayerSpeed:
Sleep 100
1337flex := new _ClassMemory(GameEXE)
baseAddress := 1337flex.getProcessBaseAddress(GameEXE)
PlayerSpeed := 1337flex.Read(baseAddress + offsets.GWorld, "float", 0x190, 0x38, 0x0, 0x30, 0x2D0, 0xC8)
if PlayerSpeed > 0.1
	1337flex.write(baseAddress + offsets.GWorld, PlayerSpeed3,"float", 0x190, 0x38, 0x0, 0x30, 0x2D0, 0xC8)
GravityScale := 1337flex.Read(baseAddress + offsets.GWorld, "float", 0x190, 0x38, 0x0, 0x30, 0x2D0, 0x308, 0x150)
if GravityScale > 0
	1337flex.write(baseAddress + offsets.GWorld, "0.6","float", 0x190, 0x38, 0x0, 0x30, 0x2D0, 0x308, 0x150)
1337flex := ""
Return



HexFormat(address) {
    hexAddress := Format("{:X}", address)
    Clipboard := hexAddress
    return hexAddress
}
;============================Функция: есть курсор мышки - 1, нет курсора - 0
FuncCursorVisible()
{
	StructSize1337 := A_PtrSize + 16
	VarSetCapacity(InfoStruct1337, StructSize1337)
	NumPut(StructSize1337, InfoStruct1337)
	DllCall("GetCursorInfo", UInt, &InfoStruct1337)
	Result1337 := NumGet(InfoStruct1337, 8)
	if (Result1337 <> 0)
		CursorVisible := 1
	Else
		CursorVisible := 0
	Return CursorVisible
}
;=====================================Если игра закрыта то скрипт сам закроется
ExitOnGameClose() {
    global WindowFocus
    if (!WinExist(WindowFocus)) {
		MsgBox,,, AutoClose, 1
        ExitApp
    }
}
;============================Меню, Reload
MetkaMenu4:
Reload
Return
;============================Меню, Отключить все хоткеи, остановить активные потоки
MetkaMenu3:
Suspend, Toggle
Toggle1Suspend := !Toggle1Suspend
if (Toggle1Suspend)
{
	Menu,Tray, Icon, imageres.dll, 230, 1
	Menu,Tray, Icon, Pause-Play, imageres.dll, 230, 16
	SoundBeep
}
Else
{
	Menu,Tray, Icon, imageres.dll, 233, 1
	Menu,Tray, Icon, Pause-Play, imageres.dll, 233, 16
	SoundBeep
}
Pause , Toggle, 1
Exit
Return
;============================Меню, выйти
MetkaMenu1:
Exitapp
Return