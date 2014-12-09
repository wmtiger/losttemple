package com.star.assets
{
	import starling.utils.AssetManager;

	public class Assets
	{
		private static var _instance:Assets;
		
		public function Assets()
		{
		}

		public static function get instance():Assets
		{
			if(_instance == null)
				_instance = new Assets();
			return _instance;
		}
		
		public var assetMgr:AssetManager;

	}
}