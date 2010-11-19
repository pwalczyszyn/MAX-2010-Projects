package com.riaspace.usersAdmin.mobile.models.presentation
{
	import com.riaspace.usersAdmin.mobile.events.ChangeViewEvent;
	import com.riaspace.usersAdmin.mobile.views.AddUserView;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class UsersListPM
	{
		[Bindable]
		public var viewState:String;
		
		[Bindable]
		public var users:ArrayCollection = $.inject("users");
		
		public function postConstruct():void
		{
			// In case this is a first time that related view is constructed
			// and users ArrayCollection is not initialized
			if (!users)
				loadUsers();
		}
		
		public function btnAddUser_clickHandler():void
		{
			// Changing the view to AddUserView
			$.dispatch(new ChangeViewEvent(ChangeViewEvent.PUSH_VIEW, AddUserView));
		}
		
		public function btnRefresh_clickHandler():void
		{
			loadUsers();
		}
		
		private function loadUsers():void
		{
			// Changing view state to progress
			viewState = "PROGRESS_STATE";
			
			// Executing remote service method to get current list of users
			$.execute("remoteObject", "findAllUsers", null, findAllUsers_resultHandler, findAllUsers_faultHandler);
		}
		
		private function findAllUsers_resultHandler(event:ResultEvent):void
		{
			if (users)
				// Removing all users from array collection
				users.removeAll();
			else
				// Setting users and also outjecting it to the application context
				users = $.inject("users", new ArrayCollection());
			
			// Adding all received users from remote service method call
			users.addAll(new ArrayCollection(event.result as Array));
			
			// Changing view state to list
			viewState = "LIST_STATE";
		}
		
		private function findAllUsers_faultHandler(event:FaultEvent):void
		{
			// TODO:
			trace("error conntecting to remoteObject:",  event.fault.faultDetail);
		}
	}
}