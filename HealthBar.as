package  {
	
	import flash.display.MovieClip;
	
	
	public class HealthBar extends MovieClip {
		
		var mRef = MovieClip;
		public function HealthBar() {
			// constructor code
			mRef = MovieClip(this.parent)
			this.addEventListener(Event.ENTER_FRAME, Loop);
		}
	}
	
}
