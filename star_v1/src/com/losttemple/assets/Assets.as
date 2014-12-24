package com.losttemple.assets
{
	import feathers.textures.Scale3Textures;
	import feathers.textures.Scale9Textures;
	import flash.geom.Rectangle;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	
	public class Assets
	{
		private static var _instance:Assets;
		
		public var assetMgr:AssetManager;
		
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
		
		public function init():void
		{
			ui_head_bar_bg_Texture = assetMgr.getTexture("ui_head_bar_bg");
			ui_head_bar_bg_S3Texture = new Scale3Textures(ui_head_bar_bg_Texture, 370, 10);
		}
	
	}
}