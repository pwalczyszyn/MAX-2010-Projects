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
		public var users:ArrayCollection = applicationContext.users;
		
		public function btnAddUser_clickHandler():void
		{
			eventDispatcher.dispatchEvent(new ChangeViewEvent(ChangeViewEvent.PUSH_VIEW, AddUserView));
		}
		
		public function btnRefresh_clickHandler():void
		{
			remoteService.call("remoteObject", "findAllUsers", null, findAllUsers_resultHandler, findAllUsers_faultHandler);
		}
		
		private function findAllUsers_faultHandler(event:FaultEvent):void
		{
			trace("error conntecting to remoteObject:",  event.fault.faultDetail);
		}
		
		private function findAllUsers_resultHandler(event:ResultEvent):void
		{
			users.removeAll();
			users.addAll(new ArrayCollection(event.result as Array));
		}
	}
}