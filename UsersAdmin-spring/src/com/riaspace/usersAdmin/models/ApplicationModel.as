package com.riaspace.usersAdmin.models
{
	import mx.collections.ArrayCollection;

	[Bindable]
	public class ApplicationModel
	{
		public var currentState:String = "LOADING_USERS";
		
		public var users:ArrayCollection;
	}
}