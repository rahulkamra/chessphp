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
			var result:Boolean=Boolean(event.result)
			if(result){
				//grant access
				Application.application.currentState='lobby'
			}else{
				Application.application.lblUsernameError.text=ChessProperties.usernameExistError;
				//username exist choosse another one
				
			}
		}

	}
}