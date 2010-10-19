package com.riaspace.usersAdmin.configs
{
	import com.riaspace.usersAdmin.commands.CreateUserCmd;
	import com.riaspace.usersAdmin.controllers.StartupController;
	import com.riaspace.usersAdmin.events.UserEvent;
	import com.riaspace.usersAdmin.models.ApplicationModel;
	import com.riaspace.usersAdmin.models.presentation.AddUserPM;
	import com.riaspace.usersAdmin.models.presentation.MainPM;
	import com.riaspace.usersAdmin.models.presentation.UsersListPM;
	import com.riaspace.usersAdmin.services.UsersService;
	import com.riaspace.usersAdmin.views.AddUserView;
	import com.riaspace.usersAdmin.views.MainView;
	import com.riaspace.usersAdmin.views.UsersListView;
	
	import mx.rpc.remoting.RemoteObject;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	
	public class UsersAdminContext extends Context
	{
		override public function startup():void
		{
			commandMap.mapEvent(ContextEvent.STARTUP, StartupController, ContextEvent, true);
			
			commandMap.mapEvent(UserEvent.CREATE_USER, CreateUserCmd, UserEvent);
			
			injector.mapSingleton(ApplicationModel);
			
			injector.mapSingleton(UsersService);
			
			var remoteObject:RemoteObject = new RemoteObject("zend");
			remoteObject.source = "UsersService";
			remoteObject.endpoint = "http://amf.riaspace.com/messagebroker/amf";
			
			injector.mapValue(RemoteObject, remoteObject, "remoteObject");
			
			viewMap.mapType(MainView);
			injector.mapSingleton(MainPM);
			
			viewMap.mapType(AddUserView);
			injector.mapClass(AddUserPM, AddUserPM);
			
			viewMap.mapType(UsersListView);
			injector.mapSingleton(UsersListPM);
			
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}