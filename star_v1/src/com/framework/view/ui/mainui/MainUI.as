package com.framework.view.ui.mainui
{
	import com.framework.AppFacade;
	import com.framework.view.comps.LtBtn;
	import com.framework.view.mediator.mainui.MainUIMediator;
	import com.framework.view.ui.base.GameWnd;
	import com.losttemple.assets.Assets;
	import com.losttemple.assets.themes.StyleName;
	import com.losttemple.utils.AssetsUtil;
	import feathers.display.Scale3Image;
	
	import feathers.controls.ImageLoader;
	
	import lzm.starling.STLConstant;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.events.Event;
	
	public class MainUI extends GameWnd
	{
		private var _headBar:Scale3Image;
		private var _tabBgBar:Scale3Image;
		private var _homeBtn:LtBtn;
		private var _soulBtn:LtBtn;
		private var _battleBtn:LtBtn;
		private var _mapBtn:LtBtn;
		private var _shopBtn:LtBtn;
		
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
			
			_headBar = new Scale3Image(Assets.instance.ui_head_bar_bg_S3Texture);
			addChild(_headBar);
			_headBar.width = STLConstant.StageWidth;
			
			//_tabBgBar = new Scale3Image(Assets.instance.ui_tab_bg_S3Texture);
			//addChild(_tabBgBar);
			//_tabBgBar.width = STLConstant.StageWidth;
			//_tabBgBar.y = STLConstant.StageHeight - _tabBgBar.height;
			
			var cellWid:int = STLConstant.StageWidth / 5;
			var offestW:int = cellWid * 0.1;
			
			_homeBtn = LtBtn.createLtBtn(this, StyleName.BTN_MAINUI_TAB, "HOME", cellWid - offestW);
			_homeBtn.y = STLConstant.StageHeight - _homeBtn.height;
			
			_soulBtn = LtBtn.createLtBtn(this, StyleName.BTN_MAINUI_TAB, "SOUL", _homeBtn.width);
			_soulBtn.x = _homeBtn.x + _homeBtn.width;
			_soulBtn.y = _homeBtn.y;
			
			_battleBtn = LtBtn.createLtBtn(this, StyleName.BTN_MAINUI_TAB, "BATTLE", STLConstant.StageWidth - _homeBtn.width * 4);
			_battleBtn.x = _soulBtn.x + _soulBtn.width;
			_battleBtn.y = _homeBtn.y;
			
			_mapBtn = LtBtn.createLtBtn(this, StyleName.BTN_MAINUI_TAB, "MAP", _homeBtn.width);
			_mapBtn.x = _battleBtn.x + _battleBtn.width;
			_mapBtn.y = _homeBtn.y;
			
			_shopBtn = LtBtn.createLtBtn(this, StyleName.BTN_MAINUI_TAB, "SHOP", _homeBtn.width);
			_shopBtn.x = _mapBtn.x + _mapBtn.width;
			_shopBtn.y = _homeBtn.y;
			
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