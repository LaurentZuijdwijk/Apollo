package org.flexr.apollo 
{
	import org.flexr.naf.mappings.InjectorMapping;
	/**
	 * ...
	 * @author 
	 */
	public class Injector 
	{
 		private static var _model:Vector.<InjectorMapping>;
		
		public function Injector() 
		{
			throw(new Error('Static class cannot be instantiated'));
		}
		public static function set model(val:Vector.<InjectorMapping>):void
		{
			_model = val;
		}
		public static function register(val:Injectable):void
		{
			if (!_model ) throw(new Error('Injector model not set yet'));
			for each(var mapping:InjectorMapping in _model) {
				if (val is mapping.iface)
				{
					mapping.subscribers.push(val);
 				}
			}
		}	
		public static function inject(val:Object):void
		{
			for each(var obj:InjectorMapping in _model) {
				if (val is obj.type)
				{
					for each(var subscriber:Injectable in obj.subscribers)
					{
 						subscriber[obj.property] = val as obj.type;
					}
 				}
			}
 		}
	}
}