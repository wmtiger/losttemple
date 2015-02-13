package com
{
	import com.fw.LostFacade;
	import com.fw.view.ui.loading.FirstLoading;
	import com.losttemple.assets.Assets;
	import com.losttemple.assets.themes.LosTempTheme;
	import com.losttemple.mgr.GameMgr;
	import com.losttemple.templates.base.Template;
	import com.losttemple.utils.AssetsUtil;
	
	import lzm.starling.STLConstant;
	import lzm.starling.STLMainClass;
	
	import starling.core.Starling;
	import starling.events.Event;
	import starling.utils.AssetManager;
	
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
			GameMgr.assetMgr = am;
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
			// 加载完必要资源，开始初始化资源
			Assets.instance.init();
			GameMgr.themeMgr = new LosTempTheme(this);
			GameMgr.themeMgr.initialize();
			
			// 初始化游戏界面
			LostFacade.instance.startUp(this);
		}
		
	}
}