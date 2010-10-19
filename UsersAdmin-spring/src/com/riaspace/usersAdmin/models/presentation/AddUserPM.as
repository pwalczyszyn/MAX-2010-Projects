package com.riaspace.usersAdmin.models.presentation {
	import com.riaspace.usersAdmin.events.UserEvent;
	import com.riaspace.usersAdmin.models.domain.User;
	
	import flash.events.EventDispatcher;
	
	[RouteEvents(events="CREATE_USER")]
	[RouteMVCEvents(events="CREATE_USER")]
	[Event(name="CREATE_USER", type="com.riaspace.usersAdmin.events.UserEvent")]
	public class AddUserPM extends EventDispatcher {
		
		[Bindable]
		public var user:User;
		
		public function postConstruct():void 
		{
			user = new User();
		}
		
		public function btnCreateUser_clickHandler():void 
		{
			dispatchEvent(new UserEvent(UserEvent.CREATE_USER, user));
		}
	}
}