package com.fw.view.ui.mainui
{
	import com.engine.utils.Scale9BatchUtil;
	import com.fw.LostFacade;
	import com.fw.view.comps.WmTabBar;
	import com.fw.view.comps.WmTabBtn;
	import com.fw.view.comps.base.GamePanel;
	import com.fw.view.comps.base.GameWnd;
	import com.fw.view.mediator.mainui.MainUIMediator;
	import com.fw.view.ui.mainui.battle.BattlePanel;
	import com.fw.view.ui.mainui.comps.PlayerInfoBar;
	import com.fw.view.ui.mainui.home.HomePanel;
	import com.fw.view.ui.mainui.soul.SoulPanel;
	import com.losttemple.assets.Assets;
	import com.losttemple.assets.themes.StyleName;
	
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

		public static const UI_BTN_BAR_HEIGHT:int = 86;
		public static const UI_PLAYER_BAR_HEIGHT:int = 100;
		
		private var _playerInfo:PlayerInfoBar;
		private var _panelContainer:Sprite;
		
		private var _homePanel:HomePanel;
		private var _soulPanel:SoulPanel;
		private var _battlePanel:BattlePanel;
		
		public function MainUI()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_panelContainer = new Sprite();
			addChild(_panelContainer);
			
			_playerInfo = new PlayerInfoBar(STLConstant.StageWidth, 105);
			addChild(_playerInfo);
			
			addChild(Scale9BatchUtil.getScale9Batch(Assets.instance.ui_tab_bg_S9Texture, STLConstant.StageWidth, 92, null, 0, STLConstant.StageHeight - 92));
			
			var tabs:Array = [];
			
			var cellWid:int = STLConstant.StageWidth / 5;
			var offestW:int = cellWid * 0.1;
			
			var homeBtn:WmTabBtn = WmTabBtn.create(StyleName.BTN_MAINUI_TAB2);
			homeBtn = WmTabBtn.create(StyleName.BTN_MAINUI_TAB2, "HOME", cellWid - offestW);
			tabs.push(homeBtn);
			
			var soulBtn:WmTabBtn = WmTabBtn.create(StyleName.BTN_MAINUI_TAB2, "SOUL", homeBtn.width);
			soulBtn.x = homeBtn.x + homeBtn.width;
			tabs.push(soulBtn);
			
			var battleBtn:WmTabBtn = WmTabBtn.create(StyleName.BTN_MAINUI_TAB2, "BATTLE", STLConstant.StageWidth - homeBtn.width * 4);
			battleBtn.x = soulBtn.x + soulBtn.width;
			tabs.push(battleBtn);
			
			var mapBtn:WmTabBtn = WmTabBtn.create(StyleName.BTN_MAINUI_TAB2, "MAP", homeBtn.width);
			mapBtn.x = battleBtn.x + battleBtn.width;
			tabs.push(mapBtn);
			
			var shopBtn:WmTabBtn = WmTabBtn.create(StyleName.BTN_MAINUI_TAB2, "SHOP", homeBtn.width);
			shopBtn.x = mapBtn.x + mapBtn.width;
			tabs.push(shopBtn);
			
			var tabbar:WmTabBar = new WmTabBar();
			tabbar.buttons = tabs;
			addChild(tabbar);
			tabbar.y = STLConstant.StageHeight - 86;
			tabbar.dataProvider = new ListCollection([HOME_WND, SOUL_WND, BATTLE_WND, MAP_WND, SHOP_WND]);
			tabbar.addEventListener(Event.CHANGE, onChangeTab);
			
			showHomePanel();
			
			LostFacade.instance.registerMediatorByType(new MainUIMediator(this));
		}
		
		protected function clearPanels(except:GamePanel = null):void
		{
			var n:int;
			if(except)
				n = 1;
			while(_panelContainer.numChildren > n)
			{
				var panel:GamePanel = _panelContainer.getChildAt(0) as GamePanel;
				if(except && except == panel)
					continue;
				else
					_panelContainer.removeChild(panel);// 此处不能dispose
			}
		}
		
		public function showHomePanel():void
		{
			if(_homePanel == null)
				_homePanel = new HomePanel(STLConstant.StageWidth, STLConstant.StageHeight - 86);
			if(!_panelContainer.contains(_homePanel))
				_panelContainer.addChild(_homePanel);
			clearPanels(_homePanel);
		}
		
		public function showSoulPanel():void
		{
			if(_soulPanel == null)
				_soulPanel = new SoulPanel(STLConstant.StageWidth, STLConstant.StageHeight - 86);
			if(!_panelContainer.contains(_soulPanel))
				_panelContainer.addChild(_soulPanel);
			clearPanels(_soulPanel);
		}
		
		public function showBattlePanel():void
		{
			if(_battlePanel == null)
				_battlePanel = new BattlePanel(STLConstant.StageWidth, STLConstant.StageHeight - 86);
			if(!_panelContainer.contains(_battlePanel))
				_panelContainer.addChild(_battlePanel);
			clearPanels(_battlePanel);
		}
		
		private function onChangeTab(e:Event):void
		{
			var idx:int = (e.currentTarget as WmTabBar).selectedIndex;
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
				case BATTLE_WND:
				{
					showBattlePanel();
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