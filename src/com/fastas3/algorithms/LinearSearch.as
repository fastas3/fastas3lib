package com.fastas3.algorithms
{
	/**
	 * @author Adrian Wiecek | fastas3.com
	 */	
	public class LinearSearch
	{
		public function LinearSearch()
		{
		}
		
		public static function objectSearch(collection:Object, property:String, value:Object):Object 
		{
			var length:int = int(collection.length);
			
			for(var i:int = 0; i < length; i++)
			{
				if(collection[i][property] == value)
				{
					return collection[i];
				}
			}
			
			return null;
		}
		
		public static function valueSearch(collection:Object, value:Object):Object 
		{
			var length:int = int(collection.length);
			
			for(var i:int = 0; i < length; i++)
			{
				if(collection[i] == value)
				{
					return collection[i];
				}
			}
			
			return null;
		}
	}
}