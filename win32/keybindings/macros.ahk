;; (https://github.com/sandorex/dotfiles)
;;
;; Copyright 2019-2020 Aleksandar Radivojevic
;;
;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;; 	 http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.
;;
;;
;; (https://github.com/randyrants/sharpkeys)
;; keys remapped using SharpKeys
;;
;; F22 = CAPSLOCK
;; F23 = APP

#NoEnv
#Warn
#SingleInstance force
#NoTrayIcon
SendMode Input
SetWorkingDir %A_ScriptDir%

BEEP_PITCH := 500
BEEP_LENGTH := 200

; index of audio output to use
AUDIO_OUTPUT_INDEX := 1

; name of audio output
; (used for matching windows)
AUDIO_OUTPUT_NAME := "DELL U2414H"

; how much to increment/decrement volume per keypress
VOLUME_STEP := 2

TIMEOUT := 2

Beep(beeps := 1) {
   global

   Loop, %beeps% {
      SoundBeep, BEEP_PITCH, BEEP_LENGTH
   }
}

;; F22
F22 & H::Send, ^#{Left}    ; Virtual Desktop Left
F22 & J::Send, #{Tab}      ; Virtual Desktop Overview
F22 & K::AltTab            ; Window Switcher
F22 & L::Send, ^#{Right}   ; Virtual Desktop Right

; volume up/down
F22 & Up::SoundSet, +VOLUME_STEP
F22 & Down::SoundSet, -VOLUME_STEP

;; F23
; reloads the ahk script
F23 & R::
   Beep()
   Reload
Return

; toggles loudness euqualization
F23 & L::
   ; open 'Control Panel > Sound' if it is not already open
   If (!WinActive("Sound")) {
      Run, mmsys.cpl

      If (ErrorLevel) {
         MsgBox, "Error showing Sound window"
         Return
      }
   }

   ; match 'Sound' window title
   WinWait, Sound,, %TIMEOUT%

   If (ErrorLevel) {
      MsgBox, "Timeout has expired, sound window was not found"
      Return
   }

   ; select audio output by pressing arrow down AUDIO_OUTPUT_INDEX times
   ControlSend, SysListView321, {Down %AUDIO_OUTPUT_INDEX%}

   ; open properties by pressing the 'Properties' button
   ControlClick, &Properties

   ; wait for window with name '%AUDIO_OUTPUT_NAME% Properties'
   WinWait, %AUDIO_OUTPUT_NAME% Properties,, %TIMEOUT%

   If (ErrorLevel) {
      MsgBox, "Timeout has expired, properties window was not found"
      Return
   }

   ; select 'Enhancements' tab by pressing up
   ControlSend, SysTabControl321, {Up 1}

   ; select 'Loudness Euqualization' by pressing down 3 times
   ControlSend, SysListView321, {Down 3}

   ; toggle by pressing space
   ControlSend, SysListView321, {Space}

   ; confirm with button 'OK' to close it
   ControlClick, OK

   ; find the previous window 'Sound'
   WinWait, Sound,, %TIMEOUT%

   If (ErrorLevel) {
      MsgBox, "Timeout has expired, sound window was not found"
      Return
   }

   ; confirm with button 'OK' to close it
   ControlClick, OK

   ; beep to confirm it was toggled
   Beep()
Return

F23 & S::
; Ok/Cancel dialog that has timeout of 4 seconds
MsgBox, % 0x1 + 0x30, Macros Sleep Inducing Window, The computer will be put to sleep in few seconds, 4

; canceel is pressed
IfMsgBox, Cancel
   Return

; tiny delay when confirming with the mouse
IfMsgBox, Ok
   Sleep, 600

; go to sleep (disables wake timers)
DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 1)
Return

; turns off the monitor (standby)
F23 & O::
   ; Ok/Cancel dialog that has timeout of 2 seconds
   MsgBox, % 0x1 + 0x30, Macros Standby Inducing Window, The monitor will be put to standby in few seconds, 2

   ; canceel is pressed
   IfMsgBox, Cancel
      Return

   ; tiny delay when confirming with the mouse
   IfMsgBox, Ok
      Sleep, 600

   Beep()

   SendMessage, 0x112, 0xF170, 2,, Program Manager
Return
