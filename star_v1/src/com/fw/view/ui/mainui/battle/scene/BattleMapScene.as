package com.fw.view.ui.mainui.battle.scene
{
	import com.fw.view.ui.mainui.MainUI;
	
	import feathers.controls.ImageLoader;

	public class BattleMapScene extends BaseScaleScene
	{
		
		public function BattleMapScene()
		{
			maxwidth=1800;
			maxheight=1871;
			super();
		}
		
		override protected function setScenePosition():void
		{
			
		}
		
		override public function get viewHeight():Number
		{
			return stage.stageHeight - MainUI.UI_BTN_BAR_HEIGHT - MainUI.UI_PLAYER_BAR_HEIGHT;
		}
		
		public function drawBg(src:String):void
		{
			var bg:ImageLoader = new ImageLoader();
			bg.source = src;
			addChild(bg);
			showAtPoint((stage.stageWidth-maxwidth*scaleX) * 0.43, (stage.stageHeight-maxheight*scaleY) * 0.4);
		}
		
	}
}