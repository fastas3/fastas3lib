package com.fastas3.datastructures
{
	public class Array2D
	{
		private var array:Array = [];
		private var width:int;
		private var height:int;
		
		public function Array2D(width:int, height:int)
		{
			this.width = width;
			this.height = height;
		}
		
		public function get(x:int, y:int):Object
		{
			return array[int(y * width + x)];
		}
		
		public function set(object:Object, x:int, y:int):void
		{
			array[int(y * width + x)] = object;
		}
	}
}