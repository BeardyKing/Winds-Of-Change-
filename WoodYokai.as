package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class WoodYokai extends MovieClip
	{

		var mRef: MovieClip;
		var isActiveBool: Boolean = false;
		var objState: String = "boot"
		var objHealth: Number = 100;

		var resetCounter: Number = 0;
		
		var animCounter : Number =  0;
		var animCounter2 : Number = 0;
		


		public function WoodYokai()
		{
			// constructor code

			mRef = MovieClip(this.parent);

			this.addEventListener(Event.ENTER_FRAME, Loop);

		}
		
		public function DoAnim()
		{
			this.alpha += 0.05;
			if (this.alpha >= 1)
			{
				this.alpha = 1;
			}


			animCounter += 1;
			if (animCounter >= 4)
			{
				animCounter = 0;
				animCounter2 += 1;
			}

			this.gotoAndStop(animCounter2);
			if (this.currentFrame >= 4)
			{
				animCounter2 = 1;
			}
		}
		

		public function Loop(e: Event)
		{
			if(mRef.objState == "win" || mRef.objState == "lose" )
			{
				objState = "reset";
			}
			trace(objHealth);
			//trace("Inside " + this.name)
			if (isActiveBool == false)
			{
				// do something here I guess

				this.x = 1000;
			}
			if(isActiveBool == true)
			{
				DoAnim();
			}
			if (objHealth <= 1)
			{
				objState = "reset"
			}

			if (objState == "dealingDamage")
			{
				resetCounter += 1;
				objHealth -= 0.46
				if (objHealth <= 0)
				{
					objState = "reset"
				}
				if (resetCounter >= 4)
				{
					objState = "idle"
				}
			}
			if (objState == "reset")
			{
				this.alpha = 0;
				objHealth = 100;
				objState = "idle"
				isActiveBool = false;
				mRef.yokaiManager1.townDisabled = "none";
				mRef.yokaiManager1.objState = "reset";
			}

			// loop 
		}
		// loop 
	}

}