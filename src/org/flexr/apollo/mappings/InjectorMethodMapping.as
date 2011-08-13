package org.flexr.apollo.mappings 
{
	import bbc.emfTestHarness.injectables.PlaybackInjectable;
	
	/**
	 * ...
	 * @author 
	 */
	public class InjectorMethodMapping extends InjectorMapping
	{
		public var method:String;
		public function InjectorMethodMapping(iface:Class, method:String, type:Class) 
		{
			this.iface = iface;
			this.method = method;
			this.type = type;
		}
		
	}

}