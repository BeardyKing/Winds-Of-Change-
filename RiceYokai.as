package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class RiceYokai extends MovieClip {
		
		var mRef : MovieClip;
		
		
		public function RiceYokai() {
			// constructor code

			mRef = MovieClip(this.parent);
			
			this.addEventListener(Event.ENTER_FRAME, Loop);
			
		}
		
		public function Loop(e: Event)
		{
			//trace("Inside " + this.name)
		}
	}
	
}
