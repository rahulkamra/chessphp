package com.app.models
{
	[Bindable]
	[RemoteClass(alias="com.app.synchronize.model.SynchronizeRequestModel")]
	public class SynchronizeRequestModel
	{
		public function SynchronizeRequestModel()
		{
		}
		
		public var lastChatId:int;
		public var chatType:String //It can either be group or lobby 

	}
}