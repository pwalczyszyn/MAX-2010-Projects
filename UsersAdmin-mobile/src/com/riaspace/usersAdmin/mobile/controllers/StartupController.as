package com.riaspace.usersAdmin.mobile.controllers
{
	import com.riaspace.usersAdmin.mobile.events.ChangeViewEvent;
	import com.riaspace.usersAdmin.mobile.views.ProgressView;
	import com.riaspace.usersAdmin.mobile.views.UsersListView;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectProxy;

	public class StartupController
	{
		public function postConstruct():void
		{
			eventDispatcher.dispatchEvent(new ChangeViewEvent(ChangeViewEvent.PUSH_VIEW, ProgressView, new ObjectProxy({progressLabel : "Loading users..."})));
			remoteService.call("remoteObject", "findAllUsers", null, findAllUsers_resultHandler, findAllUsers_faultHandler);
		}
		
		private function findAllUsers_faultHandler(event:FaultEvent):void
		{
			trace("error conntecting to remoteObject:",  event.fault.faultDetail);
		}
		
		private function findAllUsers_resultHandler(event:ResultEvent):void
		{
			applicationContext.users = new ArrayCollection(event.result as Array); 
			eventDispatcher.dispatchEvent(new ChangeViewEvent(ChangeViewEvent.PUSH_VIEW, UsersListView));
		}
	}
}