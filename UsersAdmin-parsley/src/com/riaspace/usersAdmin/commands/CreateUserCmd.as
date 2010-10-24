package com.riaspace.usersAdmin.commands
{
	import com.riaspace.usersAdmin.events.UserEvent;
	import com.riaspace.usersAdmin.models.domain.User;
	import com.riaspace.usersAdmin.services.UsersService;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	
	public class CreateUserCmd 
	{
		
		[MessageDispatcher]
		public var dispatcher:Function;

		[Inject]
		public var usersService:UsersService;

		[Subscribe(objectId="allUsers")]
		public var users:ArrayCollection;

		private var user:User;
		
		public function execute(event:UserEvent):AsyncToken
		{
			user = event.user;
			return usersService.create(user);
		}
		
		public function result(userId:Number):void
		{
			user.id = userId;
			this.users.addItem(user);
			
			dispatcher(new UserEvent(UserEvent.USER_CREATED, user));
		}
		
		public function error(fault:Fault):void
		{
			Alert.show(fault.faultString);
		}
	}
}