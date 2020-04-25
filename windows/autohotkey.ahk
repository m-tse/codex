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
