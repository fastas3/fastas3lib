package com.fastas3.patterns.statemachine
{
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	/**
	 * @author Adrian Wiecek | fastas3.com
	 */	
	public class StateMachine extends EventDispatcher
	{
		private var states:Dictionary = new Dictionary();
		
		private var _currentState:State;
		
		public function StateMachine()
		{
			super();
		}
		
		public function registerState(state:State, initial:Boolean = false):void
		{
			states[state.name] = state;
			if(initial)
			{
				_currentState = state;
			}
		}
		
		public function defineTransition(from:String, to:String, two_way:Boolean = false):void
		{
			var fromState:State = states[from] as State;
			var toState:State = states[to] as State;
			if(fromState && toState)
			{
				fromState.addTransition(toState);
				if(two_way)
				{
					toState.addTransition(fromState);
				}
			}
		}
		
		public function get currentState():State
		{
			return _currentState;
		}
		
		public function set currentState(state:State):void
		{
			if(_currentState.hasTransitionToState(state))
			{
				switchToState(state);
			}
		}
		
		private function switchToState(state:State):void
		{
			var new_state:State = states[state.name] as State;
			if(new_state)
			{
				dispatchEvent(new StateMachineEvent(StateMachineEvent.EXITING, _currentState));
				_currentState = new_state;
				dispatchEvent(new StateMachineEvent(StateMachineEvent.ENTERING, _currentState));
			}
		}
	}
}