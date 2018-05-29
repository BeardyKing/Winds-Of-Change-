package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class AtackTuorial extends MovieClip
	{

		var mRef: MovieClip;
		var isActiveCheck: Boolean = false;
			
		var animCounter : Number = 0;
		var animCounter2 : Number = 0;
		
		
		
		public function AtackTuorial()
		{
			// constructor code
			mRef = MovieClip(this.parent);
			this.addEventListener(Event.ENTER_FRAME, Loop);
			this.alpha = 0;
		}

		public function Loop(e: Event)
		{
			trace(mRef.objState);
			if (mRef.objState == "start" && mRef.fireIntro1.isActive == false && mRef.fireIntro2.isActive == false)
			{

				animCounter += 1;
				if (animCounter >= 6)
				{
					animCounter = 0;
					animCounter2 += 1;
				}

				this.gotoAndStop(animCounter2);
				if (this.currentFrame >= 25)
				{
					animCounter2 = 1;
				}

				this.alpha += 0.03;
				isActiveCheck = true;
				this.x = 77;
				this.y = 250;
			}
			else
			{
				this.x = 1000;
				this.y = 1000;
			}
		}

	}

}