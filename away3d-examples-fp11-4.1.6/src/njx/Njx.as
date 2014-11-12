package njx
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import away3d.cameras.lenses.OrthographicLens;
	import away3d.containers.View3D;
	import away3d.controllers.HoverController;
	import away3d.debug.AwayStats;
	import away3d.lights.DirectionalLight;
	import away3d.materials.TextureMaterial;
	import away3d.materials.lightpickers.StaticLightPicker;
	import away3d.utils.Cast;
	
	public class Njx extends EventDispatcher implements Fjr
	{
		
		//engine variables
		public var _view:View3D;
		
		private var _cameraController:HoverController;
		
		//light objects
		public var _light:DirectionalLight;
		public var _lightPicker:StaticLightPicker;
		
		private var ri:AtdRenderInfo;
		
		private var _tf:FjrTextureFactory;
		
		private var _nf:FjrNodeFactory;
		
		private var _root:AtdContainer;
		
		private var _w:int;
		
		private var _h:int;
		
		public function Njx()
		{
			super();
			ri = new AtdRenderInfo(this);
			_tf = new AtdTextureFactory(this);
			_nf = new AtdNodeFactory();
		}
		
		public function init(s:Stage, w:Number, h:Number):void
		{
			//setup the view
			_view = new View3D();
			
			_w = w;
			_h = h;
			
			s.addChildAt(_view,0);
			
			//setup the camera for optimal rendering
			_view.camera.lens = new OrthographicLens(980);
			_view.camera.lens.far = 10000;
			
			
			
			
			//setup the lights for the scene
			_light = new DirectionalLight(0, -1, -1);
			_light.ambient = 0.4;
			_lightPicker = new StaticLightPicker([_light]);
			_view.scene.addChild(_light);
			
			
			
			//setup controller to be used on the camera
			_cameraController = new HoverController(_view.camera, null, 180, 90, 5000,0);
			
			
			
			_view.width = w;
			_view.height = h*1;
			(_view.camera.lens as OrthographicLens).projectionHeight = _view.height;
			
			_root = new AtdTop();
			
			_view.scene.addChild(_root._o);
			_root._o.x=-_view.width/2;
			_root._o.z=_view.height/2;
			
			//add stats panel
			//s.addChild(new AwayStats(_view));
		}
		
		public function resize(w:Number, h:Number):void
		{
		}
		
		public function render(rbd:Boolean):void
		{
			
			_root.render(ri);
			
			_view.render();
		}
		
		public function startRenderToTexture(t:FjrTexture, clear:Boolean=false):void
		{
		}
		
		public function endRenderToTexture(present:Boolean=false):void
		{
		}
		
		public function renderToTexture(node:FjrNode):void
		{
		}
		
		public function get textureFactory():FjrTextureFactory
		{
			return _tf;
		}
		
		public function get nodeFactory():FjrNodeFactory
		{
			return _nf;
		}
		
		public function get textureBuilderFactory():TextureBuilderFactory
		{
			return null;
		}
		
		public function get hub():Hub
		{
			return null;
		}
		
		public function background(color:uint):void
		{
		}
		
		public function get renderInfo():FjrRenderInfo
		{
			return ri;
		}
		
		public function get smvet():Boolean
		{
			return false;
		}
		
		public function createScreenshots(rect:Rectangle):FjrScreenshots
		{
			return null;
		}
		
		public function extractScreenshots(ss:FjrScreenshots):void
		{
		}
		
		public function removeScreenshots(ss:FjrScreenshots):void
		{
		}
		
		public function cp(p:Point):Point{
			p.x = -_w/2+p.x;
			p.y = _h/2-p.y;
			
			return p;
		}
		
		public function get height():Number
		{
			// TODO Auto Generated method stub
			return 0;
		}
		
		public function get root():FjrContainer
		{
			return _root;
		}
		
		public function get width():Number
		{
			// TODO Auto Generated method stub
			return 0;
		}
		
	}
}