package com.fw.view.ui.battlegateinfo
{
	import com.engine.utils.QbUtil;
	import com.engine.utils.Scale9BatchUtil;
	import com.fw.view.comps.WmBtn;
	import com.fw.view.comps.base.GameWnd;
	import com.losttemple.assets.Assets;
	import com.losttemple.assets.themes.StyleName;
	
	import lzm.starling.STLConstant;
	
	import starling.display.QuadBatch;
	
	public class BattleGateInfoWnd extends GameWnd
	{
		private var _backBtn:WmBtn;
		
		public function BattleGateInfoWnd()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_backBtn = WmBtn.createBtn(this, StyleName.BTN_WND_BACK,"BACK",120,82,5,100, onBackFun);
			
			var qb:QuadBatch = new QuadBatch();
			addChild(qb);
			Scale9BatchUtil.getScale9Batch(Assets.instance.ui_info_bg_S9Texture, 320, 440, qb, STLConstant.StageWidth - 320, 240);
			Scale9BatchUtil.getScale9Batch(Assets.instance.ui_battle_stage_info_bg_S9Texture, 280, 122, qb, STLConstant.StageWidth - 300, 260);
//			QbUtil.addTexture(Assets.instance.ui_battle_stage_info_bg_Texture,STLConstant.StageWidth - 300, 260, qb);
		}
		
		private function onBackFun():void
		{
			close();
		}
	}
}