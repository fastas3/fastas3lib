package com.fastas3.debug
{
	/**
	 * @author Adrian Wiecek | fastas3.com
	 */	
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