package com.riaspace.usersAdmin.models.presentation
{
	import mx.collections.ArrayCollection;
	
	public class UsersListPM
	{
		[Bindable]
		[Subscribe(objectId="allUsers")]
		public var users:ArrayCollection;
	}
}