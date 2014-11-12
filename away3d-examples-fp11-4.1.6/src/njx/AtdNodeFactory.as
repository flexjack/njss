package njx
{
	public class AtdNodeFactory implements FjrNodeFactory
	{
		public function AtdNodeFactory()
		{
		}
		
		public function createImg(t:FjrTexture=null):FjrImg
		{
			var i:AtdImgNode = new AtdImgNode();
			if(t){
				i.setFilm(t);
			}
			
			return i;
		}
		
		public function createContainer(ns:Boolean=false):FjrContainer
		{
			return new AtdContainer();
		}
		
		public function createFjrBG(double:Boolean=false):FjrBG
		{
			return null;
		}
		
		public function createRTNode(w:int, h:int):FjrRTNode
		{
			return null;
		}
	}
}