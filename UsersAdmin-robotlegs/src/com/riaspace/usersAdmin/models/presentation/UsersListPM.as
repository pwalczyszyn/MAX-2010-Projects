package com.riaspace.usersAdmin.models.presentation
{
	import com.riaspace.usersAdmin.models.ApplicationModel;
	
	import org.robotlegs.mvcs.Actor;

	public class UsersListPM extends Actor
	{

		[Inject]
		[Bindable]
		public var applicationModel:ApplicationModel;
		
	}
}