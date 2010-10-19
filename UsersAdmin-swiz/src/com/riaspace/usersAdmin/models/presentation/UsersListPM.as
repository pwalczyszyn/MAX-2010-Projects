package com.riaspace.usersAdmin.models.presentation
{
	import mx.collections.ArrayCollection;
	
	public class UsersListPM
	{
		[Bindable]
		[Inject(source="applicationModel.users", bind="true")]
		public var users:ArrayCollection;
	}
}