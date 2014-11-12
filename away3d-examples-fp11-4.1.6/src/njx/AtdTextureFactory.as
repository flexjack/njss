package njx
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.utils.ByteArray;
	
	import away3d.textures.ATFTexture;
	import away3d.textures.BitmapTexture;
	import away3d.utils.Cast;
	
	public class AtdTextureFactory implements FjrTextureFactory
	{
		private var njxx:Njx;
		
		public function AtdTextureFactory(njxx:Njx)
		{
			this.njxx = njxx;
		}
		
		public function fromBitmapData(bd:BitmapData):FjrTexture
		{
			var pw:int = power2(bd.width);
			var ph:int = power2(bd.height);

			if(pw!=bd.width || ph!=bd.height){
				var tbd:BitmapData = new BitmapData(pw,ph,true,0x0);
				tbd.copyPixels(bd,bd.rect,new Point,null,null,true);
				bd = tbd
			}
			
			
			return new AtdTexture(new BitmapTexture(bd,true),bd.width,bd.height);
		}
		
		public function fromAtf(bytes:ByteArray):FjrTexture
		{
			var at:ATFTexture = new ATFTexture(bytes);
			
			return new AtdTexture(at,at.atfData.width,at.atfData.height);
		}
		
		public function convertFormat(t:FjrTexture, format:String, clear:Boolean=true):FjrTexture
		{
			return null;
		}
		
		
		private function power2(n:int):int{
			var k:int=1;
			while(k<n){
				k*=2;
			}
			return k;
		}
	}
}