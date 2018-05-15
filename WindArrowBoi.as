package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class WindArrowBoi extends MovieClip {
		
		var mRef : MovieClip;
		
		public function WindArrowBoi() {
			// constructor code
			mRef = MovieClip(this.parent)
			this.addEventListener(Event.ENTER_FRAME, Loop);
		}
		
		public function Loop(e: Event)
		{
			this.rotation = (mRef.globalDir / Math.PI) * 180;
			//trace(this.rotation + " " + this.name);
		}
	}
	
}
