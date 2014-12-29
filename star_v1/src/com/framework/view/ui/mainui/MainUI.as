package com.framework.view.ui.mainui
{
	import com.framework.AppFacade;
	import com.framework.view.comps.LtTabBar;
	import com.framework.view.comps.LtTabBtn;
	import com.framework.view.mediator.mainui.MainUIMediator;
	import com.framework.view.ui.base.GamePanel;
	import com.framework.view.ui.base.GameWnd;
	import com.framework.view.ui.home.HomePanel;
	import com.framework.view.ui.soul.SoulPanel;
	import com.losttemple.assets.Assets;
	import com.losttemple.assets.themes.StyleName;
	import com.losttemple.utils.Scale9BatchUtil;
	
	import feathers.data.ListCollection;
	
	import lzm.starling.STLConstant;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class MainUI extends GameWnd
	{
		public static const HOME_WND:int = 0;
		public static const SOUL_WND:int = 1;
		public static const BATTLE_WND:int = 2;
		public static const MAP_WND:int = 3;
		public static const SHOP_WND:int = 4;
		
		private var _container:Sprite;
		
		private var _homePanel:HomePanel;
		private var _soulPanel:SoulPanel;
		
		public function MainUI()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_container = new Sprite();
			addChild(_container);
			
			addChild(Scale9BatchUtil.getScale9Batch(Assets.instance.ui_tab_bg_S9Texture, STLConstant.StageWidth, 92, null, 0, STLConstant.StageHeight - 92));
			
			var tabs:Array = [];
			
			var cellWid:int = STLConstant.StageWidth / 5;
			var offestW:int = cellWid * 0.1;
			
			var homeBtn:LtTabBtn = LtTabBtn.create(StyleName.BTN_MAINUI_TAB2);
			homeBtn = LtTabBtn.create(StyleName.BTN_MAINUI_TAB2, "HOME", cellWid - offestW);
			tabs.push(homeBtn);
			
			var soulBtn:LtTabBtn = LtTabBtn.create(StyleName.BTN_MAINUI_TAB2, "SOUL", homeBtn.width);
			soulBtn.x = homeBtn.x + homeBtn.width;
			tabs.push(soulBtn);
			
			var battleBtn:LtTabBtn = LtTabBtn.create(StyleName.BTN_MAINUI_TAB2, "BATTLE", STLConstant.StageWidth - homeBtn.width * 4);
			battleBtn.x = soulBtn.x + soulBtn.width;
			tabs.push(battleBtn);
			
			var mapBtn:LtTabBtn = LtTabBtn.create(StyleName.BTN_MAINUI_TAB2, "MAP", homeBtn.width);
			mapBtn.x = battleBtn.x + battleBtn.width;
			tabs.push(mapBtn);
			
			var shopBtn:LtTabBtn = LtTabBtn.create(StyleName.BTN_MAINUI_TAB2, "SHOP", homeBtn.width);
			shopBtn.x = mapBtn.x + mapBtn.width;
			tabs.push(shopBtn);
			
			var tabbar:LtTabBar = new LtTabBar();
			tabbar.buttons = tabs;
			addChild(tabbar);
			tabbar.y = STLConstant.StageHeight - 86;
			tabbar.dataProvider = new ListCollection([HOME_WND, SOUL_WND, BATTLE_WND, MAP_WND, SHOP_WND]);
			tabbar.addEventListener(Event.CHANGE, onChangeTab);
			
			showHomePanel();
			
			AppFacade.instance.registerMediatorByType(new MainUIMediator(this));
		}
		
		protected function clearPanels(except:GamePanel = null):void
		{
			var n:int;
			if(except)
				n = 1;
			while(_container.numChildren > n)
			{
				var panel:GamePanel = _container.getChildAt(0) as GamePanel;
				if(except && except == panel)
					continue;
				else
					_container.removeChild(panel);
			}
		}
		
		protected function showHomePanel():void
		{
			if(_homePanel == null)
				_homePanel = new HomePanel(STLConstant.StageWidth, STLConstant.StageHeight - 86);
			if(!_container.contains(_homePanel))
				_container.addChild(_homePanel);
			clearPanels(_homePanel);
		}
		
		protected function showSoulPanel():void
		{
			if(_soulPanel == null)
				_soulPanel = new SoulPanel(STLConstant.StageWidth, STLConstant.StageHeight - 86);
			if(!_container.contains(_soulPanel))
				_container.addChild(_soulPanel);
			clearPanels(_soulPanel);
		}
		
		private function onChangeTab(e:Event):void
		{
			var idx:int = (e.currentTarget as LtTabBar).selectedIndex;
			switch(idx)
			{
				case HOME_WND:
				{
					showHomePanel();
					break;
				}
				case SOUL_WND:
				{
					showSoulPanel();
					break;
				}
					
				default:
				{
					break;
				}
			}
		}
		
	}
}