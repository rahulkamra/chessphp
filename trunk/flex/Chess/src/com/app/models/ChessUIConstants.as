package com.app.models
{
	public class ChessUIConstants
	{
		public function ChessUIConstants()
		{
		}
		public static const POLLING_TIME:int=3000;//in milli second
		public static const LOBBY_CHAT:String = 'lobbychat';
		public static const GAME_CHAT:String= 'gamechat'
		public static const ROOT_URL:String="http://192.168.0.151/amfphp/gateway.php"
		public static const AUTHENTICATE_SERVICE:String="com.app.login.service.Authentication"
		public static const SAVE_CHAT_SERVICE:String="com.app.chat.service.Chat";
		public static const SYNC_SERVICE:String="com.app.synchronize.service.Synchronize";
	}
}