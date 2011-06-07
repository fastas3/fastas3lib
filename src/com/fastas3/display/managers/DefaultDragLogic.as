package com.fastas3.display.managers
{
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class DefaultDragLogic implements IDragLogic
	{
		private var tracker:DisplayObject;
		
		private var draggedObject:DisplayObject;
		private var bounds:Rectangle;
		
		private var offset:Point;
		
		public function DefaultDragLogic(tracker:DisplayObject)
		{
			this.tracker = tracker;
		}
		
		public function startDrag(target:DisplayObject, bounds:Rectangle=null):void
		{
			this.draggedObject = target;
			this.bounds = bounds;
			this.offset = new Point(target.mouseX, target.mouseY);
			this.tracker.addEventListener(MouseEvent.MOUSE_MOVE, drag_handler);
			this.tracker.addEventListener(MouseEvent.MOUSE_UP, drag_finish_handler);
		}
		
		public function stopDrag(target:DisplayObject):void
		{
			if(this.draggedObject == target)
			{
				remove_listeners();
			}
		}
		
		protected function drag_handler(event:MouseEvent):void
		{
			var new_x:Number = tracker.mouseX - offset.x; 
			var new_y:Number = tracker.mouseY - offset.y;
			var new_right:Number =  bounds.right - draggedObject.width;
			var new_bottom:Number =  bounds.bottom - draggedObject.height;
			
			if(bounds)
			{
				if(new_x < bounds.x)
				{
					new_x = bounds.x;
				}
				else if(new_x > new_right)
				{
					new_x = new_right;
				}
				
				if(new_y < bounds.y)
				{
					new_y = bounds.y;
				}
				else if(new_y > new_bottom)
				{
					new_y = new_bottom;
				}
			}
			
			draggedObject.x = new_x;
			draggedObject.y = new_y;
		}
		
		protected function drag_finish_handler(event:MouseEvent):void
		{
			remove_listeners();
		}
		
		private function remove_listeners():void
		{
			this.tracker.removeEventListener(MouseEvent.MOUSE_MOVE, drag_handler);
			this.tracker.removeEventListener(MouseEvent.MOUSE_UP, drag_finish_handler);
		}
	}
}