package com.app.controllers
{
	import com.app.models.GameProperties;
	import com.app.models.GameUIConstants;
	import com.app.models.SynchronizeRequestModel;
	
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	public class GameServiceController
	{
		public function GameServiceController()
		{
			
		}
		
			
		public function myFaultHandler(event:FaultEvent):void{
			Alert.show(event.message.toString())
		}
		
		public function chkUsername(username:String):void{
			var authRo:RemoteObject=new RemoteObject;
			authRo.endpoint=GameUIConstants.ROOT_URL;
			authRo.destination=GameUIConstants.AUTHENTICATE_SERVICE;
			authRo.source=GameUIConstants.AUTHENTICATE_SERVICE;
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
				Application.application.lblUsernameError.text=GameProperties.usernameExistError;
				//username exist choosse another one
				
			}
			Application.application.synTimer.start();
		}
		
		public function saveChat(chatText:String,toUser:int):void{
			var saveChatRO:RemoteObject=new RemoteObject;
			saveChatRO.endpoint=GameUIConstants.ROOT_URL;
			saveChatRO.destination=GameUIConstants.SAVE_CHAT_SERVICE;
			saveChatRO.source=GameUIConstants.SAVE_CHAT_SERVICE;
			saveChatRO.addEventListener(FaultEvent.FAULT,myFaultHandler);
			saveChatRO.addEventListener(ResultEvent.RESULT,saveChatResultHandler);
			saveChatRO.saveChat(toUser,chatText);
		}
		public function saveChatResultHandler(event:ResultEvent):void{
			var parentRef:Game=Application.application as Game
			var chatText:String=event.result.message;
			//var updatedText:String=Chess.chessUIController.addExtraRowInChatText(parentRef.txaLobbyShow.text,parentRef.userName,chatText);
			//parentRef.txaLobbyShow.text=updatedText;
			
			//to take the scroll bar to the last position
			//parentRef.txaLobbyShow.verticalScrollPosition=parentRef.txaLobbyShow.verticalScrollPosition+100;
			
			
		}
		
		public function synchronizeWithServer(syncModel:SynchronizeRequestModel):void{
			trace(syncModel.lastChatId + "    Last Chat Id")
			var syncRo:RemoteObject=new RemoteObject;
			syncRo.endpoint=GameUIConstants.ROOT_URL;
			syncRo.destination=GameUIConstants.SYNC_SERVICE;
			syncRo.source=GameUIConstants.SYNC_SERVICE;
			syncRo.addEventListener(FaultEvent.FAULT,myFaultHandler);
			syncRo.addEventListener(ResultEvent.RESULT,synchronizeWithServerResultHandler);
			syncRo.synchronizeWithServer(syncModel);
		}
		
		public function synchronizeWithServerResultHandler(event:ResultEvent):void{
			var responseChatSyncArrray:Array=event.result.chatSynArray;
			trace("event.result" + "Length of Array is " +responseChatSyncArrray.length )
			//trace(responseChatSyncArrray[0].fromName
			
			if(responseChatSyncArrray.length >0){
				Game.chessUIController.displayChat(responseChatSyncArrray);	
			}else{
				//no new chat to update
			}
		}

	}
}
