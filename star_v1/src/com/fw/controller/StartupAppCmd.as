package com.fw.controller
{
	import com.fw.controller.bootstraps.BootstrapCmd;
	import com.fw.controller.bootstraps.BootstrapModel;
	import com.fw.controller.bootstraps.BootstrapViewMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import starling.display.DisplayObjectContainer;
	
	public class StartupAppCmd extends SimpleCommand
	{
		public function StartupAppCmd()
		{
			super();
		}
		
		override public function execute( notification:INotification ) : void
		{
			BootstrapCmd.initCmd();
			BootstrapModel.initCmd();
			BootstrapViewMediator.initCmd(notification.getBody() as DisplayObjectContainer);
		}
	}
}