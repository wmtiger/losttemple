package com.losttemple.assets.themes
{
	import com.framework.view.comps.LtBtn;
	import com.framework.view.comps.LtLabel;
	import com.gameabc.sanguo.core.Global;
	import com.losttemple.assets.Assets;
	import feathers.controls.TabBar;
	
	import flash.text.Font;
	
	import assets.assetProxy.UIAsset;
	
	import feathers.controls.ScrollBar;
	import feathers.core.DisplayListWatcher;
	import feathers.display.Scale3Image;
	import feathers.system.DeviceCapabilities;
	
	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	import starling.textures.TextureSmoothing;
	
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
		
		override public function dispose():void
		{
			super.dispose();
		}
		
		public function initialize():void
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
			
			Font.registerFont(FZ_FONT_CLS);
			
			// 按钮风格
			setInitializerForClass(LtBtn, ltBtnDefInit);
			setInitializerForClass(LtBtn, ltBtnMainTabInit, StyleName.BTN_MAINUI_TAB);
			
			// 文本风格
			setInitializerForClass(LtLabel, ltLabelDefInit, StyleName.LABEL_DEF);
			
			// Tabbar风格
			setInitializerForClass(TabBar, mainUITabInit, StyleName.TAB_BAR_EQUIP);
		}
		
		private function ltLabelDefInit(label:LtLabel):void
		{
			label.format = Assets.instance.defTextFmt;
			label.nativeFilters = [StyleValue.DROPSHADOW_BLACK];
		}
		
		private function ltBtnMainTabInit(btn:LtBtn):void
		{
			btn.defaultSkin = new Scale3Image(Assets.instance.ui_btn2_normal_S3Texture);
			btn.downSkin = null
			btn.disabledSkin = null
			btn.btnLabelStyle = StyleName.LABEL_DEF;
			btn.scaleForDownSkin = true;
			//btn.labelOffsetY = -5;
		}
		
		private function ltBtnDefInit(btn:LtBtn):void
		{
			btn.defaultSkin = new Scale3Image(Assets.instance.ui_btn2_normal_S3Texture);
			btn.downSkin = null
//			btn.disabledSkin = new Image(UIAsset.getInstance().fightBtnNormal);
			btn.defaultLabelProperties.textFormat = Assets.instance.defTextFmt;
//			btn.defaultLabelProperties.smoothing = TextureSmoothing.BILINEAR;
			btn.scaleForDownSkin = true;
		}
		
		protected function equipWinTabbarInitializer(tab:TabBar):void
		{
			tab.distributeTabSizes = false
			tab.tabFactory = function():LtBtn
			{
				const skinSelector:ImageStateValueSelector = new ImageStateValueSelector();
				skinSelector.defaultValue = MainManager.assets.getTexture("tab_hero_normal");
				skinSelector.defaultSelectedValue = MainManager.assets.getTexture("tab_hero_select");
				var button:SgButton = new SgButton();
				button.labelOffsetY = 8;
				button.sgLabelStyle = StyleName.EQUIP_WIN_BUTTON_BIG;
				button.stateToSkinFunction = skinSelector.updateValue;
				return button;
			}
		}
	
	}
}