package com.fw.view.ui.mainui.battle.scene
{
	import com.engine.utils.QbUtil;
	import com.fw.view.comps.ClickQuadBatch;
	import com.losttemple.assets.Assets;
	
	public class BattleGateBtn extends ClickQuadBatch
	{
		public function BattleGateBtn()
		{
			super();
			init();
		}
		
		private function init():void
		{
			QbUtil.addTexture(Assets.instance.assetMgr.getTexture("ui_battle_gate_bg"),0,0,this);
			
			this.btnState = true;
		}
	}
}