﻿package
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
		var teamState: String = "blue"
		var isOnFireBool: Boolean = false;
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
					if(mRef.fire_Fish1.objState == "onFire")
					{
						isOnFireBool = true;
					}
					else
					{
						isOnFireBool = false
						mRef.bFisher1.isAlive = true;
					}
						if (currentFishAmount >= 10 && hasTradeCartActive == false)
					{
						mRef.bCity.AddTradeCart(this.name)
					}
				}
				
				
				if (this.name == "bFishingTown3")
				{
					
					////trace(currentFishAmount + "   " + hasTradeCartActive)
					if (currentFishAmount >= 0 && hasTradeCartActive == false)
					{
						mRef.bCity.AddTradeCart(this.name)
					}
				}
				
				
				
				if (objState == "boot")
				{
					mRef.bCity.tradecartCounter += 1;
					objState = "idle";
					//trace(this.name)
				}
			}
			// loop
		}
		// loop
	}

}