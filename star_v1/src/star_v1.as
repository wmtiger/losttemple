package
{
	import com.star.StarMainClass;
	
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import lzm.starling.STLStarup;
	
	/**
	 * App一打开，就会读取编译参数，并且在AppCfg类中设置App的全局参数
	 * @author rum
	 * 
	 */	
	public class star_v1 extends STLStarup
	{
		public function star_v1()
		{
			super();
			
			// 支持 autoOrient
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.color = 0x333333;
			stage.frameRate = 60;
			
			initStarling(StarMainClass,480,true);
		}
		
	}
}