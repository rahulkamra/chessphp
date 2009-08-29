package com.chess.controllers
{
	import com.chess.models.ChessUIConstants;
	import com.chess.models.SynchronizeRequestModel;
	
	import mx.core.Application;
	
	public class ChessUIController
	{
		public function ChessUIController()
		{
		}
		
		public var lastLobbyChatId:int=0;
		
		public function checkUsername(username:String):void{
			Chess.chessServiceController.chkUsername(username);
		}
		public function saveChat(chatText:String,toUser:int):void{
			Chess.chessServiceController.saveChat(chatText,toUser)
		}
		public function syncronizeChat():void{
			var syncModel:SynchronizeRequestModel=new SynchronizeRequestModel;
			syncModel.lastChatId=lastLobbyChatId;
			
			if(Application.application.currentState == 'lobby'){
				//if lobby then only sync lobby chat
				syncModel.chatType=ChessUIConstants.LOBBY_CHAT;
			}else{
				
			}
			
			Chess.chessServiceController.synchronizeWithServer(syncModel);
		}

	}
}