package com.framework.view.ui.mainui
{
	import com.framework.AppFacade;
	import com.framework.view.comps.LtTabBtn;
	import com.framework.view.ctrl.LtTabBarCtrl;
	import com.framework.view.mediator.mainui.MainUIMediator;
	import com.framework.view.ui.base.GameWnd;
	import com.losttemple.assets.Assets;
	import com.losttemple.assets.themes.StyleName;
	import com.losttemple.utils.AssetsUtil;
	import com.losttemple.utils.Scale9BatchUtil;
	
	import feathers.controls.ImageLoader;
	import feathers.controls.TabBar;
	import feathers.data.ListCollection;
	
	import lzm.starling.STLConstant;
	
	import starling.display.QuadBatch;
	import starling.events.Event;
	
	public class MainUI extends GameWnd
	{
		private var _homeBtn:LtTabBtn;
		private var _soulBtn:LtTabBtn;
		private var _battleBtn:LtTabBtn;
		private var _mapBtn:LtTabBtn;
		private var _shopBtn:LtTabBtn;
		
		public function MainUI()
		{
			super();
		}
		
		override protected function initialize():void
		{
			var bg:ImageLoader = new ImageLoader();
			bg.addEventListener(Event.COMPLETE, onCompleteLdr);
			bg.source = AssetsUtil.getImgsUrlByName("bigpic/aa.jpg");
			addChild(bg);
			
			var qb:QuadBatch = new QuadBatch();
			addChild(qb);
			Scale9BatchUtil.getScale9Batch(Assets.instance.ui_head_bar_bg_S9Texture, STLConstant.StageWidth, 105, qb);
			Scale9BatchUtil.getScale9Batch(Assets.instance.ui_tab_bg_S9Texture, STLConstant.StageWidth, 92, qb, 0, STLConstant.StageHeight - 92);
			
//			_mainTabBarCtrl = new LtTabBarCtrl();
			var tabbar:TabBar = new TabBar();
			tabbar.nameList.add(StyleName.TAB_BAR_DEF);
			addChild(tabbar);
			tabbar.y = STLConstant.StageHeight - 86;
			tabbar.dataProvider = new ListCollection(["HOME", "SOUL"]);
			
//			var tabs:Array = [];
			
//			var cellWid:int = STLConstant.StageWidth / 5;
//			var offestW:int = cellWid * 0.1;
			
//			_homeBtn = LtTabBtn.create(StyleName.BTN_MAINUI_TAB2);
//			_homeBtn = LtTabBtn.createBtn(this, StyleName.BTN_MAINUI_TAB2, "HOME", cellWid - offestW);
//			_homeBtn.y = STLConstant.StageHeight - _homeBtn.height;
//			tabs.push(_homeBtn);
			
//			_soulBtn = LtTabBtn.createBtn(this, StyleName.BTN_MAINUI_TAB2, "SOUL", _homeBtn.width);
//			_soulBtn.x = _homeBtn.x + _homeBtn.width;
//			_soulBtn.y = _homeBtn.y;
//			tabs.push(_soulBtn);
//			
//			_battleBtn = LtTabBtn.createBtn(this, StyleName.BTN_MAINUI_TAB2, "BATTLE", STLConstant.StageWidth - _homeBtn.width * 4);
//			_battleBtn.x = _soulBtn.x + _soulBtn.width;
//			_battleBtn.y = _homeBtn.y;
//			tabs.push(_battleBtn);
//			
//			_mapBtn = LtTabBtn.createBtn(this, StyleName.BTN_MAINUI_TAB2, "MAP", _homeBtn.width);
//			_mapBtn.x = _battleBtn.x + _battleBtn.width;
//			_mapBtn.y = _homeBtn.y;
//			tabs.push(_mapBtn);
//			
//			_shopBtn = LtTabBtn.createBtn(this, StyleName.BTN_MAINUI_TAB2, "SHOP", _homeBtn.width);
//			_shopBtn.x = _mapBtn.x + _mapBtn.width;
//			_shopBtn.y = _homeBtn.y;
//			tabs.push(_shopBtn);
			
//			tabbar.dataProvider = new ListCollection(tabs);
			
//			_mainTabBarCtrl.tabBtnList = tabs;
//			_mainTabBarCtrl.crtSelectedIndex = 0;
			
			AppFacade.instance.registerMediatorByType(new MainUIMediator(this));
		}
		
		private function onCompleteLdr(e:Event):void
		{
			var bg:ImageLoader = e.currentTarget as ImageLoader;
			
			var s:Number = STLConstant.StageWidth / 658;
			bg.width = STLConstant.StageWidth;
			bg.height = 1429 * s;
			bg.y = 60;
		}
	}
}