package com.framework.view.ui.base
{
	import com.losttemple.mgr.WndMgr;
	
	import flash.geom.Point;
	
	import feathers.core.FeathersControl;
	
	import lzm.starling.STLConstant;
	
	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class GameWnd extends FeathersControl
	{
		/**
		 * 表示该窗口是否可以被回收，true 为表示可以回,false表示不能回收
		 * 不能回收的窗口类,将根据系统内存情况来确定是否回收.
		 */
		protected var _canDispose:Boolean = true;
		/**
		 * 是否显示弹出缓动效果的变量设置
		 */		
		protected var _showMovie:Boolean = true;
		/**
		 * 弹出窗口的底层遮罩
		 */		
		protected var _popMask:Quad;
		/**
		 * 是否点击弹出窗口的底层遮罩时，关闭窗口
		 */		
		protected var _isClickMaskClose:Boolean = false;
		
		public var isPlayingToClose:Boolean;
		
		public function GameWnd()
		{
			super();
		}
		
		public function get canDispose():Boolean
		{
			return _canDispose;
		}
		
		public function set canDispose(val:Boolean):void
		{
			_canDispose = val;
		}
		
		public function get showMovie():Boolean {
			return _showMovie;
		}
		
		public function set showMovie(value:Boolean):void {
			_showMovie = value;
		}
		
		protected function customPopMaskFactory():Quad
		{
			var pop:Quad = new Quad(1,1,0x0);
			pop.alpha = 0.5;
			return pop;
		}
		
		/**
		 * 此方法只能在 WndMgr 中调用
		 * 显示窗体
		 * @param position	  坐标
		 * @param parent      父级显示容器
		 * @param modal       是否模态
		 * @param candispose  能否回收
		 */
		public function show(position:Point = null, parent:DisplayObjectContainer = null, modal:Boolean = true, candispose:Boolean = true):void
		{
			_canDispose = candispose;
			if (parent == null) {
				parent = WndMgr.defaultWinParent;
			}
			
			// 添加到其他组件, 判断是否需要增加modal,是否需要播放动画
			if (!parent.contains(this)) {
				if (modal) {
					if(_popMask == null)
					{
						_popMask = customPopMaskFactory();
					}
					_popMask.width = isNaN(parent.width) ? width : parent.width;
					_popMask.height = isNaN(parent.height) ? height : parent.height;
					parent.addChild(_popMask);
//					this.addEventListener(Event.REMOVED_FROM_STAGE, wndRemovedFromStageHandler);
				}
				
				parent.addChild(this);
				
				if (position)
				{
					this.x = int(position.x);
					this.y = int(position.y);
				}
				else
				{
					this.x = STLConstant.StageWidth - this.width >> 1;
					this.y = STLConstant.StageHeight - this.height >> 1;
				}
				/*
				//播放动画
				if (!_showMovie)
				{
					animateOverHande();
				} else {
					playAnimate(this);
				}
				if(_isClickMaskClose)
				{
					_popMask.addEventListener(TouchEvent.TOUCH, onTouchPopMask);
				}
				*/
			}
		}
		
		private function wndRemovedFromStageHandler(e:Event):void
		{
			
		}
		/*
		private function onTouchPopMask(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(stage);
			if(touch == null)
				return;
			if(touch.phase == TouchPhase.ENDED)
			{
				e.target.removeEventListeners(TouchEvent.TOUCH);
				fadeOutClose();
			}
		}
		
		public function animateOverHande():void
		{
			
		}
		
		protected function fadeOutClose():void
		{
			if (!showMovie) {
				hide();
			} else if (!isPlayingToClose) {
				playToClose(this);
			}
		}
		
		protected function playToClose(popUp:LiteGamePanel):void
		{
			if (popUp.width == 0 || popUp.height == 0 || popUp.parent == null) {
				popUp.hide();
				return;
			}
			if (popUp.width == popUp.parent.width || popUp.height == popUp.parent.height) {
				popUp.hide();
				return;
			}
			
			popUp.isPlayingToClose = true;
			
			Starling.juggler.removeTweens(popUp);
			var oldScaleX:Number = 0.5;
			var oldScaleY:Number = 0.5;
			var oldPivoX:Number = popUp.pivotX;
			var oldPivoY:Number = popUp.pivotY;
			
			popUp.pivotX = popUp.width >> 1;
			popUp.pivotY = popUp.height >> 1;
			popUp.x += popUp.pivotX - oldPivoX;
			popUp.y += popUp.pivotY - oldPivoY;
			
			popUp.scaleX = 1;
			popUp.scaleY = 1;
			popUp.alpha = 1;
			
			TweenManager.to(popUp, 0.4, {alpha:0, scaleX: oldScaleX, scaleY: oldScaleY, transitionFunc: Back.easeIn, onComplete: tweenComplete});
			
			function tweenComplete():void
			{
				popUp.hide();
			}
		}
		
		public function playAnimate(popUp:IPanel):void {
			if (popUp.width == 0 || popUp.height == 0 || popUp.parent == null)
				return;
			if (popUp.width == popUp.parent.width || popUp.height == popUp.parent.height)
				return;
			var oldY:Number = popUp.y;
			popUp.y += 80;
			popUp.alpha = 0;
			
			TweenManager.to(popUp, 0.4, {y: oldY, alpha: 1, transitionFunc: Back.easeOut, onComplete: tweenComplete});
			
			function tweenComplete():void
			{
				popUp.animateOverHande();
			}
			
		}
		*/
		/**
		 * 关闭窗口
		 */
		public function hide():void
		{
			isPlayingToClose = false;
			Starling.juggler.removeTweens(this);
			this.removeFromParent(canDispose);
		}
		
		override public function dispose():void
		{
			if(_popMask)
			{
//				_popMask.removeEventListener(TouchEvent.TOUCH, onTouchPopMask);
				_popMask.removeFromParent(true);
			}
			super.dispose();
		}
	}
}