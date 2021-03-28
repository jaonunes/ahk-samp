#IfWinActive GTA:SA:MP
#Include, %A_ScriptDir%\funcoes.ahk

global ativaCamp := 0
global posUltimaLida:= 0
end::
	if(ativaCamp=1){
		buscarInformacaoSaidaFaixa()
	}
	

return

PgUp::
	if(ativaCamp=1){
		setarPosicaoFaixa()
	}

return

F3::
	if(ativaCamp=1){
		enviarAsay()
	}
	
Return

^F1::
	if(ativaCamp=1){
		capturarMortesFaixa()
	}


return


~W & E::
	ativarModCamp()
	Sleep, 900
	ativaCamp := ativarModCamp()
Return

