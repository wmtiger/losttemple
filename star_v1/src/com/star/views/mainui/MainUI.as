package com.star.views.mainui
{
	import com.star.assets.Assets;
	
	import feathers.core.FeathersControl;
	
	import starling.display.Image;
	
	public class MainUI extends FeathersControl
	{
		private var _headBar:Image;
		
		public function MainUI()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_headBar = new Image(Assets.instance.assetMgr.getTexture("ui_head_bar"));
			addChild(_headBar);
		}
	}
}