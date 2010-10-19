package com.riaspace.usersAdmin.configs
{
	import com.riaspace.usersAdmin.commands.CreateUserCmd;
	import com.riaspace.usersAdmin.events.UserEvent;
	
	import org.swizframework.utils.commands.CommandMap;
	
	public class Commands extends CommandMap
	{
		override protected function mapCommands():void
		{
			mapCommand(UserEvent.CREATE_USER, CreateUserCmd, UserEvent, false);
		}
	}
}