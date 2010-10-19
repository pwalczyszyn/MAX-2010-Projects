package com.riaspace.usersAdmin.controllers
{
	import com.riaspace.usersAdmin.events.StartupEvent;
	import com.riaspace.usersAdmin.models.ApplicationModel;
	import com.riaspace.usersAdmin.services.UsersService;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	
	public class StartupController
	{
		[MessageDispatcher]
		public var dispatcher:Function;

		[Inject]
		public var usersService:UsersService;
		
		[Inject]
		public var applicationModel:ApplicationModel;
		
		[PostConstruct]
		public function init():void
		{
			dispatcher(new StartupEvent(StartupEvent.APP_STARTED));
		}
		
		[Command]
		public function findAllUsers(event:StartupEvent):AsyncToken
		{
			return usersService.findAllUsers();
		}
		
		[CommandResult]
		public function findAllUsers_resultHandler(users:Array, trigger:StartupEvent):void
		{
			applicationModel.users = new ArrayCollection(users);
			applicationModel.currentState = "USERS_LIST_STATE";
		}
		
		[CommandError]
		public function findAllUsers_faultHandler(event:FaultEvent, trigger:StartupEvent):void
		{
			Alert.show(event.fault.message);
		}
	}
}