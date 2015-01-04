package com.framework.view.ui.mainui.battle
{
	import com.framework.view.ui.base.GamePanel;
	import com.framework.view.ui.mainui.comps.PlayerInfoBar;
	import com.losttemple.utils.AssetsUtil;
	
	import feathers.controls.ImageLoader;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.events.Event;
	
	public class BattlePanel extends GamePanel
	{
		private var _playerInfo:PlayerInfoBar;
		
		public function BattlePanel(w:int, h:int)
		{
			super(w, h);
		}
		
		override protected function initialize():void
		{
			var bg:ImageLoader = new ImageLoader();
			bg.addEventListener(Event.COMPLETE, onCompleteLdr);
			bg.source = AssetsUtil.getImgsUrlByName("bigpic/map.png");
			addChild(bg);
			
			_playerInfo = new PlayerInfoBar(_w, 105);
			addChild(_playerInfo);
		}
		
		private function onCompleteLdr(e:Event):void
		{
			var bg:ImageLoader = e.currentTarget as ImageLoader;
			
//			bg.x = (_w - 1800 >> 1) + 100;
//			bg.y = -600;
			
			var cloud:ImageLoader = new ImageLoader();
			cloud.addEventListener(Event.COMPLETE, onCompleteLdrCloud);
			cloud.source = AssetsUtil.getImgsUrlByName("bigpic/cloud1.png");
			addChild(cloud);
			
			function onCompleteLdrCloud(e:Event):void{
				
				var tween:Tween = new Tween(cloud, 2.0, Transitions.EASE_IN_OUT);
				tween.animate("x", cloud.x + 100);
				Starling.juggler.add(tween); 
			}
		}
	}
}