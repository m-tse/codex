#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

capslock::ctrl

#IfWinNotActive, ahk_exe WindowsTerminal.exe
$^b::Send {Left}
$^+b::Send +{Left}
#b::Send ^{Left}
#+b::Send ^+{Left}
$^f::Send {Right}
$^+f::Send +{Right}
#f::Send ^{Right}
#+f::Send ^+{Right}
$^a::Send {Home}
$^+a::Send +{Home}
$^e::Send {End}
$^+e::Send +{End}
$^n::Send {Down}
$^+n::Send +{Down}
$^p::Send {Up}
$^+p::Send +{Up}
$^d::Send {Del}
#d::Send ^{Del}
$^h::Send {Backspace}
#h::Send ^{Backspace}
#Backspace::Send ^{Backspace}
$^k::Send ^{Del}

; Function that determines if the mouse is over a specific window, which is different
; from whether a window is active or not.
MouseIsOver(WinTitle) {
  MouseGetPos,,, Win
  return WinExist(WinTitle . " ahk_id " . Win)
}

; shift click instead of normal click for better tmux highlighting while in scroll mode.
#If MouseIsOver("ahk_exe WindowsTerminal.exe")
LButton::
 {
   Sendinput, {Shift down}{LButton down}
   keywait, LButton
   Sendinput, {LButton up}{Shift up}
 }
Return
#If
