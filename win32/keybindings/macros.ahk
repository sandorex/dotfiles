#NoEnv
#Warn
#SingleInstance force
#NoTrayIcon
SendMode Input
SetWorkingDir %A_ScriptDir%

BEEP_PITCH := 500
BEEP_LENGTH := 200

; (https://www.nirsoft.net/utils/nircmd.html)
; should nircmd be used to force monitor to standby
NIRCMD_MONITOR_STANDBY = False

Beep(beeps := 1) {
   global

   Loop, %beeps% {
      SoundBeep, BEEP_PITCH, BEEP_LENGTH
   }
}

;; CAPSLOCK (F22)
F22 & H::Send, ^#{Left}    ; Virtual Desktop Left
F22 & J::Send, #{Tab}      ; Virtual Desktop Overview
F22 & K::AltTab            ; Window Switcher
F22 & L::Send, ^#{Right}   ; Virtual Desktop Right

;; APP (F23)
; reloads the ahk script
F23 & R::
   Beep()
   Reload
Return

; turns off the monitor (standby)
F23 & O::
   ; beep twice
   Beep(2)

   ; delay so monitor is not woken up before even going to sleep
   Sleep, 1100

   If (NIRCMD_MONITOR_STANDBY) {
      Run, nircmd.exe monitor off
   } Else {
      SendMessage,0x112,0xF170,2,,Program Manager
   }
Return
