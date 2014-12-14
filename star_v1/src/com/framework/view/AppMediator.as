package com.framework.view
{
	import com.GameMainClass;
	import com.framework.AbstractMediator;
	
	import starling.display.DisplayObjectContainer;
	
	import com.framework.utils.Map;
	
	public class AppMediator extends AbstractMediator
	{
		private static const NAME:String = "AppMediator";
		
		private var _rootView:GameMainClass;
		
		public function AppMediator(initViewComponent:DisplayObjectContainer)
		{
			super(NAME);
			this._rootView = initViewComponent as GameMainClass;
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
			
		}
	}
}