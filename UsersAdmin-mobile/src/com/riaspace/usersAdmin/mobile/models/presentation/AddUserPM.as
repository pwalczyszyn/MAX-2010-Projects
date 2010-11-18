package com.riaspace.usersAdmin.mobile.models.presentation
{
	import com.riaspace.usersAdmin.mobile.events.ChangeViewEvent;
	import com.riaspace.usersAdmin.mobile.models.domain.User;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class AddUserPM
	{
		
		[Bindable]
		public var viewState:String = "FORM_STATE";
		
		[Bindable]
		public var user:User;
		
		public function AddUserPM()
		{
			user = new User();
		}
		
		public function backKey_pressedHandler():void
		{
			// Changing view state to progress
			viewState = "PROGRESS_STATE";

			// Executing remote sevice method to create new user
			$.execute("remoteObject", "create", [user], create_resultHandler, create_faultHandler);
		}
		
		public function btnCancel_clickHandler():void
		{
			// Poping the view to return to the list of users
			$.dispatch(new ChangeViewEvent(ChangeViewEvent.POP_VIEW));
		}
		
		private function create_resultHandler(event:ResultEvent):void
		{
			// Poping the view to return to the list of users
			$.dispatch(new ChangeViewEvent(ChangeViewEvent.POP_VIEW));
		}
		
		private function create_faultHandler(event:FaultEvent):void
		{
			// TODO:
			trace("error creating user:",  event.fault.faultDetail);
		}
	}
}