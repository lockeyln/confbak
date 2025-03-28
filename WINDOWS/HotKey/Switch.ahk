;管理员运行
if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%" 
   ExitApp
}
 
;无环境变量
#NoEnv

#NoEnv

SetCapsLockState, Alwaysoff
SetStoreCapsLockMode, Off

CapsLock::
KeyWait, CapsLock, T0.3
If ErrorLevel {
  Send, {CapsLock}
  KeyWait, CapsLock
} else {
  Send, {Ctrl down}{Space down}{Space up}{Ctrl up}
}
