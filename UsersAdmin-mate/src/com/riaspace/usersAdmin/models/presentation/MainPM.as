package com.riaspace.usersAdmin.models.presentation
{
	import com.riaspace.usersAdmin.events.UserEvent;
	import com.riaspace.usersAdmin.models.ApplicationModel;

	public class MainPM
	{
		// Injected
		[Bindable]
		public var applicationModel:ApplicationModel;
		
		public function btnAddUser_clickHandler():void
		{
			applicationModel.currentState = "ADD_USER_STATE";
		}
		
		public function btnUsersList_clickHandler():void
		{
			applicationModel.currentState = "USERS_LIST_STATE";
		}
		
		public function userAdded(event:UserEvent):void
		{
			trace("Added user: ", event.user.name);
			applicationModel.currentState = "USERS_LIST_STATE";
		}
	}
}