package com.fw.controller.bootstraps
{
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class BootstrapModel
	{
		public function BootstrapModel()
		{
			super();
		}
		
		protected static function get facade():IFacade
		{
			return Facade.getInstance();
		}
		
		public static function initCmd():void
		{
			//			facade.registerProxy(new LevelProxy());
		}
	}
}