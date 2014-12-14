package com
{
	import com.losttemple.assets.Assets;
	import com.losttemple.templates.base.Template;
	
	import com.framework.AppFacade;
	import com.framework.view.ui.loading.FirstLoading;
	
	import lzm.starling.STLConstant;
	import lzm.starling.STLMainClass;
	
	import starling.core.Starling;
	import starling.events.Event;
	import starling.utils.AssetManager;
	import starling.utils.HAlign;
	
	import com.losttemple.utils.AssetsUtil;
	
	public class GameMainClass extends STLMainClass
	{
		private var _firstLoading:FirstLoading;
		
		public function GameMainClass()
		{
			super();
			
			initApp();
		}
		
		private function initApp():void
		{
			Starling.current.showStatsAt(HAlign.LEFT);
			
			_firstLoading = new FirstLoading();
			addChild(_firstLoading);
			_firstLoading.x = STLConstant.StageWidth - 400 >> 1;
			_firstLoading.y = STLConstant.StageHeight - 30 >> 1;
			
			Starling.current.addEventListener("templateInited",onTemplateInited);
			Template.init();
		}
		
		private function onTemplateInited(e:Event):void
		{
			_firstLoading.progress = 0.1;// 模板加载完毕后，设置为0.1，开始加载ui
			
			loadUIAsset();
		}
		
		private function loadUIAsset():void
		{
			Assets.instance.assetMgr = new AssetManager(STLConstant.scale,STLConstant.useMipMaps);
			var am:AssetManager = Assets.instance.assetMgr;
			am.verbose = true;
			am.enqueue([AssetsUtil.getUIsDirFile()]);
			am.loadQueue(function(ratio:Number):void{
				_firstLoading.progress = ratio + 0.1;
				if(ratio == 1){
					_firstLoading.removeFromParent(true);
					_firstLoading = null;
					trace("assets ok");
					startupFacade();
				}
			});
		}
		
		private function startupFacade():void
		{
			AppFacade.instance.startUp(this);
		}
		
	}
}