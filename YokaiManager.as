package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class YokaiManager extends MovieClip {
		
		var mRef : MovieClip;
		
		var amountOfYokaiActive : Number = 0;
		
		var objState : String = "boot"
		
		public function YokaiManager() {
			// constructor code

			mRef = MovieClip(this.parent);
			
			this.addEventListener(Event.ENTER_FRAME, Loop);
		}
		
		public function Loop (e : Event)
		{
			/*trace("inside " + this.name)*/
			
			if(objState == "boot")
			{
				
			}
			
			if(objState == "idle")
			{
				
			}
			
			if(objState == "newRandom")
			{
				
			}
			
			if(objState == "waiting")
			{
				
			}
			
			if(objState == "reset")
			{
				
			}
		// loop
		}
		// loop
	}
	
}
