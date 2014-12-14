package com.framework.view.ui.loading
{
	import starling.display.Quad;
	import starling.display.Sprite;
	
	public class FirstLoading extends Sprite
	{
		private var _loadingBg:Quad;
		private var _loadingBar:Quad;
		
		public function FirstLoading()
		{
			init();
		}
		
		private function init():void
		{
			_loadingBg = new Quad(400, 30, 0x666666);
			addChild(_loadingBg);
			
			_loadingBar = new Quad(390, 20, 0xffffff);
			addChild(_loadingBar);
			_loadingBar.x = _loadingBg.x + 5;
			_loadingBar.y = _loadingBg.y + 5;
			
			progress = 0.01;
		}
		
		public function set progress(v:Number):void
		{
			var w:Number = 390 * v;
			w = w > 390 ? 390 : w;
			_loadingBar.width = w;
		}
		
	}
}