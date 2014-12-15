package com.framework.view.ui.base
{
	import flash.geom.Point;
	
	import feathers.core.IFeathersControl;
	
	import starling.display.DisplayObjectContainer;

	public interface IGameWnd extends IFeathersControl
	{
		/*窗口的状态*/
		function set windowState(value:String):void;
		function get windowState():String;
		
		/*窗口的类型*/
		function set windowType(value:int):void;
		function get windowType():int;
		
		/*窗口的标题*/		
		function set title(value:String):void;
		function get title():String;
		
		/**
		 * 显示 
		 * @param position
		 * @param parent
		 */		
		function show(position:Point=null,parent:DisplayObjectContainer=null, modal:Boolean = true, candispose:Boolean = true):void;
		
		/**
		 * 关闭
		 */
		function hide():void;
		
		/**
		 * 是否可以回收
		 * @return 
		 */
		function get canDispose():Boolean;
		
		function get showMovie():Boolean;
		
		function set showMovie(value:Boolean):void;
		
		/**
		 * 初始化的动画类
		 */
		function animateOverHandle():void;
	}
}