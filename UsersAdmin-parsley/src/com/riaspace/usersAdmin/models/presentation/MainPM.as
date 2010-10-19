package com.riaspace.usersAdmin.models.presentation
{
	import com.riaspace.usersAdmin.events.UserEvent;

	public class MainPM
	{
		[Bindable]
		[PublishSubscribe(objectId="currentState")]
		public var currentState:String;
		
		public function btnAddUser_clickHandler():void
		{
			currentState = "ADD_USER_STATE";
		}
		
		public function btnUsersList_clickHandler():void
		{
			currentState = "USERS_LIST_STATE";
		}
		
		[MessageHandler(selector="USER_CREATED")]
		public function userAdded(event:UserEvent):void
		{
			trace("Added user: ", event.user.name);
			currentState = "USERS_LIST_STATE";
		}
	}
}