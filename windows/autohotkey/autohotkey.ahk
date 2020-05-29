#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;; Things to apply everywhere ;;;

; Set F11/F12 to decrease/increase volume.
F11::SoundSet,-5
F12::SoundSet,+5

; Rebind CapsLock to ctrl to stop stressing my thumb
;+Capslock::Capslock ; Allow Shift + Capslock to actually do caps lock.
Capslock::Ctrl

MouseIsOver(WinTitle) {
  MouseGetPos,,, Win
  return WinExist(WinTitle . " ahk_id " . Win)
}

; shift click instead of normal click for better tmux highlighting while in scroll mode.
#If MouseIsOver("ahk_class KiTTY")
LButton::
 {
   Sendinput, {Shift down}{LButton down}
   keywait, LButton
   Sendinput, {LButton up}{Shift up}
 }
Return
#If

;;; Things to only apply in the KiTTY terminal ;;;
#IfWinActive, ahk_class KiTTY
!v::+Insert ; Paste in kitty.

; Kitty terminal accepts weird meta character keys
#b::Send !b ; back by word
#f::Send !f ; forward by word
#d::Send !d ; delete forward by word
#h::Send !{Backspace} ; delete backward by word
#Backspace::Send !{Backspace} ; delete backward by word


;;; Things to only apply outside the KiTTY terminal ;;;
; Kitty terminal works with emacs style navigation, but doesn't work with home/end
#IfWinNotActive, ahk_class KiTTY

; Emacs style navigation/editing using control
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
