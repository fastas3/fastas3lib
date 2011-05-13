package com.fastas3.patterns.statemachine
{
	import flash.utils.Dictionary;

	/**
	 * @author Adrian Wiecek | fastas3.com
	 */	
	public class State
	{
		private var _name:String;
		private var _transitions:Dictionary = new Dictionary();
		
		public function State(name:String)
		{
			_name = name;
		}

		public function get name():String
		{
			return _name;
		}
		
		public function addTransition(state:State):void
		{
			_transitions[state.name] = state;
		}
		
		public function hasTransitionToState(state:State):Boolean
		{
			return state.name in _transitions;
		}

	}
}