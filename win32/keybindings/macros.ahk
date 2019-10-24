#NoEnv
#Warn
#SingleInstance force
#NoTrayIcon
SendMode Input
SetWorkingDir %A_ScriptDir%

;; CAPS (F22)
F22 & H::Send, ^#{Left}    ; Virtual Desktop Left
F22 & J::Send, #{Tab}      ; Virtual Desktop Overview
F22 & K::AltTab            ; Window Switcher
F22 & L::Send, ^#{Right}   ; Virtual Desktop Right

; (https://www.nirsoft.net/utils/nircmd.html)
; requires nircmd to be installed
; turns off the monitor (standby)
F22 & O::Run, nircmd.exe monitor off

;; APP (F23)
F23::Send, #{Tab}
