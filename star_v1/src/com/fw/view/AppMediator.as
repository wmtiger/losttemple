package com.fw.view
{
	import com.GameMainClass;
	import com.engine.utils.Map;
	import com.fw.AbstractMediator;
	import com.fw.MediatorConst;
	import com.fw.controller.cmds.ui.ShowMainUICmd;
	import com.fw.mgr.WndMgr;
	
	import starling.display.DisplayObjectContainer;
	
	public class AppMediator extends AbstractMediator
	{
		private static const NAME:String = "AppMediator";
		
		private var _rootView:GameMainClass;
		
		public function AppMediator(initViewComponent:DisplayObjectContainer)
		{
			super(NAME);
			this._rootView = initViewComponent as GameMainClass;
			WndMgr.defaultWinParent = this._rootView;
		}
		
		override public function onRegister():void
		{
		}
		
		override public function onRemove():void
		{
		}
		
		override protected function listNotificationListeners(listeners:Map):void
		{
			super.listNotificationListeners(listeners);
			appFacade.registerCommand(MediatorConst.SHOW_MAIN_UI, ShowMainUICmd);
		}
	}
}