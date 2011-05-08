package com.fastas3.utils
{
	import flash.utils.Dictionary;
	
	/**
	 * @author Adrian Wiecek | fastas3.com
	 */	
	public class Dict
	{
		private var dictionary:Dictionary;
		
		private var _size:int = 0;
		
		private var weakKeys:Boolean;
		
		public function Dict(weakKeys:Boolean=false)
		{
			this.weakKeys = weakKeys;
			dictionary = new Dictionary(weakKeys);
		}
		
		public function get size():int
		{
			return _size;
		}
		
		public function get isEmpty():Boolean
		{
			return _size == 0;
		}
		
		public function get keys():Array
		{
			var keysArray:Array = [];
			var i:int = 0;
			for(var key:Object in dictionary)
			{
				keysArray[i++] = key;
			}
			return keysArray;
		}
		
		public function get values():Array
		{
			var valuesArray:Array = [];
			var i:int = 0;
			for each(var value:Object in dictionary)
			{
				valuesArray[i++] = value;
			}
			return valuesArray;
		}
		
		public function clear():void
		{
			for(var key:Object in dictionary)
			{
				delete dictionary[key];
			}
			_size = 0;
		}
		
		public function get(key:Object):Object
		{
			return dictionary[key];
		}
		
		public function add(key:Object, value:Object):void
		{
			if(!(key in dictionary))
			{
				_size++;
			}
			
			dictionary[key] = value;
			
		}
		
		public function remove(key:Object):void
		{
			delete dictionary[key];
			_size--;
		}
		
		public function hasKey(key:Object):Boolean
		{
			return key in dictionary;
		}
		
		public function hasValue(value:Object):Boolean
		{
			for each(var val:Object in dictionary)
			{
				if(val === value)
				{
					return true;
				}
			}
			return false;
		}
	}
}