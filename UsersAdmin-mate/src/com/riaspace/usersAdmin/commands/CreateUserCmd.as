package com.riaspace.usersAdmin.commands
{
	import com.riaspace.usersAdmin.events.UserEvent;
	import com.riaspace.usersAdmin.models.ApplicationModel;
	import com.riaspace.usersAdmin.models.domain.User;
	import com.riaspace.usersAdmin.services.UsersService;
	
	import flash.events.IEventDispatcher;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class CreateUserCmd
	{
		// Injected
		public var dispatcher:IEventDispatcher;

		// Injected
		public var usersService:UsersService;

		// Injected
		public var applicationModel:ApplicationModel;

		private var user:User;
		
		public function execute(event:UserEvent):void
		{
			user = event.user;
			
			var token:AsyncToken = usersService.create(event.user);
			token.addResponder(new Responder(create_resultHandler, create_faultHandler));
		}
		
		private function create_resultHandler(event:ResultEvent):void
		{
			user.id = event.result as Number;
			applicationModel.users.addItem(user);
			
			dispatcher.dispatchEvent(new UserEvent(UserEvent.USER_CREATED, user));
		}
		
		private function create_faultHandler(event:FaultEvent):void
		{
			Alert.show(event.message.toString());
		}
	}
}