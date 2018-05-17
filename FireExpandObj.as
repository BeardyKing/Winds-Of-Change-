package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class FireExpandObj extends MovieClip
	{
		var mRef: MovieClip;
		var expandCounter: Number = 0;
		var expandBool: Boolean = false;

		public function FireExpandObj()
		{
			// constructor code
			this.addEventListener(Event.ENTER_FRAME, Loop);

			mRef = MovieClip(this.parent);
		}
		public function Loop(e: Event)
		{
			this.alpha = 0
			

			this.x = mRef.fireManager1.startingFire.x;
			this.y = mRef.fireManager1.startingFire.y;
			if (mRef.fireManager1.startingFire.y != null)
			{
				expandCounter += 1;
				if (expandCounter > stage.frameRate * 2)
				{
					expandCounter = 0;
					expandBool = !expandBool;
				}

				if (expandBool == false)
				{
					this.scaleX += 0.02;
					
				}

				if (expandBool == true)
				{
					this.scaleY += 0.02;
					
				}

				
			}
		}
	}

}