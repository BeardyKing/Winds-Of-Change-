package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class FishingTown extends MovieClip
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


		public function FishingTown()
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
				if (this.name == "bFishingTown1")
				{
					//trace(currentWoodAmount + "   " + hasTradeCartActive)
						if (currentFishAmount >= 10 && hasTradeCartActive == false)
					{
						mRef.bCity.AddTradeCart(this.name)
					}
				}
				
				if (this.name == "bFishingTown2")
				{
					//trace(currentFishAmount + "   " + hasTradeCartActive)
					if (currentFishAmount >= 0 && hasTradeCartActive == false)
					{
						mRef.bCity.AddTradeCart(this.name)
					}
				}
				
				
				
				if (objState == "boot")
				{
					mRef.bCity.tradecartCounter += 1;
					objState = "idle";
					trace(this.name)
				}
			}
			// loop
		}
		// loop
	}

}