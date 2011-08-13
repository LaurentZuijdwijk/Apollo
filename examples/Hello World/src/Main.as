package 
{
	import Controllers.HelloWorldController;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import Injectables.MessageInjectable;
	import models.vos.Message;
	import org.flexr.apollo.Injectable;
	import org.flexr.apollo.Injector;
	import org.flexr.apollo.mappings.InjectorMapping;
	import org.flexr.apollo.mappings.InjectorPropertyMapping;
	
	/**
	 * Example application for the Appollo injector and messaging framework.
	 * 
	 * @author Laurent Zuijdwijk
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// create the injector mapping. This is based on a vector using concrete mapping classes.
			var injectorMap:Vector.<InjectorMapping> = new Vector.<InjectorMapping>();
			injectorMap.push(new InjectorPropertyMapping(MessageInjectable, 'message', Message));
			Injector.model = injectorMap;
			
			
			// make the textfield which will be controlled by our controller.
			var tf:TextField = new TextField();
			addChild(tf);
			
			var helloController:HelloWorldController = new HelloWorldController(tf);
			
			//We inject some messages.
			Injector.inject(new Message('Hello World'));
			Injector.inject(new Message('Goodbye World'));
			
			Injector.inject(new Message('Hello Moon'));

			helloController.unregister();
			Injector.inject(new Message('Trying to leave the moon'));
		}
		
	}
	
}