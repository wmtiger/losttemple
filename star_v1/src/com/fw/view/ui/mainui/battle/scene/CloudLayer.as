package com.fw.view.ui.mainui.battle.scene
{
	import com.losttemple.assets.Assets;
	
	import starling.display.Image;
	import starling.display.QuadBatch;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class CloudLayer extends QuadBatch
	{
		private var _cloudList:Array;
		private var _w:int;
		private var _h:int;
		private var baseSpeed:Number = 2;
		
		public function CloudLayer(w:int, h:int)
		{
			_w = w;
			_h = h;
			super();
			initCloud();
			this.touchable = false;
		}
		
		private function initCloud():void
		{
			_cloudList = [];
			for(var i:int = 0; i < 20; i++)
			{
				var img:Image = new Image(getCloudTex());
				img.x = _w * Math.random();
				img.y = (_h - 500) * Math.random();
				img.scaleX = img.scaleY = Math.random() * 1.5 + 2.5;
				img.alpha = img.scaleX / 3;
				_cloudList[_cloudList.length] = img;
			}
			_cloudList.sort(sortList, Array.NUMERIC);
			
			function sortList(a:Image, b:Image):Number
			{
				if (a.alpha > b.alpha)
					return 1;
				else if (a.alpha < b.alpha)
					return -1;
				else
					return 0;
			}
			this.addEventListener(Event.ENTER_FRAME, onEf);
		}
		
		private function onEf(e:Event):void
		{
			reset();
			for(var i:int = 0; i < 20; i++)
			{
				var img:Image = _cloudList[i] as Image;
				img.alpha = img.scaleX / 2;
				img.x += baseSpeed * (1.2 - img.alpha);
				if(img.x > _w)
					img.x = 0 - img.width;
				addImage(img);
			}
		}
		
		private function getCloudTex():Texture
		{
			var ran:int = int(Math.random() * 10);
			var type:int = 1;
			if(ran >= 0 && ran < 5)
				type = 1;
			else if(ran >= 5 && ran < 9)
				type = 2;
			else
				type = 3;
			return Assets.instance.assetMgr.getTexture("cloud" + type);
		}
	
	}
}