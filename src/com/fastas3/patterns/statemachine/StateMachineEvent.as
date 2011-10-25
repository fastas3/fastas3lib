package com.fastas3.patterns.statemachine
{
	import flash.events.Event;

	/**
	 * @author Adrian Wiecek | fastas3.com
	 */
	public class StateMachineEvent extends Event
	{
		/**
		 * Notifies about exiting from state.
		 */
		public static const EXIT:String = "exit";

		/**
		 * Notifies about changing to state.
		 */
		public static const CHANGE:String = "change";

		/**
		 * State related to the event.
		 */
		public var state:IState;

		/**
		 * Indicates if init is the reason of the event.
		 */
		public var init:Boolean;

		/**
		 * Indicates if reload is the reason of the event.
		 */
		public var reload:Boolean;

		public function StateMachineEvent(type:String, state:IState, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
			this.state = state;
		}

		override public function clone():Event
		{
			var event:StateMachineEvent = new StateMachineEvent(type, state, bubbles, cancelable);
			event.init = init;
			event.reload = reload;
			return event;
		}

		override public function toString():String
		{
			return super.toString() +
				"\ntype: " + type +
				", state: " + state.name +
				", init: " + init +
				", reload: " + reload;
		}
	}
}
