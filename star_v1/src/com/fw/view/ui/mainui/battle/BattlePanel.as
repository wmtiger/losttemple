package com.fw.view.ui.mainui.battle
{
	import com.fw.view.comps.base.GamePanel;
	import com.fw.view.ui.mainui.battle.scene.BattleMapScene;
	import com.losttemple.utils.AssetsUtil;
	
	public class BattlePanel extends GamePanel
	{
		private var _mapScene:BattleMapScene;
		
		public function BattlePanel(w:int, h:int)
		{
			super(w, h);
		}
		
		override protected function initialize():void
		{
			
			_mapScene = new BattleMapScene();
			addChild(_mapScene);
			_mapScene.drawBg(AssetsUtil.getImgsUrlByName("bigpic/map2.jpg"));
			_mapScene.scale = 0.6;
		}
		
	}
}