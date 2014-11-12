package njx
{
	import flash.display3D.textures.TextureBase;
	import flash.events.EventDispatcher;
	
	import away3d.materials.MaterialBase;
	import away3d.textures.Texture2DBase;
	
	public class AtdTexture extends EventDispatcher implements FjrTexture
	{
		public var m:Texture2DBase;
		
		protected var _w:Number;
		
		protected var _h:Number;
		
		protected var _d:Boolean = false;
		
		public function AtdTexture(m:Texture2DBase,w:Number,h:Number)
		{
			this.m = m;
			
			this._w = w;
			this._h = h;
		}
		
		public function get textureBase():TextureBase
		{
			return null;
		}
		
		public function get width():uint
		{
			return _w;
		}
		
		public function get height():uint
		{
			return _h;
		}
		
		public function get su():Number
		{
			return 0;
		}
		
		public function get sv():Number
		{
			return 0;
		}
		
		public function get u():Number
		{
			return 0;
		}
		
		public function get v():Number
		{
			return 0;
		}
		
		public function dispose():void
		{
			m.dispose();
			_d = true;
		}
		
		public function get format():String
		{
			return null;
		}
		
		public function get ready():Boolean
		{
			return true;
		}
		
		public function get destroyed():Boolean
		{
			return _d;
		}
	}
}