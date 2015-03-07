package com.fw.view.ui.battlegateinfo
{
	import com.fw.view.comps.WmBtn;
	import com.fw.view.comps.base.GameWnd;
	import com.losttemple.assets.themes.StyleName;
	
	public class BattleGateInfoWnd extends GameWnd
	{
		private var _backBtn:WmBtn;
		
		public function BattleGateInfoWnd()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_backBtn = WmBtn.createBtn(this, StyleName.BTN_WND_BACK,"BACK",120,82,10,120);
		}
	}
}