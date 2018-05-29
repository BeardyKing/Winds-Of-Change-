package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class AttentionCircle extends MovieClip {
		
		var mRef : MovieClip
		var isActiveBool : Boolean = false;
		
		
		public function AttentionCircle() {
			// constructor code
			mRef = MovieClip(this.parent)
			this.addEventListener(Event.ENTER_FRAME, Loop);
		}
		
		public function Loop(e : Event)
		{
			if(this.name == "circle1")
			{
				this.x = mRef.fighterCart1.x
				this.y = mRef.fighterCart1.y
			}
			if(this.name == "circle2")
			{
				this.x = mRef.fighterCart2.x
				this.y = mRef.fighterCart2.y
			}

			this.alpha -= 0.008;
			if(this.alpha <= 0)
			{
				this.alpha = 1;
			}
			
			this.scaleX = this.alpha ;
			this.scaleY = this.scaleX;
			
			
			
		}
	}
	
}
