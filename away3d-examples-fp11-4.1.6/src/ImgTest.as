package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.utils.setTimeout;
	
	import away3d.cameras.lenses.OrthographicLens;
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.View3D;
	import away3d.controllers.HoverController;
	import away3d.debug.AwayStats;
	import away3d.entities.Mesh;
	import away3d.lights.DirectionalLight;
	import away3d.materials.TextureMaterial;
	import away3d.materials.lightpickers.StaticLightPicker;
	import away3d.primitives.PlaneGeometry;
	import away3d.utils.Cast;
	
	public class ImgTest extends Sprite
	{
		[Embed(source="dog.jpg")]
		public static var imgClass:Class;
		
		//engine variables
		private var _view:View3D;
		
		private var _cameraController:HoverController;
		
		//light objects
		private var _light:DirectionalLight;
		private var _lightPicker:StaticLightPicker;
		
		//material objects
		private var _imgMaterial:TextureMaterial;
		
		//scene objects
		private var _img:Mesh;
		
		public function ImgTest()
		{
			super();
			
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			setTimeout(init,100);
		}
		
		private function init():void{
			stage.frameRate = 60;
			
			//setup the view
			_view = new View3D();
			
			addChild(_view);
			
			//setup the camera for optimal rendering
			_view.camera.lens = new OrthographicLens(980);
			_view.camera.lens.far = 10000;
			
			
			
			
			//setup the lights for the scene
			_light = new DirectionalLight(0, -1, -1);
			_light.ambient = 0.4;
			_lightPicker = new StaticLightPicker([_light]);
			_view.scene.addChild(_light);
			
			//setup floor material
			var imgBD:BitmapData = ((new imgClass) as Bitmap).bitmapData;
			var tbd:BitmapData = new BitmapData(512,512,false);
			tbd.copyPixels(imgBD,tbd.rect,new Point);
			_imgMaterial = new TextureMaterial(Cast.bitmapTexture(tbd));
			_imgMaterial.lightPicker = _lightPicker;
			_imgMaterial.specular = 0;
			//_imgMaterial.ambient = 1;
			//_floorMaterial.shadowMethod = _shadowMapMethod;
			_imgMaterial.repeat = false;
		
			//setup controller to be used on the camera
			_cameraController = new HoverController(_view.camera, null, 180, 90, 5000,0);
			
			
			
			_view.width = 1680;
			_view.height = 1500;
			(_view.camera.lens as OrthographicLens).projectionHeight = _view.height;
			
			var c:ObjectContainer3D = new ObjectContainer3D;
			_view.scene.addChild(c);
			for(var i:int=0;i<6;i++){
				//setup the floor
				_img = new Mesh(new PlaneGeometry(512, 512), _imgMaterial);
				_img.geometry.scaleUV(1, 1);
				var p:Point = cp(new Point((i%3)*512+(_img.geometry as PlaneGeometry).width/2,Math.floor(i/3)*512+(_img.geometry as PlaneGeometry).height/2));
				_img.x = p.x;
				_img.z = p.y;
				//setup the scene
				c.addChild(_img);
			}
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			
			
		}
		
		/**
		 * Navigation and render loop
		 */
		private function onEnterFrame(event:Event):void
		{
		
			
			_view.render();
		}
		
		
		
		private function cp(p:Point):Point{
			p.x = -_view.width/2+p.x;
			p.y = _view.height/2-p.y;
			
			return p;
		}
	}
}