package com.chess.models
{
	[Bindable]
	[RemoteClass(alias="com.chess.synchronize.model.SynchronizeRequestModel")]
	public class SynchronizeResponseModel
	{
		public function SynchronizeResponseModel()
		{
		}
		
		public var chatSyn:Array

	}
}