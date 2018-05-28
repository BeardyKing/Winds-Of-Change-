﻿package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class IntroAnimWind extends MovieClip {
		var animCounter2 : Number = 0;
		var animCounter : Number = 0;
		var mRef : MovieClip;
		
		public function IntroAnimWind() {
			// constructor code
			mRef = MovieClip(this.parent);
			
			this.addEventListener(Event.ENTER_FRAME, Loop);
		}
		
		public function Loop (e : Event)
		{
			if(mRef.objState == "start")
			{
				this.x = 600;
				this.y = 475;
				animCounter += 1;
			if (animCounter >= 4)
			{
				animCounter = 0;
				animCounter2 += 1;
			}

			this.gotoAndStop(animCounter2);
			if (this.currentFrame >= 34)
			{
				animCounter2 = 1;
			}
			}
			if(mRef.objState != "start" && this.x != 1000)
			{
				this.x = 1000
			}
			
		}
	}
	
}
