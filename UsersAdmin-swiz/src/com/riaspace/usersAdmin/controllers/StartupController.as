package com.riaspace.usersAdmin.controllers
{
	import com.riaspace.usersAdmin.models.ApplicationModel;
	import com.riaspace.usersAdmin.services.UsersService;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.swizframework.utils.services.ServiceHelper;
	
	public class StartupController
	{
		[Inject]
		public var serviceHelper:ServiceHelper;
		
		[Inject]
		public var usersService:UsersService;
		
		[Inject]
		public var applicationModel:ApplicationModel;
		
		[PostConstruct]
		public function init():void
		{
			serviceHelper.executeServiceCall(usersService.findAllUsers(),
				findAllUsers_resultHandler, findAllUsers_faultHandler);
		}
		
		private function findAllUsers_resultHandler(event:ResultEvent):void
		{
			applicationModel.users = new ArrayCollection(event.result as Array);
			applicationModel.currentState = "USERS_LIST_STATE";
		}
		
		private function findAllUsers_faultHandler(event:FaultEvent):void
		{
			Alert.show(event.fault.message);
		}
	}
}