package com.riaspace.usersAdmin.mobile.models.presentation
{
	import com.riaspace.usersAdmin.mobile.events.ChangeViewEvent;
	import com.riaspace.usersAdmin.mobile.models.domain.User;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class AddUserPM
	{
		[Bindable]
		public var user:User;
		
		public function AddUserPM()
		{
			user = new User();
		}
		
		public function btnCreate_clickHandler():void
		{
			remoteService.call("remoteObject", "create", [user], create_resultHandler, create_faultHandler);
		}
		
		private function create_faultHandler(event:FaultEvent):void
		{
			trace("error creating user:",  event.fault.faultDetail);
		}
		
		private function create_resultHandler(event:ResultEvent):void
		{
			eventDispatcher.dispatchEvent(new ChangeViewEvent(ChangeViewEvent.POP_VIEW));
		}
	}
}