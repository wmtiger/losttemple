package com.fw.view.ui.mainui.battle.scene
{
	import com.fw.view.comps.scalescene.BaseScaleScene;
	import com.fw.view.ui.mainui.MainUI;
	import com.fw.view.ui.mainui.battle.IBattleCloud;
	
	import feathers.controls.ImageLoader;
	
	import starling.events.Event;

	public class BattleMapScene extends BaseScaleScene
	{
		private var _battleCloud:IBattleCloud;
		
		public function BattleMapScene(battleCloud:IBattleCloud)
		{
			_battleCloud = battleCloud;
			super();
		}
		
		override public function get maxheight():int
		{
			return 1871;
		}
		
		override public function get maxwidth():int
		{
			return 1800;
		}
		
		override protected function setScenePosition():void
		{
			// 不需要这个，把这个覆盖为空
		}
		
		public function drawBg(src:String, cb:Function = null):void
		{
			var bg:ImageLoader = new ImageLoader();
			bg.source = src;
			bg.addEventListener(Event.COMPLETE, onLoaded);
			addChild(bg);
			showAtPoint((stage.stageWidth-maxwidth*scaleX) * 0.45, (stage.stageHeight-maxheight*scaleY) * 0.62);
			
			function onLoaded():void
			{
				cb && cb.call();
			}
		}
		
		override protected function setViewRect():void
		{
			_viewRect.x = 0;
			_viewRect.y = playerH;
			_viewRect.width = stage.stageWidth;
			_viewRect.height = stage.stageHeight - playerH - tabH;
		}
		
		override protected function checkXY(checkComplete:Boolean = true):void
		{
			if(x > _viewRect.x)
			{
				x = _viewRect.x;
			}
			if(x < (_viewRect.x + _viewRect.width) - maxwidth*scaleX)
			{
				x = (_viewRect.x + _viewRect.width) - maxwidth*scaleX;
			}
			
			if(y > _viewRect.y)
			{
				y = _viewRect.y;
			}
			if(y < (_viewRect.y + _viewRect.height) - maxheight*scaleX)
			{
				y = (_viewRect.y + _viewRect.height) - maxheight*scaleX;
			}
			
			_battleCloud.updateCloudLayer();
			
			if(checkComplete)
				moveComplete();
			
		}
		
		protected function get playerH():int
		{
			return MainUI.UI_PLAYER_BAR_HEIGHT - 20;
		}
		
		protected function get tabH():int
		{
			return MainUI.UI_BTN_BAR_HEIGHT - 10;
		}
		
	}
}