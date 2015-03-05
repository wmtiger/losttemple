package com.fw.view.ui.mainui.battle
{
	import com.fw.view.comps.base.GamePanel;
	import com.fw.view.ui.mainui.battle.scene.BattleMapScene;
	import com.fw.view.ui.mainui.battle.scene.CloudLayer;
	import com.losttemple.utils.AssetsUtil;
	
	import starling.display.Sprite;
	
	public class BattlePanel extends GamePanel implements IBattleCloud
	{
		private var _mapScene:BattleMapScene;
		private var _stageBtnLayer:Sprite;
		private var _cloudLayer:CloudLayer;
		
		public function BattlePanel(w:int, h:int)
		{
			super(w, h);
		}
		
		override protected function initialize():void
		{
			_mapScene = new BattleMapScene(this);
			addChild(_mapScene);
			_mapScene.drawBg(AssetsUtil.getImgsUrlByName("bigpic/map2.jpg"));
			_mapScene.scale = 0.6;
			
			_cloudLayer = new CloudLayer(_mapScene.maxwidth, _mapScene.maxheight);
			addChild(_cloudLayer);
			updateCloudLayer();
		}
		
		public function updateCloudLayer():void
		{
			if(_cloudLayer == null)
				return;
			_cloudLayer.scaleX = _cloudLayer.scaleY = _mapScene.scale;
			_cloudLayer.x = _mapScene.x;
			_cloudLayer.y = _mapScene.y;
		}
		
	}
}