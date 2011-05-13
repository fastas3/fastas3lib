package com.fastas3.patterns.statemachine
{
	import flash.events.Event;
	
	/**
	 * @author Adrian Wiecek | fastas3.com
	 */	
	public class StateMachineEvent extends Event
	{
		public static const EXITING:String = "exiting";
		public static const ENTERING:String = "entering";
		
		public var state:State;
		
		public function StateMachineEvent(type:String, state:State, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.state = state;
		}
		
		override public function clone():Event
		{
			return new StateMachineEvent(type, state, bubbles, cancelable);
		}
	}
}