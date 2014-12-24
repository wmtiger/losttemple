package com.losttemple.assets.themes
{
	import com.framework.view.comps.LtBtn;
	import flash.text.Font;
	
	import feathers.controls.ScrollBar;
	import feathers.core.DisplayListWatcher;
	import feathers.system.DeviceCapabilities;
	
	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	
	public class LosTempTheme extends DisplayListWatcher
	{
		protected static const ORIGINAL_DPI_IPHONE_RETINA:int = 326;
		protected static const ORIGINAL_DPI_IPAD_RETINA:int = 264;
		
		[Embed(source='/assets/zh_CN/fnt/FZPC-Y4.TTF',
				fontName='FZY4',
				mimeType='application/x-font',
				embedAsCFF='false'
			)]
		private var FZ_FONT_CLS:Class;
		
		protected var scale:Number;
		
		protected var _scaleToDPI:Boolean;
		protected var _originalDPI:int;
		
		public function LosTempTheme(topLevelContainer:DisplayObjectContainer)
		{
			super(topLevelContainer);
			this.initialize();
		}
		
		public function get originalDPI():int
		{
			return DeviceCapabilities.dpi;
		}
		
		public function get scaleToDPI():Boolean
		{
			return this._scaleToDPI;
		}
		
		protected function initialize():void
		{
			const scaledDPI:int = DeviceCapabilities.dpi / Starling.contentScaleFactor;
			if(this._scaleToDPI)
			{
				if(DeviceCapabilities.isTablet(Starling.current.nativeStage))
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
			
			this.setInitializerForClassAndSubclasses(LtBtn, ltBtnDefInit);
		}
		
		private function ltBtnDefInit(btn:LtBtn):void
		{
			btn.defaultSkin = new Scale9Image(UIAsset.getInstance().liteButtonNormalSkinTextures);
			btn.downSkin = null
			btn.disabledSkin = new Scale9Image(UIAsset.getInstance().liteButtonDisableSkinTextures);
//			btn.disabledSkin = new Image(UIAsset.getInstance().fightBtnNormal);
			btn.defaultLabelProperties.textFormat = UIAsset.getInstance().hkButtonBigFormatYellow;
			btn.defaultLabelProperties.smoothing = TextureSmoothing.BILINEAR;
			btn.scaleForDownSkin = true;
//			btn.width = 127;
//			btn.height = 70;
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
	}
}