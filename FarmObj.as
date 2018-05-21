package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class FarmObj extends MovieClip
	{

		var mRef: MovieClip;
		var remainingRice: Number = 20;
		var objState: String = "growing";
		var canBeFarmed: Boolean = true;
		var isPoisoned: Boolean = false;
		var farmResetTimer: Number = 60 * 6;
		var farmResetCounter: Number = 0;
		var hitByStorm: Boolean = false;
		var hitByWhirlwind: Boolean = false;
		var amountOfWater: Number = 100;
		var inDraught: Boolean = false;

		var hasBeenChosen: Boolean = false;


		public function FarmObj()
		{
			//trace("inside " + this.name)

			mRef = MovieClip(this.parent);

			this.addEventListener(Event.ENTER_FRAME, Loop)
		}
		public function Loop(e: Event)
		{
			if (mRef.objState == "play")
			{
				////trace(remainingRice + " " + this.name + " " + objState)
				if (objState == "growing")
				{
					this.alpha = 0.5;

					if (canBeFarmed == false)
					{
						farmResetCounter += 1;
						if (farmResetCounter >= farmResetTimer)
						{
							farmResetCounter = 0;
							canBeFarmed = true;
							remainingRice = 20;
						}
					}
					if (canBeFarmed == true)
					{
						objState = "readyToFarm"
					}

				}

				if (objState == "readyToFarm")
				{
					this.alpha = 1;
					if (remainingRice <= 0)
					{

						canBeFarmed = false;
						remainingRice = 0;
						objState = "growing"
					}
				}
				if (objState == "poisoned")
				{

				}
				if (objState == "drought")
				{
					
					this.alpha = 0.5;

				}
				if (objState == "dead")
				{

				}

			}
			//loop
		}
		//loop 
	}


}