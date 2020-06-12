#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;; Things to apply everywhere ;;;

Capslock::Esc
^Capslock::Capslock

; Set F11/F12 to decrease/increase volume.
F11::SoundSet,-5
F12::SoundSet,+5

!l::Send ^l ; Address bar in chrome
!x::Send ^x ; cut
!s::Send ^s ; save
!w::Send ^w ; close tab
!t::Send ^t ; new tab
!r::Send ^r ; refresh
!z::Send ^z ; undo
; Tab navigation
!1::Send ^1
!2::Send ^2
!3::Send ^3
!4::Send ^4
!5::Send ^5
!6::Send ^6
!7::Send ^7
!8::Send ^8
!9::Send ^9
!0::Send ^0

; Quick way to shrug
::;shrug::¯\_(ツ)_/¯ 

; Function that determines if the mouse is over a specific window, which is different
; from whether a window is active or not.
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
!c::^Insert ; Copy in kitty.

; Kitty terminal accepts weird meta character keys
#b::Send !b ; back by word
#f::Send !f ; forward by word
#d::Send !d ; delete forward by word
#h::Send !{Backspace} ; delete backward by word
#Backspace::Send !{Backspace} ; delete backward by word


;;; Things to only apply outside the KiTTY terminal ;;;
#IfWinNotActive, ahk_class KiTTY

^+e::Send +{End} ; highlight to end of line

; Rebind paste for everyone else normally
!v::Send ^v
; Don't send ctrl C to KiTTY, it would kill the process
!c::Send ^c

$^f::Send {Right} ; forward character
#f::Send ^{Right} ; forward by word
^+f::Send +{Right} ; highlight forward
#+f::Send ^+{Right} ; highlight forward by word
!f::Send ^f ;find

^b::Send {Left} ; move back
#b::Send ^{Left} ; back by word
^+b::Send +{Left} ; highlight back
#+b::Send ^+{Left} ; highlight back by word

^d::Send {Del} ; delete character in front
#d::Send ^{Del} ; delete word in front

^h::Send {Backspace} ; backspace from home row
#h::Send ^{Backspace} ; delete word in back
#Backspace::Send ^{Backspace} ; delete word in back

$^p::Send {Up} ; move up a line
^+p::Send +{Up} ; highlight up a line
!p::Send ^p ;print

$^n::Send {Down} ; move down a line
$^+n::Send +{Down} ; highlight down a line
!n::Send ^n ; new
!+n::Send ^+n ; incognito window

$^k::Send ^{Del} ; delete line


^+a::Send +{Home} ; highlight to beginning of line


#IfWinNotActive, ahk_exe Code.exe
$^a::Send {Home} ; beginning of line
^e::Send {End} ; move to end of line
!a::Send ^a ; select all
#IfWinActive

#IfWinActive, ahk_exe chrome.exe
!g::Send ^l ; "Go" opens the address bar, closer to left hand side
#IfWinActive
#IfWinActive, ahk_exe slack.exe
!k::Send ^k ; slack jump
!g::Send ^k ; "Go" goes to any channel or PM, G is closer to left side than k
#IfWinActive
