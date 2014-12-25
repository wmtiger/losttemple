package com.losttemple.assets
{
	import com.losttemple.assets.themes.StyleName;
	import feathers.textures.Scale3Textures;
	import feathers.textures.Scale9Textures;
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	
	public class Assets
	{
		private static var _instance:Assets;
		
		public var assetMgr:AssetManager;
		
		// 以下为文本格式
		public var defTextFmt:TextFormat;
		
		// 以下为资源命名
		public var ui_head_bar_bg_Texture:Texture;
		public var ui_head_bar_bg_S3Texture:Scale3Textures;
		public var ui_btn2_normal_Texture:Texture;
		public var ui_btn2_normal_S3Texture:Scale3Textures;
		
		public function Assets()
		{
		}
		
		public static function get instance():Assets
		{
			return _instance ||= new Assets();
		}
		
		private function initTextformat():void
		{
			defTextFmt = new TextFormat(StyleName.FONT_NAME_FZY4, StyleName.FONT_SIZE_18, StyleName.FONT_COLOR_WHITE,
				true, false, false, "", "", TextFormatAlign.LEFT, 0, 0, 0 , 0);
		}
		
		private function initTexture():void
		{
			ui_head_bar_bg_Texture = assetMgr.getTexture("ui_head_bar_bg");
			ui_head_bar_bg_S3Texture = new Scale3Textures(ui_head_bar_bg_Texture, 130, 20);
			ui_btn2_normal_Texture = assetMgr.getTexture("ui_btn2_normal");
			ui_btn2_normal_S3Texture = new Scale3Textures(ui_btn2_normal_Texture, 30, 6);
		}
		
		public function init():void
		{
			initTextformat();
			initTexture();
		}
	
	}
}