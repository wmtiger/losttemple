package com.framework.controller.bootstraps
{
	import com.framework.ActionConst;
	import com.framework.controller.cmds.action.LoginCommand;
	
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