package com.fastas3.debug
{

	public class Assert
	{
		public function Assert()
		{
		}
		
		public static function that(expression:Boolean, failedMsg:String=""):void
		{
			if(!expression)
			{
				throw new AssertError("Assertion failed! " + failedMsg);
			}
		}
	}
}