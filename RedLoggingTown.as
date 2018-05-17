package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class RedLoggingTown extends MovieClip
	{

		var mRef: MovieClip;
		var objState: String = "boot";
		var objHealth: Number = 100;
		var currentWoodAmount: Number = 0;
		var hasTradeCartActive: Boolean = false;
		var hasYokaiEvent: Boolean = false;
		var yokaiRandomChance: Number = 800;
		var hitByWhirlwind: Boolean = false;
		var maxWood: Number = 50;
		var hasThreeWorkers: Boolean = true;
		var teamState: String = "na"
		var isOnFire: Boolean = false;
		var captureCounter: Number = 0;
		var isBeingCaptured: Boolean = false;

		public function RedLoggingTown()
		{
			this.addEventListener(Event.ENTER_FRAME, Loop);
			mRef = MovieClip(this.parent)

		}

		public function Loop(e: Event)
		{
			if (mRef.objState == "play")
			{
				if (currentWoodAmount > maxWood)
				{
					currentWoodAmount = maxWood
				}
				if (this.name == "bLoggingTown1")
				{
					//trace(currentWoodAmount + "   " + hasTradeCartActive)
					if (currentWoodAmount >= 40 && hasTradeCartActive == false)
					{
						mRef.bCity.AddTradeCart(this.name)
					}
				}
				if (this.name == "bLoggingTown2")
				{
					//trace(currentWoodAmount + "   " + hasTradeCartActive)
					if (currentWoodAmount >= 50 && hasTradeCartActive == false)
					{
						mRef.bCity.AddTradeCart(this.name)
					}
				}
				if (this.name == "bLoggingTown3")
				{
					//trace(currentWoodAmount + "   " + hasTradeCartActive)
					if (currentWoodAmount >= 45 && hasTradeCartActive == false)
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
		}
		// loop
	}
	//loop

}