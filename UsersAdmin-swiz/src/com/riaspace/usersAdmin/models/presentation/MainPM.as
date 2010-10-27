package com.riaspace.usersAdmin.models.presentation
{
	import com.riaspace.usersAdmin.models.domain.User;
	
	public class MainPM
	{
		
		[Bindable]
		[Inject(source="applicationModel.currentState", twoWay="true", bind="true")]
		public var currentState:String;
		
		public function MainPM()
		{
		}
		
		public function btnAddUser_clickHandler():void
		{
			currentState = "ADD_USER_STATE";
		}
		
		public function btnUsersList_clickHandler():void
		{
			currentState = "USERS_LIST_STATE";
		}
		
		[EventHandler(event="UserEvent.USER_CREATED", properties="user")]
		public function userAdded(user:User):void
		{
			trace("Added user: ", user.name);
			
			currentState = "USERS_LIST_STATE";
		}
		
	}
}