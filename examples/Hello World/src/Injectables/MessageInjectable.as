package Injectables 
{
	import models.vos.Fuel;
 	import models.vos.Message;
	import org.flexr.apollo.injectables.Injectable;
	
	/**
	 * ...
	 * @author Laurent Zuijdwijk
	 */
	public interface MessageInjectable extends Injectable 
	{
		function set message(msg:Message):void;
		function takeOff(amount:Fuel):void;
	}

}