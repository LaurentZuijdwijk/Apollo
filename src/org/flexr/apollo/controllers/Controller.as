package org.flexr.apollo.controllers 
{
	import org.flexr.naf.Injectable;
	import org.flexr.naf.Injector;
	/**
	 * ...
	 * @author 
	 */
	public class Controller implements Injectable
	{
		
		public function Controller()  
		{
			Injector.register(this);
		}
		
	}

}