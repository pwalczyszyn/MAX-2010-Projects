package com.riaspace.usersAdmin.commands
{
	import com.riaspace.usersAdmin.events.UserEvent;
	import com.riaspace.usersAdmin.models.ApplicationModel;
	import com.riaspace.usersAdmin.models.domain.User;
	import com.riaspace.usersAdmin.services.UsersService;
	
	import flash.events.EventDispatcher;
	
	import mx.controls.Alert;
	
	import org.springextensions.actionscript.core.operation.OperationHandler;
	
	[RouteEvents(events="USER_CREATED")]
	[Event(name="USER_CREATED", type="com.riaspace.usersAdmin.events.UserEvent")]
	[Command(eventType="CREATE_USER", properties="user")]
	public class CreateUserCmd extends EventDispatcher
	{
		
		private var _operationHandler:OperationHandler = new OperationHandler(create_faultHandler);
		
		[Autowired]
		public var usersService:UsersService;
		
		[Autowired]
		public var applicationModel:ApplicationModel;
		
		private var user:User;
		
		public function execute(user:User):*
		{
			this.user = user;
			_operationHandler.handleOperation(usersService.create(user), create_resultHandler);
		}
		
		private function create_resultHandler(result:Number):void {
			user.id = result;
			applicationModel.users.addItem(user);
			dispatchEvent(new UserEvent(UserEvent.USER_CREATED, user));
		}
		
		private function create_faultHandler(error:*):void {
			Alert.show(error.message.toString());
		}
	}
}