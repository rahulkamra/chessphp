package com.chess.controllers
{
	import com.chess.models.ChessProperties;
	import com.chess.models.ChessUIConstants;
	
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	public class ChessServiceController
	{
		public function ChessServiceController()
		{
			
		}
		
			
		public function myFaultHandler(event:FaultEvent):void{
			Alert.show(event.message.toString())
		}
		
		public function chkUsername(username:String):void{
			var authRo:RemoteObject=new RemoteObject;
			authRo.endpoint=ChessUIConstants.ROOT_URL;
			authRo.destination=ChessUIConstants.AUTHENTICATE_SERVICE;
			authRo.source=ChessUIConstants.AUTHENTICATE_SERVICE;
			authRo.addEventListener(FaultEvent.FAULT,myFaultHandler);
			authRo.addEventListener(ResultEvent.RESULT,chkUsernameResultHandler);
			authRo.chkUsername(username);
		}
		public function chkUsernameResultHandler(event:ResultEvent):void{
			var result:int=int(event.result)
			if(result != 0){
				//grant access
				Application.application.currentState='lobby'
				Application.application.userName=Application.application.txiUsername.text;//saving the username for future refrence
				Application.application.userId=result;
				
			}else{
				Application.application.lblUsernameError.text=ChessProperties.usernameExistError;
				//username exist choosse another one
				
			}
		}
		
		public function saveChat(chatText:String,toUser:int):void{
			var saveChatRO:RemoteObject=new RemoteObject;
			saveChatRO.endpoint=ChessUIConstants.ROOT_URL;
			saveChatRO.destination=ChessUIConstants.SAVE_CHAT_SERVICE;
			saveChatRO.source=ChessUIConstants.SAVE_CHAT_SERVICE;
			saveChatRO.addEventListener(FaultEvent.FAULT,myFaultHandler);
			saveChatRO.addEventListener(ResultEvent.RESULT,saveChatResultHandler);
			saveChatRO.saveChat(toUser,chatText);
		}
		public function saveChatResultHandler(event:ResultEvent):void{
			var parentRef:Chess=Application.application as Chess
			var chatText:String=event.result.message;
			chatText=parentRef.userName + " : " + chatText;
			if(Application.application.currentState == 'lobby'){
				parentRef.txaLobbyShow.text=parentRef.txaLobbyShow.text+chatText+'\n'
				
			}
		}

	}
}