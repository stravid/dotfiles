#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance Force
#Requires AutoHotkey >=2.0
;SetWorkingDir(A_ScriptDir)
SetWorkingDir A_InitialWorkingDir
SetKeyDelay 40
SetMouseDelay 40
SetTitleMatchMode "RegEx"

#Include WindowSwitching.ahk

; Disable Alt-Tabbing so I learn to use the hotkeys for certain applications
!Tab:: return