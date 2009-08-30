package com.chess.models
{
	public class ChessUIConstants
	{
		public function ChessUIConstants()
		{
		}
		public static const POLLING_TIME:int=3000;//in milli second
		public static const LOBBY_CHAT:String = 'lobbychat';
		public static const GAME_CHAT:String= 'gamechat'
		public static const ROOT_URL:String="http://192.168.1.8/amfphp/gateway.php"
		public static const AUTHENTICATE_SERVICE:String="com.chess.login.service.Authentication"
		public static const SAVE_CHAT_SERVICE:String="com.chess.chat.service.Chat";
		public static const SYNC_SERVICE:String="com.chess.synchronize.service.Synchronize";
	}
}