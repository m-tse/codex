#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;; Things to apply everywhere ;;;

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

;;; Things to only apply in the KiTTY terminal ;;;
#IfWinActive, ahk_class KiTTY
!v::+Insert ; Paste in kitty.
; shift click instead of normal click for better tmux highlighting while in scroll mode
LButton::
Send, {Shift down}
Mouseclick, left
Send {Shift up}
Return


;;; Things to only apply outside the KiTTY terminal ;;;
#IfWinNotActive, ahk_class KiTTY

^+e::Send +{End} ; highlight to end of line

; Rebind paste for everyone else normally
!v::Send ^v
; Don't send ctrl C to KiTTY, it would kill the process
!c::Send ^c

$^f::Send {Right} ; forward character
^+f::Send +{Right} ; highlight forward
!f::Send ^f ;find

^b::Send {Left} ; move back
^+b::Send +{Left} ; highlight back
^d::Send {Del} ; delete character in front

$^p::Send {Up} ; move up a line
^+p::Send +{Up} ; highlight up a line
!p::Send ^p ;print

$^n::Send {Down} ; move down a line
$^+n::Send +{Down} ; highlight down a line
!n::Send ^n ; new
!+n::Send ^+n ; incognito window

$^k::Send ^{Del} ; delete line
!k::Send ^k ; slack jump

$^a::Send {Home} ; beginning of line
^+a::Send +{Home} ; highlight to beginning of line
!a::Send ^a ; select all
^e::Send {End} ; move to end of line
