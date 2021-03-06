package Controllers 
{
	import flash.text.TextField;
	import Injectables.MessageInjectable;
	import models.vos.Fuel;
	import models.vos.Message;
	import org.flexr.apollo.controllers.Controller;
	
	/**
	 * ...
	 * @author Laurent Zuijdwijk
	 */
	public class HelloWorldController extends Controller implements MessageInjectable {
		
		private var _view:TextField;
		
		public function HelloWorldController(tf:TextField) 
		{
			tf.multiline = true;
			tf.width = 400;
			_view = tf;
			
			super();
		}
		
		/* INTERFACE Injectables.MessageInjectable */
		
		public function set message(msg:Message):void 
		{
			trace('msg received ' + msg.text);
			_view.appendText(msg.text + '\n');
		}
		
		public function takeOff(amount:Fuel):void
		{
			_view.appendText( 'Launch! Taking off with ' + amount.amount + ' pounds of fuel\n');
		}
 	}
}