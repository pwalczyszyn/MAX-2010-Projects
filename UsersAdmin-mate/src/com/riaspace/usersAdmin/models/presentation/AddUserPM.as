package com.riaspace.usersAdmin.models.presentation
{
	import com.riaspace.usersAdmin.events.UserEvent;
	import com.riaspace.usersAdmin.models.domain.User;
	
	import flash.events.IEventDispatcher;

	public class AddUserPM
	{
		// Injected
		public var dispatcher:IEventDispatcher;
		
		[Bindable]
		public var user:User;
		
		public function postConstruct():void
		{
			user = new User();
		}
		
		public function btnCreateUser_clickHandler():void
		{
			dispatcher.dispatchEvent(new UserEvent(UserEvent.CREATE_USER, user));
		}
	}
}