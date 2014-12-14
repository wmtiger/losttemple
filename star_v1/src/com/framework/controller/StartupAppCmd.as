package com.framework.controller
{
	import com.framework.controller.bootstraps.BootstrapCmd;
	import com.framework.controller.bootstraps.BootstrapModel;
	import com.framework.controller.bootstraps.BootstrapViewMediator;
	
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