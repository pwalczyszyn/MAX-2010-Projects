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
		
//		private function create_resultHandler(event:ResultEvent):void
//		{
//			user.id = event.result as Number;
//			applicationModel.users.addItem(user);
//			
//			dispatcher.dispatchEvent(new UserEvent(UserEvent.USER_CREATED, user));
//		}
//		
//		private function create_faultHandler(event:FaultEvent):void
//		{
//			Alert.show(event.message.toString());
//		}
	}
}