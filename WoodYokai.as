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


		public function WoodYokai()
		{
			// constructor code

			mRef = MovieClip(this.parent);

			this.addEventListener(Event.ENTER_FRAME, Loop);

		}

		public function Loop(e: Event)
		{
			trace(objHealth);
			//trace("Inside " + this.name)
			if (isActiveBool == false)
			{
				// do something here I guess

				this.x = 1000;
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
				objHealth = 100;
				objState = "idle"
				isActiveBool = false;
				mRef.yokaiManager1.townDisabled = "none";
				mRef.yokaiManager1.objState = "idle";
			}

			// loop 
		}
		// loop 
	}

}