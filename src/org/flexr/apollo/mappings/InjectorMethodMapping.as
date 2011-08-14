package org.flexr.apollo.mappings 
{
 	
	/**
	 * ...
	 * @author 
	 */
	public class InjectorMethodMapping extends InjectorMapping
	{
		public var method:String;
		public function InjectorMethodMapping(iface:Class, method:String) 
		{
			this.iface = iface;
			this.method = method;
			this.type = type;
		}
		
	}

}