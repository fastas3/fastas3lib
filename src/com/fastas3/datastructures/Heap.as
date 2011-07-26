package com.fastas3.datastructures
{
	public class Heap
	{
		private var heap:Array = [];
		private var count:int = 0;
		private var compare:Function;
		
		public function Heap(compare:Function)
		{
			this.compare = compare;
		}
		
		public function insert(object:Object):void
		{
			enqueue(object);
		}
		
		public function removeRoot():Object
		{
			return dequeue();
		}
		
		private function enqueue(object:Object):void
		{
			count++;
			heap[count] = object;
			walkUp(count);
		}
		
		private function dequeue():Object
		{
			var root:Object;
			if(count >= 1)
			{
				root = heap[1];
				heap[1] = heap[count];
				heap.pop();
				walkDown(1);
				count--;
			}
			return root;
		}
		
		private function walkUp(index:int):void
		{
			var parent:int = index / 2;
			var child:int = index;
			var objectAtIndex:Object = heap[child];
			while(parent > 0)
			{
				if(compare(objectAtIndex, heap[parent]) > 0)
				{
					heap[child] = heap[parent];
					child = parent;
					parent /= 2;
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
			if(index >= count)
			{
				return;
			}
			
			var parent:int = index;
			var child:int = index * 2;
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
					child *= 2;
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