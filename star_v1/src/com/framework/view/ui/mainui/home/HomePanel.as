package com.framework.view.ui.mainui.home
{
	import com.framework.view.ui.base.GamePanel;
	import com.framework.view.ui.mainui.comps.PlayerInfoBar;
	import com.losttemple.utils.AssetsUtil;
	
	import feathers.controls.ImageLoader;
	
	import starling.events.Event;
	
	public class HomePanel extends GamePanel
	{
		private var _playerInfo:PlayerInfoBar;
		
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
			
			_playerInfo = new PlayerInfoBar(_w, 105);
			addChild(_playerInfo);
		}
		
		private function onCompleteLdr(e:Event):void
		{
			var bg:ImageLoader = e.currentTarget as ImageLoader;
			
			var s:Number = _w / 658;
			bg.width = _w;
			bg.height = 1429 * s;
			bg.y = 60;
		}
	}
}