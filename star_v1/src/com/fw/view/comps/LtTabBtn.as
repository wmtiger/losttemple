package com.fw.view.comps
{
	import com.engine.utils.ResourceBundleUtil;
	import com.losttemple.assets.themes.StyleName;
	import com.losttemple.assets.themes.StyleValue;
	import com.losttemple.cfgs.AppCfg;
	
	import feathers.controls.Button;
	import feathers.controls.ToggleButton;
	
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.events.Event;
	
	public class LtTabBtn extends ToggleButton
	{
		protected var _ltLabel:LtLabel;
		protected var _btnLabelStyle:String = StyleValue.FONT_NAME_FZY4;
		
		public function LtTabBtn()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			createChildren();
		}
		
		protected function createChildren():void
		{
			initLabel();
		}
		
		override public function set isEnabled(value:Boolean):void
		{
			if (this._isEnabled == value)
			{
				return;
			}
			super.isEnabled = value;
			if (!this._isEnabled)
			{
				this.touchable = false;
				this.currentState = STATE_DISABLED;
				
				if (_ltLabel)
				{
					_ltLabel.alpha = 0.6;
				}
				if (disabledSkin == null)
				{
					var image:Image = this.defaultSkin as Image;
					if (image)
						image.color = StyleValue.STYLE_COlOR_DARK;
				}
			}
			else
			{
				//might be in another state for some reason
				//let's only change to up if needed
				if (super.currentState == STATE_DISABLED)
				{
					this.currentState = STATE_UP;
				}
				this.touchable = true;
				if (_ltLabel)
				{
					_ltLabel.alpha = 1;
					image = this.defaultSkin as Image;
					if (image)
						image.color = StyleValue.STYLE_COlOR_WHITE;
				}
			}
		}
		
		protected function initLabel():void
		{
			_ltLabel = new LtLabel();
			_ltLabel.nameList.add(_btnLabelStyle);
			addChild(_ltLabel);
			if (_isEnabled)
			{
				_ltLabel.alpha = 1;
			}
			else
			{
				_ltLabel.alpha = 0.6;
			}
			
			if (_curStr && _ltLabel && _ltLabel.text != _curStr)
			{
				label = _curStr;
			}
		}
		private var _curStr:String;
		
		override public function set label(value:String):void
		{
			_curStr = value;
			if (_ltLabel)
			{
				_ltLabel.text = _curStr;
				_ltLabel.redraw();
				if (this.actualWidth <= _ltLabel.currentWidth)
				{
					this.actualWidth = _ltLabel.currentWidth + 20;
				}
				
				if (this.actualHeight <= _ltLabel.currentHeight)
				{
					this.actualHeight = _ltLabel.currentHeight + 28;
				}
				this.invalidate(INVALIDATION_FLAG_SIZE);
			}
		}
		
		override protected function scaleSkin():void
		{
			super.scaleSkin();
			_ltLabel.x = (actualWidth - _ltLabel.currentWidth) / 2 + labelOffsetX;
			_ltLabel.y = (actualHeight - _ltLabel.currentHeight) / 2 + labelOffsetY;
		}
		
		override public function get label():String
		{
			if (_ltLabel)
			{
				return _ltLabel.text;
			}
			return null;
		}
		
		override protected function set currentState(value:String):void
		{
			// 移动设备使用,无需hover态
			if (AppCfg.RUN_TYPE != "pc" && value == Button.STATE_HOVER)
			{
				value = Button.STATE_UP;
			}
			super.currentState = value;
		}
		
		public function set btnLabelStyle(style:String):void
		{
			_btnLabelStyle = style;
			if (_ltLabel)
				_ltLabel.nameList.add(_btnLabelStyle);
		}
		
		override public function dispose():void
		{
			super.dispose();
		}
		
		/**
		 * 创建 LtTabBtn
		 * @param parentObj 父类
		 * @param styleName 文理名字
		 * @param label 按钮显示文字
		 * @return
		 */
		public static function createBtn(parent:DisplayObjectContainer, styleName:String = null,
										 label:String = "", wid:int = 100, hei:int = 86, x:Number = 0, y:Number = 0):LtTabBtn
		{
			var btn:LtTabBtn = create(styleName, label, wid, hei, x, y);
			return btn;
		}
		
		public static function create(styleName:String = null, label:String = "", wid:int = 100, hei:int = 86, x:Number = 0, y:Number = 0):LtTabBtn
		{
			var btn:LtTabBtn = new LtTabBtn();
			btn.nameList.add(styleName ? styleName : StyleName.BTN_MAINUI_TAB2);
			btn.label = label;
			btn.width = wid;
			btn.height = hei;
			btn.x = x;
			btn.y = y;
			return btn;
		}
		
		public function setLabel(value:String):LtTabBtn
		{
			this.label = value;
			return this;
		}
		
		public function setLabelRb(value:String):LtTabBtn
		{
			this.label = ResourceBundleUtil.getMessage(value);
			return this;
		}
		
		public function trigger(listener:Function):LtTabBtn
		{
			this.removeEventListeners(Event.TRIGGERED);
			this.addEventListener(Event.TRIGGERED, listener);
			return this;
		}
		
		public function setCoor(x:int, y:int):LtTabBtn
		{
			this.x = x;
			this.y = y;
			return this;
		}
		
		public function showAs(parent:DisplayObjectContainer, index:int = -1):LtTabBtn
		{
			if (index == -1)
				return parent.addChild(this) as LtTabBtn;
			else
				return parent.addChildAt(this, index) as LtTabBtn;
		}
		
	}
}