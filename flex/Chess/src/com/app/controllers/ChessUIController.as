package com.app.controllers
{
	import com.app.models.ChessUIConstants;
	import com.app.models.SynchronizeRequestModel;
	
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
		
		
		public function displayChat(newChat:Array):void{
			var parentRef:Chess=Application.application as Chess;
			var updatedText:String=""
			if(Application.application.currentState == 'lobby'){
				
				for(var count:int= 0 ;count < newChat.length ; count++){
					var eachObj:Object=newChat[count];
					//each object is a new message
					updatedText="";
					updatedText=addExtraRowInChatText(parentRef.txaLobbyShow.text,eachObj.fromName,eachObj.text);
					parentRef.txaLobbyShow.text=updatedText;
				}
				//to take the scroll bar to the last position
				parentRef.txaLobbyShow.verticalScrollPosition=parentRef.txaLobbyShow.verticalScrollPosition+100;
				
			}else if(Application.application.currentState == 'game'){
				
			}
			
			lastLobbyChatId=newChat[newChat.length-1].cmid;
		}
		public function addExtraRowInChatText(chatHistory:String,username:String,chatText:String):String{
			chatText=username + " : " + chatText;
			chatHistory=chatHistory+chatText+'\n'
			return chatHistory
		}

	}
}