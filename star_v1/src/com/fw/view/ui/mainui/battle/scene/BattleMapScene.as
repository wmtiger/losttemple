package com.fw.view.ui.mainui.battle.scene
{
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
		
	}
}