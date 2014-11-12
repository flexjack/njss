package njx
{
	import flash.geom.Rectangle;
	
	import away3d.containers.ObjectContainer3D;
	
	public class Njxc implements FjrContainer
	{
		
		private var _c:ObjectContainer3D;
		
		public function Njxc()
		{
			_c = new ObjectContainer3D();
		}
		
		public function addChild(n:FjrNode):FjrNode
		{
			return null;
		}
		
		public function removeChild(n:FjrNode):FjrNode
		{
			return null;
		}
		
		public function removeAllChild():void
		{
		}
		
		public function contains(n:FjrNode):Boolean
		{
			return false;
		}
		
		public function getChildIndex(n:FjrNode):int
		{
			return 0;
		}
		
		public function getChildAt(k:int):FjrNode
		{
			return null;
		}
		
		public function addChildAt(n:FjrNode, k:int):FjrNode
		{
			return null;
		}
		
		public function removeChildAt(k:int):FjrNode
		{
			return null;
		}
		
		public function setChildIndex(n:FjrNode, k:int):int
		{
			return 0;
		}
		
		public function get numChildren():uint
		{
			return 0;
		}
		
		public function get x():Number
		{
			return 0;
		}
		
		public function set x(v:Number):void
		{
		}
		
		public function get y():Number
		{
			return 0;
		}
		
		public function set y(v:Number):void
		{
		}
		
		public function get alpha():Number
		{
			return 0;
		}
		
		public function set alpha(v:Number):void
		{
		}
		
		public function get scaleX():Number
		{
			return 0;
		}
		
		public function set scaleX(v:Number):void
		{
		}
		
		public function get scaleY():Number
		{
			return 0;
		}
		
		public function set scaleY(v:Number):void
		{
		}
		
		public function get rotation():Number
		{
			return 0;
		}
		
		public function set rotation(v:Number):void
		{
		}
		
		public function get width():Number
		{
			return 0;
		}
		
		public function set width(v:Number):void
		{
		}
		
		public function get height():Number
		{
			return 0;
		}
		
		public function set height(v:Number):void
		{
		}
		
		public function get parent():FjrContainer
		{
			return null;
		}
		
		public function get blendMode():String
		{
			return null;
		}
		
		public function set blendMode(v:String):void
		{
		}
		
		public function onAdded(parent:FjrContainer):void
		{
		}
		
		public function onRemoved():void
		{
		}
		
		public function render(ri:FjrRenderInfo):void
		{
		}
		
		public function get filters():Array
		{
			return null;
		}
		
		public function set filters(arr:Array):void
		{
		}
		
		public function get visible():Boolean
		{
			return false;
		}
		
		public function set visible(v:Boolean):void
		{
		}
		
		public function get fjrNode():FjrNode
		{
			return null;
		}
		
		public function getRect(container:FjrContainer=null):Rectangle
		{
			return null;
		}
		
		public function set rtAble(v:Boolean):void
		{
		}
		
		public function get rtAble():Boolean
		{
			return false;
		}
	}
}