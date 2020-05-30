#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Set F11/F12 to decrease/increase volume.
F11::SoundSet,-5
F12::SoundSet,+5

;Capslock::return
;$+Capslock::Capslock
;Capslock::return
*Capslock::Return
SetCapsLockState, alwaysoff

; Capslock special commands with VS Code.


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

#IfWinActive, ahk_class KiTTY
capslock & v::send +{insert}
capslock & c::return

; Kitty terminal accepts weird meta character keys
#b::Send !b ; back by word
#f::Send !f ; forward by word
#d::Send !d ; delete forward by word
#h::Send !{Backspace} ; delete backward by word
#Backspace::Send !{Backspace} ; delete backward by word

;;; Things to only apply outside the KiTTY terminal ;;;
#IfWinNotActive, ahk_class KiTTY

; Manually set capslock special commands.
capslock & a::send ^a
capslock & r::send ^r
capslock & w::send ^w
capslock & t::send ^t
capslock & l::send ^l
capslock & f::send ^f
capslock & n::send ^n
capslock & z::send ^z
capslock & x::send ^x
capslock & s::send ^s
capslock & k::send ^k
capslock & v::send ^v
capslock & c::send ^c
capslock & 1::send ^1
capslock & 2::send ^2
capslock & 3::send ^3
capslock & 4::send ^4
capslock & 5::send ^5


; Emacs style navigation/editing using control, also meta commands using windows.
; Kitty uses its own set of ctrl commands, so don't mess it up.
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
