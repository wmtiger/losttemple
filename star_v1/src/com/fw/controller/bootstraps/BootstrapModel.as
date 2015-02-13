package com.fw.controller.bootstraps
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class BootstrapModel extends SimpleCommand
	{
		public function BootstrapModel()
		{
			super();
		}
		
		override public function execute(notice:INotification):void
		{
//			facade.registerProxy(new LevelProxy());
		}
	}
}