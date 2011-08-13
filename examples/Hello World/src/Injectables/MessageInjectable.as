package Injectables 
{
	import models.vos.Message;
	import org.flexr.apollo.Injectable;
	
	/**
	 * ...
	 * @author Laurent Zuijdwijk
	 */
	public interface MessageInjectable extends Injectable 
	{
		function set message(msg:Message):void;
	}

}