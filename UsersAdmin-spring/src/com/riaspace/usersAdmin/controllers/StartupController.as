package com.riaspace.usersAdmin.controllers 
{
	import com.riaspace.usersAdmin.models.ApplicationModel;
	import com.riaspace.usersAdmin.services.UsersService;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.springextensions.actionscript.core.operation.IOperation;
	import org.springextensions.actionscript.core.operation.OperationHandler;
	
	public class StartupController extends OperationHandler 
	{
		
		[Autowired]
		public var usersService:UsersService;
		
		[Autowired]
		public var applicationModel:ApplicationModel;
		
		public function initController():void 
		{
			var operation:IOperation = usersService.findAllUsers();
			handleOperation(operation, findAllUsers_resultHandler, applicationModel, "users", findAllUsers_faultHandler);
		}
		
		private function findAllUsers_resultHandler(result:Array):ArrayCollection 
		{
			applicationModel.currentState = "USERS_LIST_STATE";
			return new ArrayCollection(result);
		}
		
		private function findAllUsers_faultHandler(error:*):void 
		{
			Alert.show(error.message);
		}
	}
}