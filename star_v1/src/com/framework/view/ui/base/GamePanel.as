package com.framework.view.ui.base
{
	import feathers.core.FeathersControl;
	
	public class GamePanel extends FeathersControl
	{
		protected var _w:int;
		protected var _h:int;
		
		public function GamePanel(w:int, h:int)
		{
			_w = w;
			_h = h;
			super();
		}
		
	}
}