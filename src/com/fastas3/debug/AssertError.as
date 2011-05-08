package com.fastas3.debug
{
	public class AssertError extends Error
	{
		public function AssertError(message:String)
		{
			super(message);
			name = "AssertError";
		}
		
		public function toString(...rest):String
		{
			return name + ": " + message;
		}
	}
}