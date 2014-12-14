package com.losttemple.cfgs
{
	public class AppCfg
	{
		public function AppCfg()
		{
		}
		
		/**
		 * RUN_TYPE 默认是pc，因为在pc上调试，发布的时候，在编译参数中改为ios或者and，这里是为了获取对应资源用的
		 */		
		public static const RUN_TYPE:String = CONFIG::runtype + "";
	}
}