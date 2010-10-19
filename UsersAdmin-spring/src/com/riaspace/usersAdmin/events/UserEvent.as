package com.riaspace.usersAdmin.events
{
	import com.riaspace.usersAdmin.models.domain.User;
	
	import flash.events.Event;
	
	public class UserEvent extends Event
	{
		public static const USER_CREATED:String = "USER_CREATED";
		
		public static const CREATE_USER:String = "CREATE_USER";
		
		public var user:User;
		
		public function UserEvent(type:String, user:User, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			this.user = user;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new UserEvent(type, user, bubbles, cancelable);
		}
	}
}