package com
{
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import lzm.starling.STLStarup;
	
	public class MainStartup extends STLStarup
	{
		public function MainStartup()
		{
			super();
			
			// 支持 autoOrient
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.color = 0x333333;
			stage.frameRate = 60;
			
			initStarling(GameMainClass,480,true);
		}
	}
}