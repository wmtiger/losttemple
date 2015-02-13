package com.fw.controller.bootstraps
{
	import com.GameMainClass;
	import com.fw.MediatorConst;
	import com.fw.view.AppMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class BootstrapViewMediator extends SimpleCommand
	{
		public function BootstrapViewMediator()
		{
			super();
		}
		
		override public function execute(notice:INotification):void
		{
			//游戏主舞台
			
//			var appStage:LinkUpGame = notice.getBody() as LinkUpGame;
			facade.registerMediator(new AppMediator(notice.getBody() as GameMainClass));
			//
			//sendNotification(ApplicationConstants.REQUEST_LOGIN, reqLogin);
			sendNotification(MediatorConst.SHOW_MAIN_UI);
			
		}
	}
}