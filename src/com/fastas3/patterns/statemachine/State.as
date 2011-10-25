package com.fastas3.patterns.statemachine
{

	/**
	 * @author Adrian Wiecek | fastas3.com
	 */
	public class State implements IState
	{
		private var _name:String;

		public function State(name:String)
		{
			_name = name;
		}

		public function get name():String
		{
			return _name;
		}
	}
}
