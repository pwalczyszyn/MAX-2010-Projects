package com.riaspace.usersAdmin.models.presentation
{
	import mx.collections.ArrayCollection;

	public class UsersListPM
	{
		
		[Bindable]
		[Autowired(name="applicationModel", property="users")]
		public var users:ArrayCollection;
		
	}
}