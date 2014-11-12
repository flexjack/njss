package njx
{
	import flash.display3D.Context3D;
	import flash.geom.Matrix3D;
	import flash.geom.Point;
	
	public class AtdRenderInfo implements FjrRenderInfo
	{
		private var njxx:Njx;
		
		
		public function AtdRenderInfo(njxx:Njx)
		{
			this.njxx = njxx;
			
		}
		
		public function get c3d():Context3D
		{
			return null;
		}
		
		public function get projection():Matrix3D
		{
			return null;
		}
		
		public function get blendMode():String
		{
			return null;
		}
		
		public function set blendMode(mode:String):void
		{
		}
		
		public function set top(v:FjrContainer):void
		{
		}
		
		public function get top():FjrContainer
		{
			return null;
		}
		
		public function set offset(p:Point):void
		{
		}
		
		public function get offset():Point
		{
			return null;
		}
		
		public function get fjr():Fjr
		{
			return njxx;
		}
	}
}