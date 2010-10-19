package com.riaspace.usersAdmin.commands
{
	import com.riaspace.usersAdmin.events.UserEvent;
	import com.riaspace.usersAdmin.models.ApplicationModel;
	import com.riaspace.usersAdmin.models.domain.User;
	import com.riaspace.usersAdmin.services.UsersService;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.swizframework.utils.commands.IEventAwareCommand;
	import org.swizframework.utils.services.ServiceHelper;
	
	public class CreateUserCmd implements IEventAwareCommand
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;

		[Inject]
		public var serviceHelper:ServiceHelper;
		
		[Inject]
		public var usersService:UsersService;

		[Inject]
		public var applicationModel:ApplicationModel;

		private var user:User;
		
		public function set event(value:Event):void
		{
			user = UserEvent(value).user;
		}
		
		public function execute():void
		{
			serviceHelper.executeServiceCall(usersService.create(user),
				create_resultHandler, create_faultHandler);
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