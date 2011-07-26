package com.fastas3.datastructures
{
	/**
	 * @author Adrian Wiecek | fastas3.com
	 */	
	public class Heap
	{
		private var heap:Vector.<Object> = new Vector.<Object>();
		private var compare:Function;
		
		public function Heap(compare:Function)
		{
			this.compare = compare;
		}
		
		public function peek():Object
		{
			if(heap.length > 0)
			{
				return heap[0];
			}
			return null;
		}
		
		public function enqueue(object:Object):void
		{
			var count:int = heap.length;
			heap[count] = object;
			walkUp(count);
		}
		
		public function dequeue():Object
		{
			var root:Object;
			var count:int = heap.length;
			if(count >= 1)
			{
				root = heap[0];
				heap[0] = heap[count - 1];
				heap.pop();
				walkDown(0);
			}
			return root;
		}
		
		private function walkUp(index:int):void
		{
			var parent:int = index >> 1;
			var child:int = index;
			var objectAtIndex:Object = heap[child];
			while(child > 0 && parent >= 0)
			{
				if(compare(objectAtIndex, heap[parent]) > 0)
				{
					heap[child] = heap[parent];
					child = parent;
					parent >>= 1;
				}
				else
				{
					break;
				}
			}
			heap[child] = objectAtIndex;
		}
		
		private function walkDown(index:int):void
		{
			var count:int = heap.length;
			if(index >= count)
			{
				return;
			}
			
			var parent:int = index;
			var child:int = index << 1;
			var objectAtIndex:Object = heap[parent];
			
			while(child < count)
			{
				if(child < count - 1)
				{
					if(compare(heap[child], heap[child + 1]) < 0)
					{
						child++;
					}
				}
				if(compare(objectAtIndex, heap[child]) < 0)
				{
					heap[parent] = heap[child];
					parent = child;
					child <<= 1;
				}
				else
				{
					break;
				}
			}
			heap[parent] = objectAtIndex;
		}
	}
}