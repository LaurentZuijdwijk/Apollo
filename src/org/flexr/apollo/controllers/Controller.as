package org.flexr.apollo.controllers 
{
	import org.flexr.apollo.injectables.Injectable;
	import org.flexr.apollo.Injector;
	/**
	 * Extend this controller to get auto subscribing MVC controllers.
	 *
	 * @author Laurent Zuijdwijk
	 */
	public class Controller implements Injectable
	{
		
		public function Controller()  
		{
			register();
		}
		/**
		 * This gets called automatically on init, but you can register again after an unregister.
		 */
		public function register():void
		{
			Injector.register(this);
		}
		
		/**
		 * Unregister this controller.
		 */
		public function unregister():void
		{
			Injector.unregister(this);
		}
	}

}
