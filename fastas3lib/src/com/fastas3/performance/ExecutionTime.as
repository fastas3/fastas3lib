package com.fastas3.performance
{
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getTimer;

	public class ExecutionTime
	{
		private static var executions:Dictionary = new Dictionary();
		
		private static var finished:Dictionary = new Dictionary();
		
		public static var reportTextField:TextField = init();
		
		public function ExecutionTime()
		{
		}
		
		private static function init():TextField
		{
			var tf:TextField = new TextField();
			tf.defaultTextFormat = new TextFormat("Verdana", 9);
			tf.x = 10;
			tf.y = 10;
			tf.autoSize = TextFieldAutoSize.LEFT;
			return tf;
		}
		
		public static function clear():void
		{
			executions = new Dictionary();
			finished = new Dictionary();
			reportTextField.text = "";
		}
		
		public static function start(object:Object, methodName:String):void
		{
			if(!executions[object])
			{
				executions[object] = new Dictionary();
				finished[object] = new Dictionary();
			}
			
			var execution:Execution = new Execution(object, methodName);
			executions[object][methodName] = execution;
			
			execution.start = getTimer();
		}
		
		public static function finish(object:Object, methodName:String):String
		{
			var time:int = getTimer();
			
			var execution:Execution = executions[object][methodName] as Execution;
			if(execution)
			{
				execution.finish = time;
				if(!finished[object][methodName])
				{
					finished[object][methodName] = [];
				}
				finished[object][methodName].push(execution);
				delete executions[object][methodName];
				
				reportTextField.text = execution.getReport()
			}
			else
			{
				reportTextField.text = "";
			}
			
			return reportTextField.text;
		}
		
		public static function generateReport():String
		{
			var report:String = "";
			
			var totalTime:int;
			var avg:Number;
			var calls:int;
			var methodExecutions:Array; 
			
			for(var object:Object in finished)
			{
				report += "class: " + getQualifiedClassName(object);
				for(var methodName:String in finished[object])
				{
					report += "\nmethod: " + methodName;
					methodExecutions = finished[object][methodName];
					calls = methodExecutions.length;
					totalTime = 0;
					if(methodExecutions && calls > 0)
					{
						for each(var execution:Execution in methodExecutions)
						{
							totalTime += execution.totalTime;;
						}
					}
					avg = totalTime / calls;
					report += "\ncalls: " + calls + "\ntotal time: " + totalTime + "\navg time: " + avg.toFixed(1) + " ms";
				}
			}
			reportTextField.text = report;
			return report;
		}
	}
}
