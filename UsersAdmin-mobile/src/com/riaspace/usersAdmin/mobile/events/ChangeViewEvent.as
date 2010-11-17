package com.riaspace.usersAdmin.mobile.events
{
	import flash.events.Event;
	
	import spark.effects.ViewTransition;
	
	public class ChangeViewEvent extends Event
	{
		
		public static const PUSH_VIEW:String = "pushView";
		
		public static const POP_VIEW:String = "popView";
		
		public var viewClass:Class;
		
		public var data:Object;
		
		public var transition:ViewTransition;
		
		public function ChangeViewEvent(type:String, viewClass:Class = null, data:Object = null, transition:ViewTransition = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.viewClass = viewClass;
			this.data = data;
			this.transition = transition;
		}
		
		override public function clone():Event
		{
			return new ChangeViewEvent(type, viewClass, data, transition, bubbles, cancelable);
		}
	}
}