package com.fastas3.algorithms
{
	/**
	 * @author Adrian Wiecek | fastas3.com
	 */	
	public class BinarySearch
	{
		public function BinarySearch()
		{
		}
		
		public static function objectSearch(collection:Object, property:String, value:int):Object 
		{
			var low:int = 0;
			var high:int = int(collection.length) - 1;

			var mid:int;
			var midValue:int;
			
			while (low <= high)
			{
				mid = (low + high) >>> 1; // division by 2 (>>> prevents overflows on large collections)
				midValue = int(collection[mid][property]);
				
				if (midValue < value)
				{
					low = mid + 1
				}					
				else if (midValue > value)
				{
					high = mid - 1;
				}
				else
				{
					return collection[mid];
				}
			}
			return null;
		}
	}
}