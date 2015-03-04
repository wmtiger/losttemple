package com.fw.view.ui.mainui.battle.scene
{
	import com.fw.view.comps.scalescene.BaseScaleScene;
	import com.fw.view.ui.mainui.MainUI;
	
	import feathers.controls.ImageLoader;

	public class BattleMapScene extends BaseScaleScene
	{
		
		public function BattleMapScene()
		{
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
		
		public function drawBg(src:String):void
		{
			var bg:ImageLoader = new ImageLoader();
			bg.source = src;
			addChild(bg);
			showAtPoint((stage.stageWidth-maxwidth*scaleX) * 0.43, (stage.stageHeight-maxheight*scaleY) * 0.4);
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
			var gamewidth:Number = viewWidth;
			var gameheight:Number = viewHeight;
			if(maxwidth*scaleX<gamewidth)
				x = (gamewidth-maxwidth*scaleX)*.5
			else if(x>0)
				x = 0;
			else if(x<gamewidth-maxwidth*scaleX)
				x = gamewidth-maxwidth*scaleX;
			
			trace('==',y,_viewRect.y);
			if(y > _viewRect.y)
			{
				y = _viewRect.y;
			}
			if(y < (_viewRect.y + _viewRect.height) - maxheight*scaleX)
			{
				y = (_viewRect.y + _viewRect.height) - maxheight*scaleX;
			}
			trace(y, (_viewRect.y + _viewRect.height) - maxheight*scaleX);
//			if(maxheight*scaleX<gameheight)
//			if(maxheight*scaleX<(_viewRect.y + _viewRect.height))
//			{
//				trace("aaaa");
//				y = (playerH + gameheight-maxheight*scaleX)*.5
//			}
//			else if(y>_viewRect.y)
//			{
//				trace("bbb");
//				y =  _viewRect.y;
//			}
//			else if(y<(_viewRect.y + _viewRect.height)-maxheight*scaleX)
//			{
//				trace("ccc");
//				y = (_viewRect.y + _viewRect.height)-maxheight*scaleX - tabH;
//			}
			
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