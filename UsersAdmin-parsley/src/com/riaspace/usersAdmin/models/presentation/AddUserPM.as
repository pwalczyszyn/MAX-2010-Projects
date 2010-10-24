package com.riaspace.usersAdmin.models.presentation
{
	import com.riaspace.usersAdmin.events.UserEvent;
	import com.riaspace.usersAdmin.models.domain.User;

	public class AddUserPM
	{
		[MessageDispatcher]
		public var dispatcher:Function;
		
		[Bindable]
		public var user:User;
		
		[PostConstruct]
		public function init():void
		{
			user = new User();
		}
		
		public function btnCreateUser_clickHandler():void
		{
			dispatcher(new UserEvent(UserEvent.CREATE_USER, user));
		}
	}
}