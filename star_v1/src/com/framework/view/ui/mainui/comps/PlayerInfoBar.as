package com.framework.view.ui.mainui.comps
{
	import com.losttemple.assets.Assets;
	import com.losttemple.utils.Scale9BatchUtil;
	
	import feathers.core.FeathersControl;
	
	public class PlayerInfoBar extends FeathersControl
	{
		private var _w:Number;
		private var _h:Number;
		
		public function PlayerInfoBar(w:Number, h:Number = 105)
		{
			_w = w;
			_h = h;
			super();
		}
		
		override protected function initialize():void
		{
			addChild(Scale9BatchUtil.getScale9Batch(Assets.instance.ui_head_bar_bg_S9Texture, _w, _h));
		}
	}
}