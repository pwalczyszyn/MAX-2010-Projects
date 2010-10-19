package com.riaspace.usersAdmin.events
{
	import flash.events.Event;
	
	public class StartupEvent extends Event
	{
		
		public static const APP_STARTED:String = "APP_STARTED";
		
		public function StartupEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}