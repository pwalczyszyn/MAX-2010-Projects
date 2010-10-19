package com.riaspace.usersAdmin.controllers
{
	import com.riaspace.usersAdmin.models.ApplicationModel;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.Fault;
	
	public class StartupController
	{
		// Injected
		public var applicationModel:ApplicationModel;
		
		public function findAllUsers_resultHandler(result:Array):void
		{
			applicationModel.users = new ArrayCollection(result);
			applicationModel.currentState = "USERS_LIST_STATE";
		}
		
		public function findAllUsers_faultHandler(fault:Fault):void
		{
			Alert.show(fault.message);
		}
	}
}