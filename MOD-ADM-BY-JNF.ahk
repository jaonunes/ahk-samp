;https://github.com/SAMP-UDF/SAMP-UDF-for-AutoHotKey
SendMode Input
SetWorkingDir %A_ScriptDir%
#UseHook
#NoEnv
#SingleInstance force
;#include %A_ScriptDir%\funcoes.ahk
#include %A_ScriptDir%\SAMPAHK\SAMP.ahk
#IfWinActive GTA:SA:MP

global idDigitado:= "9999"
global olharState:= 0

MsgBox, %A_ScriptDir%

NumpadAdd::
if (isInChat()){
	Clipboard := ""
	SendInput ^a
	SendInput ^x
	Sleep 100
	idDigitado:= Clipboard
	SendChat("/olhar "idDigitado)
	SendInput {esc}
}
else{
	FileRead, CONTEUDO_DO_ARQUIVO, %A_ScriptDir%\chatlog.txt

	StringSplit, LINHA_, CONTEUDO_DO_ARQUIVO, `n
Loop % LINHA_0
{
	If (InStr(LINHA_%A_Index%, "[ReportSystem]:"))
	{
		ULTIMA_LINHA_REPORT := LINHA_%A_index%
	}
}

TEXTO_DA_LINHA := ULTIMA_LINHA_REPORT
PRIMEIRA_OCORRENCIA := RegExMatch(TEXTO_DA_LINHA, "id:\s\d{1,3}", TEXTO_ENCONTRADO)
TOTAL_A_REMOVER := PRIMEIRA_OCORRENCIA + StrLen(TEXTO_ENCONTRADO) ; POSICAO DA PRIMEIRA OCORRENCIA + TOTAL DE CARACTERES DA PRIMEIRA OCORRENCIA
StringTrimLeft, TEXTO_SEM_A_PRIMEIRA_OCORRENCIA, TEXTO_DA_LINHA, %TOTAL_A_REMOVER%
SEGUNDA_OCORRENCIA := RegExMatch(TEXTO_SEM_A_PRIMEIRA_OCORRENCIA, "\s\d{1,3}", TEXTO_ENCONTRADO_2)

idDigitado:=TEXTO_ENCONTRADO_2
	SendChat("/olhar "idDigitado)

}
return

x::
if !(isInChat()){
SendChat("/pinfo " idDigitado)

}
else{
			Caps := GetKeyState("Capslock", "T")
			if (Caps = 1)
			{
				SendInput X
			}
			else{
				SendInput x
			}
		}
return


NumpadDiv::
if !(isInChat()){
	
	SendChat("/ad Sem ant "GetPlayerNameById(idDigitado))
}
return
NumpadMult::
if !(isInChat()){
	SendChat("/ad Sem DB "GetPlayerNameById(idDigitado))
}

return
F2::
if !(isInChat()){
SendChat("/olhar off")
idDigitado := "9999"
}
return