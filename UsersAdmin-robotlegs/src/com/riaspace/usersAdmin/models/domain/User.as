package com.riaspace.usersAdmin.models.domain
{
	import flash.utils.ByteArray;
	
	[Bindable]
	[RemoteClass(alias="User")]
	public class User
	{
		public var id:Number;
		
		public var name:String;
		
		public var picture:ByteArray;
		
		public function User()
		{
		}
	}
}