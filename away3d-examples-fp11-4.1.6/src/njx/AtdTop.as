package njx
{
	public class AtdTop extends AtdContainer
	{
		public function AtdTop()
		{
			super();
		}
		
		override public function render(ri:FjrRenderInfo):void{
			for each(var node:FjrNode in childs){
				node.render(ri);
			}
		}
	}
}