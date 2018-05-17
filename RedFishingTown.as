package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class RedFishingTown extends MovieClip
	{

		var mRef: MovieClip;
		var objState: String = "boot";
		var objHealth: Number = 0;
		var currentFishAmount: Number = 0;
		var isActive: Boolean = false;
		var hasTradeCartActive: Boolean = false;
		var hasYokaiEvent: Boolean = false;
		var yokaiRandomChance: Number = 800;
		var hitByWhirlwind: Boolean = false;
		var maxFish: Number = 50;
		var workerIsAlive: Boolean = true;
		var teamState: String = ""
		var isOnFireBoolean: Boolean = false;
		var captureCouunter: Number = 0;
		var isBeingCaptured: Boolean = false;

		var frameTimer: Number = 0;
		var foodSendBool: Boolean = false;


		public function RedFishingTown()
		{
			mRef = MovieClip(this.parent);

			this.addEventListener(Event.ENTER_FRAME, Loop);

			// constructor code
		}

		public function Loop(e: Event)
		{
			//
			if (mRef.objState == "play")
			{
				if (currentFishAmount > maxFish)
				{
					currentFishAmount = maxFish
				}
				if (this.name == "rFishTown1")
				{
					//trace(currentFishAmount)
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
						mRef.rCity.fishTotal += 0.005
						currentFishAmount -= 0.005
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
						mRef.rCity.fishTotal += 0.005
						currentFishAmount -= 0.005
					}
				}

				if (objState == "boot")
				{
					//mRef.bCity.tradecartCounter += 1;
					objState = "idle";
					trace(this.name)
				}
			}
			// loop
		}
		// loop
	}

}