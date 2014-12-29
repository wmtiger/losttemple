package com.framework.view.ui.home
{
	import com.framework.view.ui.base.GamePanel;
	import com.losttemple.assets.Assets;
	import com.losttemple.utils.AssetsUtil;
	import com.losttemple.utils.Scale9BatchUtil;
	
	import feathers.controls.ImageLoader;
	
	import lzm.starling.STLConstant;
	
	import starling.events.Event;
	
	public class HomePanel extends GamePanel
	{
		public function HomePanel(w:int, h:int)
		{
			super(w, h);
		}
		
		override protected function initialize():void
		{
			var bg:ImageLoader = new ImageLoader();
			bg.addEventListener(Event.COMPLETE, onCompleteLdr);
			bg.source = AssetsUtil.getImgsUrlByName("bigpic/aa.jpg");
			addChild(bg);
			
			addChild(Scale9BatchUtil.getScale9Batch(Assets.instance.ui_head_bar_bg_S9Texture, STLConstant.StageWidth, 105));
			
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