package
{
	import com.mcglib.debug.FPSCounter;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.utils.setTimeout;
	
	import away3d.debug.AwayStats;
	
	import njx.AtdContainer;
	import njx.Njx;
	
	public class NjxTest extends Sprite
	{
		[Embed(source="monster.png")]
		public static var imgClass:Class;
		
		private var fjr:Njx = new Njx;
		
		private var imgs:Array = new Array;
		
		private var c:AtdContainer;
		
		public function NjxTest()
		{
			super();
			stage.frameRate = 60;
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.quality = StageQuality.LOW;
			
			setTimeout(init,100);
		}
		
		private function init():void{
			
			stage.addChild(new FPSCounter());
			
			fjr.init(stage,stage.stageWidth,stage.stageHeight);
			
			//setup floor material
			var tbd:BitmapData = ((new imgClass) as Bitmap).bitmapData;
			
			
			var t:FjrTexture = fjr.textureFactory.fromBitmapData(tbd);
			c = new AtdContainer;
			for(var i:int=0;i<500;i++){
				var img:FjrImg = fjr.nodeFactory.createImg(t);
				imgs.push(img);
				img.alpha = Math.random();
				c.addChild(img);	
			}
			
			
			
			//img.rotation = 30;	
			fjr.root.addChild(c);
			
			addEventListener(Event.ENTER_FRAME,onEnterFrame);
			
			
		}
		
		private function onEnterFrame(e:Event):void{
			//img.rotation+=1;
			//img.rotation%=360;
			
			//img.x = Math.random()*1000;
			//img.y = Math.random()*1000;
			for each(var img:FjrImg in imgs){
				img.x = Math.random()*1600;
				img.y = Math.random()*1000;
			}
			
			fjr.render(true);
		}
	}
}