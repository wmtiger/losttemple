package com.fw.controller.bootstraps
{
	import com.fw.ActionConst;
	import com.fw.controller.cmds.action.LoginCommand;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class BootstrapCmd extends SimpleCommand
	{
		public function BootstrapCmd()
		{
			super();
		}
		
		override public function execute(notice:INotification):void
		{
			// 初始化通信接口
			facade.registerCommand(ActionConst.LOGIN, LoginCommand);
		}
	}
}