package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class fishingAimPoint extends MovieClip
	{

		var animCounter: Number = 0;
		var animCounter2: Number = 0;
		var mRef : MovieClip;



		public function fishingAimPoint()
		{
			mRef = MovieClip(this.parent);
			// constructor code
			this.addEventListener(Event.ENTER_FRAME, Loop);
		}

		public function Loop(e: Event)
		{
			if (this.name == "fishPoint1")
			{
				if (mRef.bFisher1.objState != "goToFishingTown")
				{
					animCounter += 1;
					if (animCounter >= 6)
					{
						animCounter = 0;
						animCounter2 += 1;
					}

					this.gotoAndStop(animCounter2);
					if (this.currentFrame >= 18)
					{
						animCounter2 = 1;
					}
				}
				else
				{
					this.gotoAndStop(18);
				}
			}
			
			if (this.name == "fishPoint3")
			{
				if (mRef.bFisher3.objState != "goToFishingTown")
				{
					animCounter += 1;
					if (animCounter >= 6)
					{
						animCounter = 0;
						animCounter2 += 1;
					}

					this.gotoAndStop(animCounter2);
					if (this.currentFrame >= 18)
					{
						animCounter2 = 1;
					}
				}
				else
				{
					this.gotoAndStop(18);
				}
			}
			
			if (this.name == "redFishPoint2")
			{
				if (mRef.rFisher2_1.objState != "goToFishingTown")
				{
					animCounter += 1;
					if (animCounter >= 6)
					{
						animCounter = 0;
						animCounter2 += 1;
					}

					this.gotoAndStop(animCounter2);
					if (this.currentFrame >= 18)
					{
						animCounter2 = 1;
					}
				}
				else
				{
					this.gotoAndStop(18);
				}
			}
			
			if (this.name == "redFishPoint1")
			{
				if (mRef.rFisher1_1.objState != "goToFishingTown")
				{
					animCounter += 1;
					if (animCounter >= 6)
					{
						animCounter = 0;
						animCounter2 += 1;
					}

					this.gotoAndStop(animCounter2);
					if (this.currentFrame >= 18)
					{
						animCounter2 = 1;
					}
				}
				else
				{
					this.gotoAndStop(18);
				}
			}
			// loop
		}
		// loop
	}

}