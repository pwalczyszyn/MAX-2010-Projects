package com.riaspace.usersAdmin.controllers
{
	import com.riaspace.usersAdmin.models.ApplicationModel;
	import com.riaspace.usersAdmin.services.UsersService;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class StartupController extends Command
	{
		[Inject]
		public var usersService:UsersService;
		
		[Inject]
		public var applicationModel:ApplicationModel;

		override public function execute():void
		{
			var token:AsyncToken = usersService.findAllUsers();
			token.addResponder(new Responder(findAllUsers_resultHandler, findAllUsers_faultHandler));
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