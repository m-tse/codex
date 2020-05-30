#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Set F11/F12 to decrease/increase volume.
F11::SoundSet,-5
F12::SoundSet,+5

; Function that determines if the mouse is over a specific window, which is different
; from whether a window is active or not. Useful for KiTTY.
MouseIsOver(WinTitle) {
  MouseGetPos,,, Win
  return WinExist(WinTitle . " ahk_id " . Win)
}

; shift click instead of normal click for better tmux highlighting while in scroll mode.
#If MouseIsOver("ahk_class KiTTY")
LButton::
   Sendinput, {Shift down}{LButton down}
   keywait, LButton
   Sendinput, {LButton up}{Shift up}
Return
#If

; Rebind the capslock key totally to control.
^capslock::capslock ; control capslock actually does capslock
capslock::ctrl

; Rebind paste to shift insert, which works for kitty and everywhere else.
^v::Send +{insert}

#IfWinActive, ahk_class KiTTY
; Kitty terminal accepts weird meta character keys
#b::Send !b ; back by wordS
#f::Send !f ; forward by word
#d::Send !d ; delete forward by word
#h::Send !{Backspace} ; delete backward by word
#Backspace::Send !{Backspace} ; delete backward by word

#IfWinNotActive, ahk_class KiTTY
; Emacs Style Navigation, don't apply them in KiTTY which already
; has these controls working.
; must have '<' to specifically apply these to the left ctrl
$<^b::Send {Left}
$<^+b::Send +{Left}
#b::Send ^{Left}
#+b::Send ^+{Left}
$<^f::Send {Right}
$<^+f::Send +{Right}
#f::Send ^{Right}
#+f::Send ^+{Right}
$<^a::Send {Home}
$<^+a::Send +{Home}
$<^e::Send {End}
$<^+e::Send +{End}
$<^n::Send {Down}
$<^+n::Send +{Down}
$<^p::Send {Up}
$<^+p::Send +{Up}
$<^d::Send {Del}
#d::Send ^{Del}
$<^h::Send {Backspace}
#h::Send ^{Backspace}
#Backspace::Send ^{Backspace}
$<^k::Send ^{Del}

#IfWinActive, ahk_exe slack.exe
^g::Send ^k ; Ctrl "Go" goes to any channel or PM
#IfWinActive
