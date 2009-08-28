package com.chess.controllers
{
	import mx.controls.Alert;
	
	public class ChessUIController
	{
		public function ChessUIController()
		{
		}
		
		public function checkUsername(username:String):void{
			Chess.chessServiceController.chkUsername(username);
		}
		public function saveChat(chatText:String,toUser:int):void{
			Chess.chessServiceController.saveChat(chatText,toUser)
		}

	}
}