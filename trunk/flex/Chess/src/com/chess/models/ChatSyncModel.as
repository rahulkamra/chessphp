package com.chess.models
{
	[Bindable]
	[RemoteClass(alias="com.chess.chat.model.ChatSyncModel")]
	public class ChatSyncModel
	{
		public function ChatSyncModel()
		{
		}
		
		public var cmid:int;
   		public var fromId:int;
   	 	public var fromName:String;
    	public var text:String;
    	public var timeStamp:Date;
    

	}
}