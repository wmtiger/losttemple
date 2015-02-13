package com.fw.controller
{
	import com.fw.controller.bootstraps.BootstrapCmd;
	import com.fw.controller.bootstraps.BootstrapModel;
	import com.fw.controller.bootstraps.BootstrapViewMediator;
	
	import org.puremvc.as3.patterns.command.MacroCommand;
	
	public class StartupAppCmd extends MacroCommand
	{
		public function StartupAppCmd()
		{
			super();
		}
		
		override protected function initializeMacroCommand():void
		{
			addSubCommand(BootstrapCmd);
			addSubCommand(BootstrapModel);
			addSubCommand(BootstrapViewMediator);
		}
	}
}