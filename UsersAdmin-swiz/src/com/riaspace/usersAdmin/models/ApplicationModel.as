package com.riaspace.usersAdmin.models
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class ApplicationModel
	{
		public var currentState:String;
		
		public var users:ArrayCollection;
	}
}