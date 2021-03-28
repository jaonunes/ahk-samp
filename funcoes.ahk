#include %A_ScriptDir%\SAMPAHK\SAMP.ahk


buscarFaixa(){
	FileRead, CONTEUDO_DO_ARQUIVO, chatlog.txt

	StringSplit, LINHA_, CONTEUDO_DO_ARQUIVO, `n

	Loop % LINHA_0
	{
		If (InStr(LINHA_%A_Index%, "] [FAIXA]:"))
		{
			ULTIMA_LINHA_FAIXA := LINHA_%A_index%
		}
	}
	TEXTO_DA_LINHA := ULTIMA_LINHA_FAIXA
    
    return %TEXTO_DA_LINHA%
}

buscarInformacaoSaidaFaixa(){
    TEXTO_DA_LINHA:= buscarFaixa()
    Length := StrLen(TEXTO_DA_LINHA)
    pesquisarVirgula:= ","
    VirgulaPos:= InStr(TEXTO_DA_LINHA, pesquisarVirgula)
    NickVida := SubStr(TEXTO_DA_LINHA, 1 , VirgulaPos-1)
    NickSemFaixa := StrReplace(NickVida, " [FAIXA]: ")
    formaSaida:=RegExMatch(TEXTO_DA_LINHA,"\((.*?)\)", formaSaida1) 
    SendInput t@- FAIXA: %NickSemFaixa% %formaSaida1%

}

setarPosicaoFaixa(){
    TEXTO_DA_LINHA:= buscarFaixa()
	TEXTO_COM_POSICAO_NOME := RegExMatch(TEXTO_DA_LINHA, "Posicao\s\[(.*?)\]", TEXTO_ENCONTRADO)

	StringSplit , ULTIMO_FAIXA , TEXTO_ENCONTRADO,  %A_Space%

	StringTrimLeft, ULTIMO_FAIXA2, ULTIMO_FAIXA2, 1
	StringTrimRight, ULTIMO_FAIXA4, ULTIMO_FAIXA4, 1


	SendInput t/setpos %ULTIMO_FAIXA2% %ULTIMO_FAIXA3% %ULTIMO_FAIXA4%{enter}

}

capturarMortesFaixa(){

    FileRead, CONTEUDO_DO_ARQUIVO, chatlog.txt

	StringSplit, LINHA_, CONTEUDO_DO_ARQUIVO, `n

	Loop % LINHA_0  {

		if(A_Index > posUltimaLida){
			If (InStr(LINHA_%A_Index%, "matou o faixa") or InStr(LINHA_%A_Index%, "[Responsaveis CAMP Informam]: "))
			{
				ULTIMA_LINHA_matou_FAIXA := LINHA_%A_index%				
				FileAppend ,%ULTIMA_LINHA_matou_FAIXA% `n , morte_faixas.txt
				posicaoNoChat = %A_index%
	
			}
		}
		
	}

	posUltimaLida:= posicaoNoChat
	SendInput t/pm [TUi]Jnf.1997[sGM] [Mod Campeonato] Informações Capturadas {enter}

	

}


ativarModCamp(){
	If ((GetKeyState("q") = 1)) ; Se o usuário pressionar 3 e 4, verificamos se as teclas 1 e 2 estão pressionadas e se estiverem, exibimos a msgbox.
	{
		ativaCamp:= !ativaCamp
		if(ativaCamp = 1){
			SendInput t/pm [TUi]Jnf.1997[sGM] [Mod Campeonato] Ativado {enter}
		}
		else{
			SendInput t/pm [TUi]Jnf.1997[sGM] [Mod Campeonato] Desativado {enter}
		}
		
		return %ativaCamp%
	}
	Else 
	{
		Return %ativaCamp%
	}


}

enviarAsay(){
	SendInput t FAIXA DA |  |  | %A_DD%.%A_MM%
}

/*

lerRpt()
{
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

FileRead, CONTEUDO_DO_ARQUIVO, D:\Meus Dados\Documents\GTA San Andreas User Files\SAMP/chatlog.txt
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
	olharState = 1
}

*/
Return