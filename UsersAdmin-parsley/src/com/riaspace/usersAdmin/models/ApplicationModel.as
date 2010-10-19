package com.riaspace.usersAdmin.models
{
	import mx.collections.ArrayCollection;

	[Bindable]
	public class ApplicationModel
	{
		[PublishSubscribe(objectId="currentState")]
		public var currentState:String = "LOADING_USERS";
		
		[Publish(objectId="allUsers")]
		public var users:ArrayCollection;
	}
}