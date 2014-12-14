package com.losttemple.assets
{
	import starling.utils.AssetManager;

	public class Assets
	{
		private static var _instance:Assets;
		
		public var assetMgr:AssetManager;
		
		public function Assets()
		{
		}

		public static function get instance():Assets
		{
			if(_instance == null)
				_instance = new Assets();
			return _instance;
		}
		
	}
}