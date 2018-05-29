package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class RedFishingTown extends MovieClip
	{

		var mRef: MovieClip;
		var objState: String = "boot";
		var objHealth: Number = 100;
		var currentFishAmount: Number = 0;
		var isActive: Boolean = false;
		var hasTradeCartActive: Boolean = false;
		var hasYokaiEvent: Boolean = false;
		var yokaiRandomChance: Number = 800;
		var hitByWhirlwind: Boolean = false;
		var maxFish: Number = 50;
		var workerIsAlive: Boolean = true;
		var teamState: String = "red"
		var isOnFireBoolean: Boolean = false;
		var captureCouunter: Number = 0;
		var isBeingCaptured: Boolean = false;
		var hasBeenCaptured: Boolean = false;

		var frameTimer: Number = 0;
		var foodSendBool: Boolean = false;


		public function RedFishingTown()
		{
			this.alpha = 0;
			mRef = MovieClip(this.parent);

			this.addEventListener(Event.ENTER_FRAME, Loop);

			// constructor code
		}

		public function ResetFunction()
		{

			objState = "boot";
			objHealth = 100;
			currentFishAmount = 0;
			isActive = false;
			hasTradeCartActive = false;
			hasYokaiEvent = false;
			yokaiRandomChance = 800;
			hitByWhirlwind = false;
			maxFish = 50;
			workerIsAlive = true;
			teamState = "red"
			isOnFireBoolean = false;
			captureCouunter = 0;
			isBeingCaptured = false;
			hasBeenCaptured = false;

			frameTimer = 0;
			foodSendBool = false;
		}

		public function Loop(e: Event)
		{
			if (isBeingCaptured == true)
			{
				objHealth -= 0.2;
				if (objHealth <= 0)
				{
					objHealth = 100;
					teamState = "blue"
				}
			}


			//
			if (mRef.objState == "play")
			{

				if (currentFishAmount > maxFish)
				{
					currentFishAmount = maxFish
				}
				if (this.name == "rFishTown1")
				{
					if (teamState == "blue")
					{
						mRef.bAsset1.alpha = 1;
					}
					if (teamState == "red")
					{
						mRef.bAsset1.alpha = 0;
						////trace(currentFishAmount)
						if (currentFishAmount > 1)
						{
							foodSendBool = true;
						}
						else
						{
							foodSendBool = false;
						}
						if (foodSendBool == true)
						{
							mRef.rCity.fishTotal += 0.0062
							currentFishAmount -= 0.0062
						}

					}
				}

				if (this.name == "rFishTown2")
				{
					if (currentFishAmount > 1)
					{
						foodSendBool = true;
					}
					else
					{
						foodSendBool = false;
					}
					if (foodSendBool == true)
					{
						mRef.rCity.fishTotal += 0.0065
						currentFishAmount -= 0.0065
					}
				}

				if (objState == "boot")
				{
					//mRef.bCity.tradecartCounter += 1;
					objState = "idle";
					//trace(this.name)
				}
			}

			// loop
		}
		// loop
	}

}