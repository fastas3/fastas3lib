package com.fastas3.patterns.statemachine
{
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;

	[Event(name = "exit", type = "com.fastas3.patterns.statemachine.StateMachineEvent")]
	[Event(name = "change", type = "com.fastas3.patterns.statemachine.StateMachineEvent")]
	/**
	 * @author Adrian Wiecek | fastas3.com
	 */
	public class StateMachine extends EventDispatcher
	{
		private var states:Dictionary = new Dictionary();
		private var transitions:Dictionary = new Dictionary();

		private var _currentState:IState;
		private var _initialState:IState;

		private var initialized:Boolean;

		public function StateMachine()
		{
			super();
		}

		public function canSwitchToState(state:IState):Boolean
		{
			return hasRegisteredState(state) &&
				hasRegisteredTransition(_currentState, state)
		}

		public function getCurrentState():IState
		{
			return _currentState;
		}

		public function getInitialState():IState
		{
			return _initialState;
		}

		public function hasRegisteredState(state:IState):Boolean
		{
			return state && state in states;
		}

		public function hasRegisteredTransition(from:IState, to:IState):Boolean
		{
			return transitions[from] && transitions[from][to] == to;
		}

		public function init(state:IState):void
		{
			if (!initialized && hasRegisteredState(state))
			{
				_initialState = state;
				switchToState(_initialState, true);
				initialized = true;
			}
			else
			{
				throw new Error("StateMachine init error");
			}
		}

		public function registerState(state:IState):void
		{
			if (state)
			{
				states[state] = state;
			}
			else
			{
				throw new Error("StateMachine registerState error");
			}
		}

		public function registerTransition(from:IState, to:IState, twoWay:Boolean = false):void
		{
			if (hasRegisteredState(from) && hasRegisteredState(to))
			{
				addTransition(from, to);
				if (twoWay)
				{
					addTransition(to, from);
				}
			}
			else
			{
				throw new Error("StateMachine registerTransition error");
			}
		}

		public function reload(initialState:IState):void
		{
			if (initialized && hasRegisteredState(initialState))
			{
				_initialState = initialState;
				switchToState(_initialState, false, true);
			}
			else
			{
				throw new Error("StateMachine reload error");
			}
		}

		public function removeState(state:IState):void
		{
			if (hasRegisteredState(state))
			{
				delete states[state];
				removeAllTransitions(state);
			}
			else
			{
				throw new Error("StateMachine removeState error");
			}
		}

		public function removeTransition(from:IState, to:IState, twoWay:Boolean = false):void
		{
			if (hasRegisteredState(from) && hasRegisteredState(to))
			{
				deleteTransition(from, to);
				if (twoWay)
				{
					deleteTransition(to, from);
				}
			}
			else
			{
				throw new Error("StateMachine removeTransition error");
			}
		}

		public function setCurrentState(state:IState):void
		{
			if (canSwitchToState(state))
			{
				switchToState(state);
			}
		}

		private function addTransition(from:IState, to:IState):void
		{
			var toTransitions:Dictionary = transitions[from] as Dictionary;
			if (!toTransitions)
			{
				toTransitions = new Dictionary();
				transitions[from] = toTransitions
			}
			toTransitions[to] = to;
		}

		private function deleteTransition(from:IState, to:IState):void
		{
			if (hasRegisteredTransition(from, to))
			{
				delete transitions[from][to];
			}
		}

		private function dispatchMachineEvent(type:String, state:IState, init:Boolean, reload:Boolean):void
		{
			var event:StateMachineEvent = new StateMachineEvent(type, state);
			event.init = init;
			event.reload = reload;
			dispatchEvent(event);
		}

		private function removeAllTransitions(state:IState):void
		{
			if (state in transitions)
			{
				delete transitions[state];
			}

			for (var from:Object in transitions)
			{
				deleteTransition(from as IState, state);
			}
		}

		private function switchToState(state:IState, init:Boolean = false, reload:Boolean = false):void
		{
			if (_currentState)
			{
				dispatchMachineEvent(StateMachineEvent.EXIT, _currentState, init, reload);
			}
			_currentState = state;
			dispatchMachineEvent(StateMachineEvent.CHANGE, _currentState, init, reload);
		}
	}
}
