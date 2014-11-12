package njx
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.geom.Vector3D;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.core.base.Object3D;
	
	public class AtdNode implements FjrNode
	{
		public var _o: ObjectContainer3D;
		
		protected var _x:Number=0;
		
		protected var _y:Number=0;
		
		protected var _alpha:Number=1;
		
		protected var _scaleX:Number=1;
		
		protected var _scaleY:Number=1;
		
		protected var _rotation:Number=0;
		
		protected var _width:Number;
		
		protected var _height:Number;
		
		protected var _visible:Boolean=true;
		
		protected var _parent:FjrContainer;
		
		protected var _blendMode:String;
		
		public function AtdNode()
		{
			_o = initO();
		}
		
		protected function initO():ObjectContainer3D{
			return null;
		}
		
		public function get x():Number
		{
			return _x;
		}
		
		public function set x(v:Number):void
		{
			_x = v;	
		}
		
		public function get y():Number
		{
			return _y;	
		}
		
		public function set y(v:Number):void
		{
			_y = v;
		}
		
		public function get alpha():Number
		{
			return _alpha;
		}
		
		public function set alpha(v:Number):void
		{
			_alpha = v;
		}
		
		public function get scaleX():Number
		{
			return _scaleX;
		}
		
		public function set scaleX(v:Number):void
		{
			_scaleX = v;
		}
		
		public function get scaleY():Number
		{
			return _scaleY;
		}
		
		public function set scaleY(v:Number):void
		{
			_scaleY = v;
		}
		
		public function get rotation():Number
		{
			return _rotation;
		}
		
		public function set rotation(v:Number):void
		{
			_rotation = v;
		}
		
		public function get width():Number
		{
			return _width;
		}
		
		public function set width(v:Number):void
		{
			_width = v;
		}
		
		public function get height():Number
		{
			return _height;
		}
		
		public function set height(v:Number):void
		{
			_height = v;
		}
		
		public function get parent():FjrContainer
		{
			return _parent;
		}
		
		public function get blendMode():String
		{
			return _blendMode;
		}
		
		public function set blendMode(v:String):void
		{
			_blendMode = v;
		}
		
		public function onAdded(parent:FjrContainer):void
		{
			_parent = parent;
		}
		
		public function onRemoved():void
		{
			_parent = null;
		}
		
		public function render(ri:FjrRenderInfo):void
		{
			if(_o){
				
			}
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
			return _visible;
		}
		
		public function set visible(v:Boolean):void
		{
			_visible = v;
		}
		
		public function get fjrNode():FjrNode
		{
			return this;
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