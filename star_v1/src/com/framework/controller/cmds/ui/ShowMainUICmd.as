package com.framework.controller.cmds.ui
{
	import com.framework.AbstractCmd;
	import com.framework.view.ui.mainui.MainUI;
	import com.losttemple.mgr.WndMgr;
	
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