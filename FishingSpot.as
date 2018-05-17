package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class FishingSpot extends MovieClip {
		
		
		public function FishingSpot() {
			// constructor code
			
			this.addEventListener(Event.ENTER_FRAME, Loop);
		}
		
		public function Loop (e : Event )
		{
			//trace("hello from" + this.name)
		}
	}
	
}
