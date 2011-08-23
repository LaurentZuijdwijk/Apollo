package org.flexr.apollo.parsers 
{
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;
	import Injectables.MessageInjectable;
	import org.flexr.apollo.mappings.InjectorMapping;
	import org.flexr.apollo.mappings.InjectorMethodMapping;
	import org.flexr.apollo.mappings.InjectorPropertyMapping;
	/**
	 * ...
	 * @author Laurent Zuijdwijk
	 */
	public class InterfaceParser 
	{
		
		public function InterfaceParser() 
		{
			
		}
		public function parse(val:Class):Array
		{
			var info:XML = describeType(val);
			var map:Array = new Array();
			trace(info);
			var item:XML 
			for each (item in info..factory..accessor)
			{
				map.push( new InjectorPropertyMapping(val,item.@name,  getDefinitionByName(item.@type) as Class) );
			}
			for each (item in info..factory..method)
			{
				map.push( new InjectorMethodMapping(val,item.@name) );
			}
			return map;
		}
	}

}