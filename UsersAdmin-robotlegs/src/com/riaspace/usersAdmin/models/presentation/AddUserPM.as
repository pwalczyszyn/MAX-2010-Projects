package com.riaspace.usersAdmin.models.presentation
{
	import com.riaspace.usersAdmin.events.UserEvent;
	import com.riaspace.usersAdmin.models.domain.User;
	
	import org.robotlegs.mvcs.Actor;

	public class AddUserPM extends Actor
	{
		[Bindable]
		public var user:User;
		
		[PostConstruct]
		public function postConstruct():void
		{
			user = new User();
		}
		
		public function btnCreateUser_clickHandler():void
		{
			dispatch(new UserEvent(UserEvent.CREATE_USER, user));
		}
	}
}