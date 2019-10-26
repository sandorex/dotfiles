#NoEnv
#Warn
#SingleInstance force
#NoTrayIcon
SendMode Input
SetWorkingDir %A_ScriptDir%

; (https://www.nirsoft.net/utils/nircmd.html)
; should nircmd be used
USE_NIRCMD = False

; custom beep function
CustomBeep() {
   SoundBeep, 500, 200
}

;; CAPSLOCK (F22)
F22 & H::Send, ^#{Left}    ; Virtual Desktop Left
F22 & J::Send, #{Tab}      ; Virtual Desktop Overview
F22 & K::AltTab            ; Window Switcher
F22 & L::Send, ^#{Right}   ; Virtual Desktop Right

; turns off the monitor (standby)
F22 & O::
   CustomBeep()
   CustomBeep()
   Sleep, 1500 ; sleep so you dont wake up the monitor by moving the mouse

   If (USE_NIRCMD) {
      Run, nircmd.exe monitor off
   } Else {
      SendMessage,0x112,0xF170,2,,Program Manager
   }
Return

;; APP (F23)
; reloads the ahk script
F23 & R::
   CustomBeep()
   Reload
Return
