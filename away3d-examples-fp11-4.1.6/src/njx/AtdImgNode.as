package njx
{
	import flash.display3D.Context3D;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.core.base.Object3D;
	import away3d.entities.Mesh;
	import away3d.materials.TextureMaterial;
	import away3d.primitives.PlaneGeometry;
	
	public class AtdImgNode extends AtdNode implements FjrImg
	{
		
		protected var _t:FjrTexture;
		
		protected var _m:TextureMaterial;
		
		private var mesh:Mesh;
		
		public function AtdImgNode()
		{
			super();
			
			mesh = new Mesh(new PlaneGeometry(1, 1));
			
			_o.addChild(mesh);
			
		}
		
		public function setFilm(t:FjrTexture, context:Context3D=null):void
		{
			_t = t;
			if(t){
				
				_m = new TextureMaterial(AtdTexture(t).m);
				
				plane.width = t.width;
				plane.height = t.height;
				
				this._width = t.width;
				this.height = t.height;
				
				plane.scaleUV(1, 1);
				mesh.material = _m;
				mesh.transform.identity();
				mesh.transform.appendTranslation(_width/2,0,-_height/2);
			}else{
				_m = null;
				mesh.material = null;
			}
		}
		
		override public function render(ri:FjrRenderInfo):void{
			super.render(ri);
		
			
			
			_o.x = x;
			_o.z = -y;
			_o.scaleX = scaleX;
			_o.scaleZ = scaleY;
			
			_o.rotationY = _rotation;		
			
			_m.alpha = alpha;
			
			
		}
		
		
		override public function set scaleX(v:Number):void{
			super.scaleX = v;
			plane.doubleSided = v<0;
		}
		
		public function getFilm():FjrTexture
		{
			return _t;
		}
		
		override protected function initO():ObjectContainer3D{
			
			return new ObjectContainer3D;
			
		}
		
		
		
		private function get plane():PlaneGeometry{
			return mesh.geometry as PlaneGeometry;
		}
	}
}