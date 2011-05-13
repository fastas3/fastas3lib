package com.fastas3.data
{
	import mx.utils.StringUtil;

	public class FastJSON
	{
		public static const OPEN_CURLY:String = "{";
		public static const CLOSE_CURLY:String = "}";
		public static const OPEN_SQUARE:String = "[";
		public static const CLOSE_SQUARE:String = "]";
		public static const COLON:String = ":";
		public static const COMMA:String = ",";
		public static const QUOTE:String = "\"";
		
		public static const TRUE_STRING:String = "true";
		public static const FALSE_STRING:String = "false";
		
		public function FastJSON()
		{
		}
		
		public static function encode(jsonObject:Object):String
		{
			var jsonArray:Array;
			
			if(jsonObject is String)
			{
				return QUOTE + String(jsonObject) + QUOTE;
			}
			else if(jsonObject is Array)
			{
				jsonArray = jsonObject as Array;
				var length:int = jsonArray.length;
				var returnArray:Array = [];
				
				for(var j:int = 0; j < length; j++)
				{
					returnArray[j] = encode(jsonArray[j]);
				}
				return OPEN_SQUARE + returnArray.join(COMMA) + CLOSE_SQUARE;
			}
			else if(jsonObject is Object)
			{
				jsonArray = [];
				var i:int = 0;
				
				for(var key:String in jsonObject)
				{
					jsonArray[i++] = QUOTE + key + QUOTE + COLON + encode(jsonObject[key]);
				}
				return OPEN_CURLY + jsonArray.join(COMMA) + CLOSE_CURLY;
			}
			return String(jsonObject);
		}
		
		public static function trim(s:String):String 
		{
			if(s)
			{
				return s.replace(/^\s+|\s+$/g, '');
			}
			return null;
		}
		
	}
}