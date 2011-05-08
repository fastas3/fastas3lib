package com.fastas3.performance
{
	/**
	 * @author Adrian Wiecek | fastas3.com
	 */	
	internal class Execution
	{
		public var obj:Object;
		public var methodName:String;
		public var start:int;
		
		private var _finish:int;
		private var _totalTime:int;
		
		public function Execution(obj:Object, methodName:String)
		{
			this.obj = obj;
			this.methodName = methodName;
		}
		
		internal function get totalTime():int
		{
			return _totalTime;	
		}
		
		internal function getReport():String
		{
			return "method: " + methodName + ": " +
				totalTime + " ms";
		}
		
		internal function get finish():int
		{
			return _finish;
		}
		
		internal function set finish(value:int):void
		{
			_finish = value;
			_totalTime = _finish - start;
		}
	}
}