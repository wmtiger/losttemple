package com.losttemple.mgr
{
	import flash.geom.Point;
	
	import starling.display.DisplayObjectContainer;

	public class WndMgr
	{
		private static var _intstance:WndMgr;
		
		public function WndMgr()
		{
		}

		public static function get intstance():WndMgr
		{
			if(_intstance == null)
				_intstance = new WndMgr();
			return _intstance;
		}
		
		/**
		 * 关闭窗口
		 * 内部调用,外部请使用hideWindow
		 */
		public static function closeWindow(window:ILiteWindow):void
		{
			instance.closeWindow(window);
		}
		
		/**
		 * 关闭窗口
		 */
		public static function hideWindowByType(cls:Class):void {
			if (isOpenByWindowType(cls)) {
				getWindow(cls).hide();
			}
		}
		
		/**
		 * 关闭所有窗口
		 */
		public static function hideAllWindows(exceptWindow:Class = null):void {
			instance.hideAllWindows(exceptWindow);
		}
		
		public static function set defaultWinParent(value:DisplayObjectContainer):void {
			instance.defaltWindowParent = value;
		}
		
		public static function get defaultWinParent():DisplayObjectContainer {
			return instance.defaltWindowParent;
		}
		
		/**
		 * 显示窗口
		 * @param window
		 *
		 */
		public static function showWindow(cls:Class, position:Point = null, parent:DisplayObjectContainer = null, modal:Boolean = true
										  , candispose:Boolean = true, fullScreen:Boolean = false, windowType:int = -1, isSingleton:Boolean = false, showMovie:Object = null):ILiteWindow
		{
			isCreateWindow = true;
			var window:ILiteWindow = instance.showWindow(cls, position, parent, modal, candispose, fullScreen, windowType, isSingleton, showMovie);
			isCreateWindow = false;
			return window;
		}
		
		/**
		 * 获取窗体的实例 为了防止窗口在其它地方进行实例化
		 * @param cls
		 * @return
		 */
		public static function getWindow(cls:Class):ILiteWindow
		{
			isCreateWindow = true;
			var window:ILiteWindow = instance.getWindow(cls);
			isCreateWindow = false;
			return window;
		}
		
		/**
		 * 检察某类型的窗口是否是开启状态
		 * @param typeCls
		 * @return
		 */
		public static function isOpenByWindowType(typeCls:Class):ILiteWindow
		{
			return instance.isOpenByWindowType(typeCls);
		}
		
		public static function removeCacheWindow():void
		{
			return instance.removeCacheWindow();
		}
		
		public static function isExist(_cls:Class):Boolean
		{
			return instance.isExist(_cls);
		}
		/**
		 * 
		 * @param value 窗口visable
		 * @param withoutWnd 不生效窗口
		 * 
		 */	
		public static function setAllWindowsVisable(value:Boolean,withoutWnd:ILiteWindow=null):void
		{
			instance.setAllWindowsVisable(value,withoutWnd)
		}

	}
}