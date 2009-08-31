package com.app.models
{
	[Bindable]
	[RemoteClass(alias="com.app.synchronize.model.SynchronizeRequestModel")]
	public class SynchronizeResponseModel
	{
		public function SynchronizeResponseModel()
		{
		}
		
		public var chatSyn:Array

	}
}