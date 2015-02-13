package com.fw.view.mediator.mainui
{
	import com.fw.AbstractMediator;
	import com.fw.view.ui.mainui.MainUI;
	
	import com.engine.utils.Map;
	
	public class MainUIMediator extends AbstractMediator
	{
		public function MainUIMediator(viewComponent:Object)
		{
			super(viewComponent);
		}
		
		private function get view():MainUI
		{
			return viewComponent as MainUI;
		}
		
		override protected function listNotificationListeners(listeners:Map):void
		{
//			listeners.putValue(MediatorConstants.DOCK_FLUSH_WND, onFlushDockWnd);
//			listeners.putValue(MediatorConstants.DOCK_TUOGUAN, onFlushDockTuoguan);
//			listeners.putValue(MediatorConstants.DOCK_FLUSH_READY, onFlushDockReadyWnd);
		}
	}
}