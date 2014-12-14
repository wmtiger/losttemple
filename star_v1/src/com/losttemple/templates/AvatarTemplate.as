package com.losttemple.templates
{
	import com.losttemple.templates.base.ITemplate;
	import com.losttemple.templates.base.Template;

	public class AvatarTemplate extends Template
	{
		public static const TYPE:String = "avatar";
		
		/**
		 * eg:AvatarTemplate.getTemplate(1001).getCrtProp("pic");
		 * eg2:AvatarTemplate.getTemplate(1001).raceid;
		 */		
		public function AvatarTemplate()
		{
		}
		
		public function get raceid():int
		{
			return int(crtData["raceid"]);
		}
		
		public function get sex():int
		{
			return int(crtData["sex"]);
		}
		
		public function get pic():String
		{
			return crtData["pic"];
		}
		
		public static function getTemplate(id:Number):AvatarTemplate
		{
			var temp:ITemplate = Template.getTemp(TYPE);
			return temp.getTempById(id) as AvatarTemplate;
		}
	}
}