package com.fastas3.display.managers
{
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;

	public interface IDragLogic
	{
		function startDrag(target:DisplayObject, bounds:Rectangle=null):void;
		function stopDrag(target:DisplayObject):void;
	}
}