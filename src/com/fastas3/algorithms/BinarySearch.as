package com.fastas3.algorithms
{
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
			var midVal:int;
			
			while (low <= high)
			{
				mid = (low + high) >>> 1; // division by 2 (>>> prevents overflows on large collections)
				midVal = int(collection[mid][property]);
				
				if (midVal < value)
				{
					low = mid + 1
				}					
				else if (midVal > value)
				{
					high = mid - 1;
				}
				else
				{
					return collection[mid]; // value found
				}
			}
			return null;  // value not found.
		}
		
	}
}