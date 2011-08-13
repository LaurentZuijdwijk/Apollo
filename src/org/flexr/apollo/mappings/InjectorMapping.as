package org.flexr.apollo.mappings 
{
	import org.flexr.naf.Injectable;
	/**
	 * ...
	 * @author 
	 */
	public class InjectorMapping 
	{
		public var subscribers:Vector.<Injectable> = new Vector.<Injectable>();
		public var iface:Class;
		public var property:String;
		public var type:Class;
		
		public function InjectorMapping() 
		{
			
		}
		
	}

}