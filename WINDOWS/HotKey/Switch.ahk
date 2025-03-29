;无环境变量
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
