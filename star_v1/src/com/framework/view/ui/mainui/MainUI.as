package com.framework.view.ui.mainui
{
	import com.framework.AppFacade;
	import com.framework.view.mediator.mainui.MainUIMediator;
	import com.framework.view.ui.base.GameWnd;
	import com.losttemple.assets.Assets;
	import com.losttemple.utils.AssetsUtil;
	
	import feathers.controls.ImageLoader;
	
	import lzm.starling.STLConstant;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.events.Event;
	
	public class MainUI extends GameWnd
	{
		private var _headBar:Image;
		private var _homeBtn:Button;
		private var _cardBtn:Button;
		private var _battleBtn:Button;
		private var _summonBtn:Button;
		private var _shopBtn:Button;
		
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
			
			_headBar = new Image(Assets.instance.assetMgr.getTexture("ui_head_bar_bg"));
			addChild(_headBar);
			
			_homeBtn = new Button(Assets.instance.assetMgr.getTexture("ui_btn2_normal"),"HOME",Assets.instance.assetMgr.getTexture("ui_btn2_selected"));
			addChild(_homeBtn);
			_homeBtn.y = STLConstant.StageHeight - _homeBtn.height;
			
			_cardBtn = new Button(Assets.instance.assetMgr.getTexture("ui_btn2_normal"),"CARD",Assets.instance.assetMgr.getTexture("ui_btn2_selected"));
			addChild(_cardBtn);
			_cardBtn.x = _homeBtn.x + _homeBtn.width;
			_cardBtn.y = _homeBtn.y;
			
			_summonBtn = new Button(Assets.instance.assetMgr.getTexture("ui_btn2_normal"),"SUMMON",Assets.instance.assetMgr.getTexture("ui_btn2_selected"));
			addChild(_summonBtn);
			_summonBtn.x = STLConstant.StageWidth - _summonBtn.width * 2;
			_summonBtn.y = _homeBtn.y;
			
			_shopBtn = new Button(Assets.instance.assetMgr.getTexture("ui_btn2_normal"),"SHOP",Assets.instance.assetMgr.getTexture("ui_btn2_selected"));
			addChild(_shopBtn);
			_shopBtn.x = STLConstant.StageWidth - _shopBtn.width;
			_shopBtn.y = _homeBtn.y;
			
			_battleBtn = new Button(Assets.instance.assetMgr.getTexture("ui_btn2_normal"),"BATTLE",Assets.instance.assetMgr.getTexture("ui_btn2_selected"));
			addChild(_battleBtn);
			_battleBtn.width = STLConstant.StageWidth - _homeBtn.width * 4;
			_battleBtn.x = _cardBtn.x + _cardBtn.width;
			_battleBtn.y = _homeBtn.y;
			
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