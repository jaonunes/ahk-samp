;https://github.com/SAMP-UDF/SAMP-UDF-for-AutoHotKey
SendMode Input
SetWorkingDir %A_ScriptDir%
#UseHook
#NoEnv
#SingleInstance force
#include %A_ScriptDir%\SAMPAHK\SAMP.ahk
#IfWinActive GTA:SA:MP
!0::	
	AddChatMessage("Digite o tipo do confronto")
	input, tipoConfronto, , {enter}
	StringUpper, tipoConfronto, tipoConfronto
	AddChatMessage("Digite 1º ID : ")
	Input ptorcidaid, , {enter}
	AddChatMessage("Digite 2º ID : ")
	Input storcidaid, , {enter}
	
	
	FileRead, CONTEUDO_DO_ARQUIVO, torcidas.txt
	StringSplit, LINHA_, CONTEUDO_DO_ARQUIVO, `n	
	
		1linhaEncontrada := LINHA_%ptorcidaid%
		2linhaEncontrada := LINHA_%storcidaid%
	StringSplit , 1siglaTO , 1linhaEncontrada, " "
	StringSplit , 2siglaTO , 2linhaEncontrada, " "

	StringUpper, torcida2, torcida2
	AddChatMessage("1- INICIO OU 2- FIM?")
	Input, idMomento,L1 , {enter}
	
	if(idMomento == 1){
		momento = INICIO
	}
	else{
		momento = FIM
	}
	Sleep 100
	SendChat("/ad [" tipoConfronto "] - " 1siglaTO2 " X " 2siglaTO2 " - " momento " - " A_YDay "/"A_MM)
return