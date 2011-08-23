package org.flexr.apollo 
{
	import org.flexr.apollo.mappings.InjectorMapping;
	import org.flexr.apollo.injectables.Injectable;
	import org.flexr.apollo.mappings.InjectorMethodMapping;
	import org.flexr.apollo.mappings.InjectorPropertyMapping;
	import org.flexr.apollo.parsers.InterfaceParser;
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
		
		public static function set intefaces(val:Array):void
		{
			var parser:InterfaceParser = new InterfaceParser();
			_model = new Vector.<InjectorMapping>();
			
			for each(var cl:Class in val)
			{
				parser.parse(cl).forEach(function(element:InjectorMapping, val:*,vall:*):void
					{
						_model.push(element);
					});
			}	
			trace(_model[0].iface)
			// do introspection on the interfaces.
			// make a mappings using the properties and methods in the interfaces.
			// done. Automated.
		}
		
		public static function register(val:Injectable):void
		{
			if (!_model ) throw(new Error('Injector model not set yet'));
			for each(var mapping:InjectorMapping in _model) {
				if ( val is mapping.iface)
				{
					mapping.subscribers.push(val);
 				}
			}
		}	
		public static function inject(val:Object):void
		{
			for each(var obj:InjectorMapping in _model) {
				if (obj is InjectorPropertyMapping && val is obj.type)
				{
					for each(var subscriber:Injectable in obj.subscribers)
					{
 						subscriber[obj.property] = val as obj.type;
					}
 				}
			}
 		}
		public static function unregister(val:Injectable):void
		{
			for each(var obj:InjectorMapping in _model) {
 				if (val is obj.iface)
				{
					var i:int = 0;
					for each(var subscriber:Injectable in obj.subscribers)
					{
 						if (subscriber == val)
						{
							obj.subscribers.splice(i, 1);
						}
						else{
							i++;
						}
					}
 				}
			}
		}	
		public static function call(method:String, arg:Object = null):void
		{
 			
			for each(var obj:InjectorMapping in _model) {
				if (obj is InjectorMethodMapping && method == (obj as InjectorMethodMapping).method)
				{
					for each(var subscriber:Injectable in obj.subscribers)
					{
 						(subscriber[(obj as InjectorMethodMapping).method] as Function)(arg);
					}
 				}
			}
 		}
	}
}