package com.fastas3.display.managers
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class DragManager extends EventDispatcher
	{
		private var logic:IDragLogic;
		
		public function DragManager(logic:IDragLogic)
		{
			super();
			this.logic = logic;
		}
		
		public function startDrag(target:DisplayObject, bounds:Rectangle=null):void
		{
			logic.startDrag(target, bounds);
		}
	}
}