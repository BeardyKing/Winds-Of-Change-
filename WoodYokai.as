package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class WoodYokai extends MovieClip {
		
		var mRef : MovieClip;
		var isActiveBool : Boolean = false;
		
		
		public function WoodYokai() {
			// constructor code

			mRef = MovieClip(this.parent);
			
			this.addEventListener(Event.ENTER_FRAME, Loop);
			
		}
		
		public function Loop(e: Event)
		{
			//trace("Inside " + this.name)
			if(isActiveBool == false)
			{
				// do something here I guess
				this.x = 1000;
			}
		}
	}
	
}
