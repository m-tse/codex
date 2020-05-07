; Autohotkey script for my windows PC. Create this in the Documents folder, then copy the file,
; then "Paste Shortcut" into the the Startup Folder, which can be navigated to via "Windows + R",
; "shell:startup"
 
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
 
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
^b::Send {Left} ; move back
^+b::Send +{Left} ; highlight back
^e::Send {End} ; move to end of line
^+e::Send +{End} ; highlight to end of line
^d::Send {Del} ; delete character in front

^p::Send {Up} ; move up a line
^+p::Send +{Up} ; highlight up a line
; print that doesn't conflict
!p::
Hotkey, ^p, Off
Send ^p
HotKey, ^p, On
return

^n::Send {Down} ; move down a line
^+n::Send +{Down} ; highlight down a line
; new that doesn't conflict
!n::
Hotkey, ^n, Off
Send ^n
HotKey, ^n, On
return
; incognito new that doesn't conflict
!+n::
Hotkey, ^+n, Off
Send ^+n
Hotkey, ^+n, On
return

^f::Send {Right} ; forward character
^+f::Send +{Right} ; highlight forward
; find that doesn't conflict
!f::
Hotkey, ^f, Off
Send ^f
HotKey, ^f, On
return

^a::Send {Home} ; beginning of line
^+a::Send +{Home} ; highlight to beginning of line
; select all that doesn't conflict
!a::
Hotkey, ^a, Off
Send ^a
HotKey, ^a, On
return
 
#IfWinActive, ahk_class KiTTY
; Rebind alt-v to mouse middle click (paste) in kitty.
!v::
MouseClick, middle
Send, {DOWN}
Return
#IfWinActive
; Rebind paste for everyone else normally
!v::Send ^v
; Don't send ctrl C to KiTTY, it would kill the process
!c::Send ^c
