package com.fw.controller.cmds.ui
{
	import com.fw.AbstractCmd;
	import com.fw.mgr.WndMgr;
	import com.fw.view.ui.mainui.MainUI;
	
	import org.puremvc.as3.interfaces.INotification;
	
	public class ShowMainUICmd extends AbstractCmd
	{
		public function ShowMainUICmd()
		{
			super();
		}
		
		override public function execute(notice:INotification):void
		{
			WndMgr.intstance.showWindow(MainUI);
		}
	}
}