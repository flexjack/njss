package njx
{
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.Dictionary;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.core.base.Object3D;

	public class AtdContainer extends AtdNode implements FjrContainer
	{
		
		protected var childs:Array = new Array;
		
		public function AtdContainer()
		{
			super();
		}
		
		public function addChild(n:FjrNode):FjrNode
		{
			if(!contains(n)){
				var o:ObjectContainer3D = AtdNode(n)._o;
				
				c.addChild(o);
				childs.push(n);
				resetChildDepth();
			}
			return n;
		}
		
		public function removeChild(n:FjrNode):FjrNode
		{
			var o:ObjectContainer3D = AtdNode(n)._o;
			c.removeChild(o);
			
			var index:int = childs.indexOf(n);
			if(index>-1){
				childs.splice(index,1);
			}
			
			resetChildDepth();
			
			return n;
		}
		
		public function removeAllChild():void
		{
			while(numChildren>0){
				removeChildAt(0);
			}
		}
		
		public function contains(n:FjrNode):Boolean
		{
			
			return childs.indexOf(n)!=-1;
		}
		
		public function getChildIndex(n:FjrNode):int
		{
			return childs.indexOf(n);
		}
		
		public function getChildAt(k:int):FjrNode
		{
			
			return childs[k] as FjrNode;
		}
		
		public function addChildAt(n:FjrNode, k:int):FjrNode
		{
			
			removeChild(n);
			
			if(k<0){
				k=0;
			}
			
			if(k>childs.length){
				k = childs.length;
			}
			
			childs.splice(k,0,n);
			
			var o:ObjectContainer3D = AtdNode(n)._o;
			
			c.addChild(o);
			
			resetChildDepth();
			
			return n;
		}
		
		public function removeChildAt(k:int):FjrNode
		{
			var n:FjrNode = getChildAt(k);
			if(n){
				var o:ObjectContainer3D = AtdNode(n)._o;
				c.removeChild(o);
				
				childs.splice(k,1);
			}
			
			resetChildDepth();
			
			return n;
		}
		
		public function setChildIndex(n:FjrNode, k:int):int
		{
			if(contains(n)){
				if(k<0){
					k=0;
				}
				if(k>=childs.length){
					k=childs.length-1;
					
					
				}
				
				var i:int = childs.indexOf(n);
				var m:Object = n;
				childs[i] = childs[k];
				childs[k] = n;
				
				resetChildDepth();
				
				
				return k;
			}
			
			
			return -1;
		}
		
		public function get numChildren():uint
		{
			return childs.length;
		}
		
		override protected function initO():ObjectContainer3D{
			return new ObjectContainer3D();
		}
		
		private function  get c():ObjectContainer3D{
			return _o as ObjectContainer3D;
		}
		
		
		
		private function resetChildDepth():void{
			for(var i:int=0;i<c.numChildren;i++){
				//c.y = 500*i;
			}
		}
		
		override public function render(ri:FjrRenderInfo):void{
			//super.render(ri);
			/*_o.transform.appendTranslation(x,0,-y);
			_o.transform.appendScale(Math.abs(scaleX),1,Math.abs(scaleY));
			
			_o.transform.appendRotation(_rotation,Vector3D.Y_AXIS,new Vector3D(x,0,-y));
			if(scaleX<0){
				_o.transform.appendRotation(90+90*Math.abs(scaleX),Vector3D.Z_AXIS,new Vector3D(x,0,-y));		
			}*/
			
			_o.x = x;
			_o.z = -y;
			_o.scaleX = scaleX;
			_o.scaleZ = scaleY;
			//_o.pivotPoint = new Vector3D(x,0,-y);
			_o.rotationY = _rotation;
			
			for each(var node:FjrNode in childs){
				node.render(ri);
			}
		}
	}
}