package com.losttemple.assets.themes
{
	import com.framework.view.comps.LtBtn;
	import com.framework.view.comps.LtLabel;
	import com.framework.view.comps.LtTabBar;
	import com.framework.view.comps.LtTabBtn;
	import com.losttemple.assets.Assets;
	
	import flash.text.Font;
	
	import feathers.controls.ScrollBar;
	import feathers.controls.TabBar;
	import feathers.controls.ToggleButton;
	import feathers.core.DisplayListWatcher;
	import feathers.display.Scale9Image;
	import feathers.system.DeviceCapabilities;
	
	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	
	public class LosTempTheme extends DisplayListWatcher
	{
		protected static const ORIGINAL_DPI_IPHONE_RETINA:int = 326;
		protected static const ORIGINAL_DPI_IPAD_RETINA:int = 264;
		
		[Embed(source='/assets/zh_CN/fnt/FZPC-Y4.TTF',fontName='FZY4',mimeType='application/x-font',embedAsCFF='false')]
		private var FZ_FONT_CLS:Class;
		
		protected var scale:Number;
		
		protected var _scaleToDPI:Boolean;
		protected var _originalDPI:int;
		
		public function LosTempTheme(topLevelContainer:DisplayObjectContainer)
		{
			super(topLevelContainer);
		
		}
		
		public function get originalDPI():int
		{
			return DeviceCapabilities.dpi;
		}
		
		public function get scaleToDPI():Boolean
		{
			return this._scaleToDPI;
		}
		
		protected static function verticalScrollBarFactory():ScrollBar
		{
			const scrollBar:ScrollBar = new ScrollBar();
			scrollBar.direction = ScrollBar.DIRECTION_VERTICAL;
			return scrollBar;
		}
		
		protected static function horizontalScrollBarFactory():ScrollBar
		{
			const scrollBar:ScrollBar = new ScrollBar();
			scrollBar.direction = ScrollBar.DIRECTION_HORIZONTAL;
			return scrollBar;
		}
		
		protected function initScale():void
		{
			const scaledDPI:int = DeviceCapabilities.dpi / Starling.contentScaleFactor;
			if (this._scaleToDPI)
			{
				if (DeviceCapabilities.isTablet(Starling.current.nativeStage))
				{
					this._originalDPI = ORIGINAL_DPI_IPAD_RETINA;
				}
				else
				{
					this._originalDPI = ORIGINAL_DPI_IPHONE_RETINA;
				}
			}
			else
			{
				this._originalDPI = scaledDPI;
			}
			this.scale = scaledDPI / this._originalDPI;
			
		}
		
		override public function dispose():void
		{
			super.dispose();
		}
		
		public function initialize():void
		{
			initScale();
			
			Font.registerFont(FZ_FONT_CLS);
			
			// 按钮风格
			setInitializerForClass(LtBtn, ltBtnDefInit);
			setInitializerForClass(LtBtn, ltBtnMainTabInit, StyleName.BTN_MAINUI_TAB);
			setInitializerForClass(LtTabBtn, ltTabBtnMainTabInit, StyleName.BTN_MAINUI_TAB2);
			
			// 文本风格
			setInitializerForClass(LtLabel, ltLabelDefInit, StyleName.LABEL_DEF);
			
			// Tabbar风格
			setInitializerForClass(TabBar, tabDefInit, StyleName.TAB_BAR_DEF);
		}
		
		private function ltLabelDefInit(label:LtLabel):void
		{
			label.format = Assets.instance.defTextFmt;
			label.nativeFilters = [StyleValue.DROPSHADOW_BLACK];
		}
		
		private function ltTabBtnMainTabInit(btn:LtTabBtn):void
		{
			btn.defaultSkin = new Scale9Image(Assets.instance.ui_btn2_normal_S9Texture);
			btn.downSkin = new Scale9Image(Assets.instance.ui_btn2_selected_S9Texture);
			btn.defaultSelectedSkin = new Scale9Image(Assets.instance.ui_btn2_selected_S9Texture);
			btn.disabledSkin = null;
			btn.btnLabelStyle = StyleName.LABEL_DEF;
		}
		
		private function ltBtnMainTabInit(btn:LtBtn):void
		{
			btn.defaultSkin = new Scale9Image(Assets.instance.ui_btn2_normal_S9Texture);
			btn.downSkin = null
			btn.disabledSkin = null
			btn.btnLabelStyle = StyleName.LABEL_DEF;
			btn.scaleForDownSkin = true;
			//btn.labelOffsetY = -5;
		}
		
		private function ltBtnDefInit(btn:LtBtn):void
		{
			btn.defaultSkin = new Scale9Image(Assets.instance.ui_btn2_normal_S9Texture);
			btn.downSkin = null
			btn.defaultLabelProperties.textFormat = Assets.instance.defTextFmt;
			btn.scaleForDownSkin = true;
		}
		
		protected function tabDefInit(tab:TabBar):void
		{
			tab.distributeTabSizes = false;
			tab.tabFactory = function():ToggleButton
			{
				var tab:LtTabBtn = new LtTabBtn();
				tab.nameList.add(StyleName.BTN_MAINUI_TAB2);
				return tab;
			};
		}
	
	}
}