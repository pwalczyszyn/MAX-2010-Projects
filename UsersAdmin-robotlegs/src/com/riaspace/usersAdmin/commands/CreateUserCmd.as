package com.riaspace.usersAdmin.commands
{
	import com.riaspace.usersAdmin.events.UserEvent;
	import com.riaspace.usersAdmin.models.ApplicationModel;
	import com.riaspace.usersAdmin.services.UsersService;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class CreateUserCmd extends Command 
	{
		[Inject]
		public var event:UserEvent;

		[Inject]
		public var usersService:UsersService;

		[Inject]
		public var applicationModel:ApplicationModel;

		override public function execute():void
		{
			var token:AsyncToken = usersService.create(event.user);
			token.addResponder(new Responder(create_resultHandler, create_faultHandler));
		}
		
		private function create_resultHandler(event:ResultEvent):void
		{
			this.event.user.id = event.result as Number;
			applicationModel.users.addItem(this.event.user);
			
			eventDispatcher.dispatchEvent(new UserEvent(UserEvent.USER_CREATED, this.event.user));
		}
		
		private function create_faultHandler(event:FaultEvent):void
		{
			Alert.show(event.message.toString());
		}
	}
}