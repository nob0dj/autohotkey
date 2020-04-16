#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;;;;;;;;;;;;;;;;;;;Exit Script;;;;;;;;;;;;;;;;;;
>+Esc::ExitApp


;;;;;;;;;;;;;;;;;;;;복사;;;;;;;;;;;;;;;;;;;;
;^>+c::Send, {Ctrl Down}{C}



;;;;;;;;;;;;;;;;;;;;기본방향키;;;;;;;;;;;;;;;;;;;;
>+[::
	Send, {Up}
return
>+/::
	Send, {Down}
return

>+;::
	Send, {Left}
return

>+'::
	Send, {Right}
return

;;;;;;;;;;;;;;;;;;;;Home, End;;;;;;;;;;;;;;;;;;;;
>+k::
	Send, {Home}
return

>+,::
	Send, {End}
return

;;;;;;;;;;;;;;;;;;;;Ctrl + Home | End;;;;;;;;;;;;;;;;;;;;
^>+k::
	Send, {Ctrl Down}{Home}
return

^>+,::
	Send, {Ctrl Down}{End}
return


;;;;;;;;;;;;;;;;;;;;PageUp, PageDown;;;;;;;;;;;;;;;;;;;;
>+l::
	Send, {pgup}
return

>+.::
	Send, {pgdn}
return

;;;;;;;;;;;;;;;;;;;;\ -> BackSapce(deep switch3);;;;;;;;;;;;;;;;;;;;
\::
	Send, {vk8}
Return

;;;;;;;;;;;;;;;;;;;;역슬래쉬 \;;;;;;;;;;;;;;;;;;;;
>+\::
	Send, {Text}\
return

;;;;;;;;;;;;;;;;;;;;수직바 |;;;;;;;;;;;;;;;;;;;;
<+\::
	Send, {Text}|
return

;;;;;;;;;;;;;;;;;;;;BackSpace -> Del;;;;;;;;;;;;;;;;;;;;
>+BS::
	Send, {Del}
return

<+>+BS::
	Send, {Shift Down}{Del}
Return

;;;;;;;;;;;;;;;;;;;;BackSpace -> `;;;;;;;;;;;;;;;;;;;;
;\를 입력했을때, BS를 실행에 이어 cascade로 실행됨.
;고로, `는 fn(RShift)+Esc로 구현함.
;$는 norecursive
$BS::
	Send, {Text}``
Return

;;;;;;;;;;;;;;;;;;;;Shift+BackSpace -> ~;;;;;;;;;;;;;;;;;;;;
<+BS::
	Send, {Text}~
Return

;;;;;;;;;;;;;;;;;;;;글자블럭잡기: shift+방향키조합;;;;;;;;;;;;;;;;;;;;
<+>+'::
	Send, {Shift down}{right}
return

<+>+;::
	Send, {Shift down}{left}
return

<+>+[::
	Send, {Shift down}{up}
return

<+>+/::
	Send, {Shift down}{down}
return

;;;;;;;;;;;;;;;;;;;;글자블럭잡기: shift+home/end+방향키조합;;;;;;;;;;;;;;;;;;;;
<+>+k:: Send, {Shift Down}{Home}
<+>+,:: Send, {Shift Down}{End}


;;;;;;;;;;;;;;;;;;;;글자단어단위이동: ctrl+방향키조합(위/아래방향키는 없음);;;;;;;;;;;;;;;;;;;;
<^>+'::
	Send, ^{right}
return

<^>+;::
	Send, ^{left}
return


;;;;;;;;;;;;;;;;;;;; Ctrl + ` ;;;;;;;;;;;;;;;;;;;;
;<^BS::
;	Send, {Ctrl Down}``
;return

;;;;;;;;;;;;;;;;;;;;' -> Esc;;;;;;;;;;;;;;;;;;;;
`::Send, {Esc}

;;;;;;;;;;;;;;;;;;;;RShift + ` -> `;;;;;;;;;;;;;;;;;;;;
>+`::Send, {Text}``

;;;;;;;;;;;;;;;;;;;;RShift+LShift+`;;;;;;;;;;;;;;;;;;;;
;BLUE SCREEN ERROR - Windows10 MANUALLY_INITIALTED_CRASH의 이유가 아닐까
;<+>+`::Send, ~ 

;;;;;;;;;;;;;;;;;;;;CapsLock Toggle;;;;;;;;;;;;;;;;;;;;
>+Tab::
	SetCapsLockState, % (State:=!State) ? "On" : "Off"
Return

;;;;;;;;;;;;;;;;;;;;Context Menu;;;;;;;;;;;;;;;;;;;;
;마우스우클릭{RButton}은 커서기준으로 메뉴생성. 다음은 현재 활성화된 app기준으로 메뉴생성
;>+f:: Send, {AppsKey}

;;;;;;;;;;;;;;;;;;;;글자블럭단어단위: ctrl+shift+방향키조합(위/아래방향키는 없음);;;;;;;;;;;;;;;;;;;;
<^<+>+'::
	Send, ^+{right}
return

<^<+>+;::
	Send, ^+{left}
return

;;;;;;;;;;;;;;;;;;;;페이지뒤로가기/앞으로가기: Alt+ <-, Alt+-> ;;;;;;;;;;;;;;;;;;;;
!>+;::
	send, !{left}
return

!>+'::
	send, !{right}
return

;;;;;;;;;;;;;;;;;;;;윈도우 화면배치관련 Win+방향키;;;;;;;;;;;;;;;;;;;;
#>+;::
	send, {LWin down}{left}
return

#>+'::
	send, {LWin down}{right}
return

#>+[::
	send, {LWin down}{up}
return

#>+/::
	send, {LWin down}{down}
return

;;;;;;;;;;;;;;;;;;;;윈도우 화면배치관련 Win+Shift+방향키;;;;;;;;;;;;;;;;;;;;
;LShitf, RShift를 동시에 보내야 정상작동함(?)
#<+>+;::
	send, {LWin Down}{LShift Down}{RShift Down}{Left}
return

#<+>+'::
	send, {LWin Down}{LShift Down}{RShift Down}{Right}
return

#<+>+[::
	send, {LWin Down}{LShift Down}{RShift Down}{Up}
return

#<+>+/::
	send, {LWin Down}{LShift Down}{RShift Down}{Down}
return

;;;;;;;;;;;;;;;;;;;;Function키 세팅;;;;;;;;;;;;;;;;;;;;
;>+1::Send,{F1}
;>+2::Send,{F2}
;>+3::Send,{F3}
;>+4::Send,{F4}
;>+5::Send,{F5}
;>+6::Send,{F6}
;>+7::Send,{F7}
;>+8::Send,{F8}
;>+9::Send,{F9}
;>+0::Send,{F10}
;>+-::Send,{F11}
;>+=::Send,{F12}

;;;;;;;;;;;;;;;;;;;;Function키 관련 기능키;;;;;;;;;;;;;;;;;;;;
;window종료
!>+4::Send,{Alt Down}{F4}
;context menu
<+>+0::Send,{LShift Down}{F10}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;이클립스;;;;;;;;;;;;;;;;;;;
;move line
!>+[::Send, {Alt Down}{Up}
!>+/::Send, {Alt Down}{Down}

;copy line
^!>+[::Send, {Ctrl Down}{Alt Down}{Up}
^!>+/::Send, {Ctrl Down}{Alt Down}{Down}

;탭이동(이클립스, 크롬)
^>+l::Send, {Ctrl Down}{PgUp}
^>+.::Send, {Ctrl Down}{PgDn}

;화면이동(커서고정)
^>+[::Send, {Ctrl Down}{Up}
^>+/::Send, {Ctrl Down}{Down}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;VSCode;;;;;;;;;;;;;;;;;;;
;multi-cursor
!<+>+[::Send, {Alt Down}{Shift Down}{Up}
!<+>+/::Send, {Alt Down}{Shift Down}{Down}







