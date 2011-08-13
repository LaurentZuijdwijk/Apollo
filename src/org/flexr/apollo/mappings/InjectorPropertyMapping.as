package org.flexr.apollo.mappings 
{
	
	/**
	 * ...
	 * @author Laurent Zuijdwijk
	 */
	public class InjectorPropertyMapping extends InjectorMapping
	{
		
		public function InjectorPropertyMapping(iface:Class, property:String, type:Class) 
		{
			this.iface = iface;
			this.property = property;
			this.type = type;
		}
		
	}

}