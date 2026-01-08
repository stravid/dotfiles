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
; !Tab:: return

:?*:;a::ä
:?*:;o::ö
:?*:;u::ü
:?*:;s::ß
:?*:;A::Ä
:?*:;O::Ö
:?*:;U::Ü
:?*:;E::€
:?*:;1/2::½
:?*:;1/3::⅓
:?*:;1/4::¼
:?*:;1/5::⅕
:?*:;1/6::⅙
:?*:;1/7::⅐
:?*:;1/8::⅛
:?*:;1/9::⅑
:?*:;1/10::⅒
:?*:;2/3::⅔
:?*:;2/5::⅖
:?*:;3/4::¾
:?*:;3/5::⅗
:?*:;3/8::⅜
:?*:;4/5::⅘
:?*:;4/8::⅝
:?*:;5/6::⅚
:?*:;7/8::⅞
:?*:;"::„
:?*:`:"::“
:?*:;'::‚
:?*:`:'::‘
:?*:;date::
{
    Send FormatTime(, "yyyy-MM-dd")
}
:?*:;time::
{
    Send FormatTime(, "HH:mm")
}

#HotIf GetKeyState("CapsLock", "T")
j::Left
i::Up
k::Down
l::Right
#HotIf