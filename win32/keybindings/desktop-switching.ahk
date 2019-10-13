#NoEnv
#Warn
#SingleInstance force
#NoTrayIcon
SendMode Input
SetWorkingDir %A_ScriptDir%

; caps = F22
; app = F23

F22 & H::Send, ^#{Left}    ; Desktop Left
F22 & J::Send, #{Tab}      ; Desktop Overview
F22 & K::AltTab            ; Window Switcher
F22 & L::Send, ^#{Right}   ; Desktop Right

F23::Send, #{Tab}
