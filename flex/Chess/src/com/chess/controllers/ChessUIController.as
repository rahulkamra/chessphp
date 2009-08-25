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

	}
}