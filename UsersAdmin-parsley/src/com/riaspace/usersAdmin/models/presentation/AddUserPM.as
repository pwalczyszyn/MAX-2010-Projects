package com.riaspace.usersAdmin.models.presentation
{
	import com.riaspace.usersAdmin.events.UserEvent;
	import com.riaspace.usersAdmin.models.ApplicationModel;
	import com.riaspace.usersAdmin.models.domain.User;
	import com.riaspace.usersAdmin.services.UsersService;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class AddUserPM
	{
		[MessageDispatcher]
		public var dispatcher:Function;
		
		[Bindable]
		public var user:User;
		
		[Inject]		
		public var usersService:UsersService;
		
		[Inject]
		public var applicationModel:ApplicationModel;
		
		[PostConstruct]
		public function init():void
		{
			user = new User();
		}
		
		public function btnCreateUser_clickHandler():void
		{
			var token:AsyncToken = usersService.create(user);
			token.addResponder(new Responder(create_resultHandler, create_faultHandler));
		}
		
		private function create_resultHandler(event:ResultEvent):void
		{
			user.id = event.result as Number;
			applicationModel.users.addItem(user);
			
			dispatcher(new UserEvent(UserEvent.USER_CREATED, user));
		}
		
		private function create_faultHandler(event:FaultEvent):void
		{
			Alert.show(event.message.toString());
		}
	}
}