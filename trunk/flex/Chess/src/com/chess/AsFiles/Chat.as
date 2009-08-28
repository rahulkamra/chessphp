// ActionScript file
import mx.core.Application;


public function sendChat():void{
	if(Application.application.currentState == 'lobby'){
		Chess.chessUIController.saveChat(Application.application.txiLobbyChat.text,0);
		Application.application.txiLobbyChat.text='';
	}else{
		//Chess.chessUIController.saveChat(Application.application.txaSend,null);
	}
}
