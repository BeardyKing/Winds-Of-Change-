﻿package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class RedFarmingTown extends MovieClip
	{
		var mRef: MovieClip;

		var objState: String = "boot"
		var objHealth: Number = 100;
		var currentRiceAmount: Number = 0;
		var isActive: Boolean = false;
		var riceTotalIsPoisoned: Boolean = false;
		var riceTotalPoisonTimer: Number = 1000;
		var hasTradeCartActive: Boolean = false;
		var hasYokaiEvent: Boolean = false;
		var yokaiRandomChance: Number = 800;
		var hitByWhirlwind: Boolean = false;
		var maxRice: Number = 50
		var hasThreeWorker: Boolean = true;
		var teamState: String = "toSet"
		var isOnFire: Boolean = false;
		var captureCounter: Number = 0;
		var isBeingCaptured: Boolean = false;


		var frameTimer: Number = 0;
		var riceSendBool: Boolean = false;




		public function RedFarmingTown()
		{
			// constructor code
			mRef = MovieClip(this.parent);


			this.addEventListener(Event.ENTER_FRAME, Loop)

		}

		public function Loop(e: Event)
		{
			////trace(currentRiceAmount + " " + this.name + "currentRiceAmount")
			if (mRef.objState == "play")
			{
				if (currentRiceAmount > maxRice)
				{
					currentRiceAmount = maxRice;
				}

				if (this.name == "rFarmTown1")
				{
					if (currentRiceAmount > 1)
					{
						riceSendBool = true;
					}
					else
					{
						riceSendBool = false;
					}
					if (riceSendBool == true)
					{
						////trace(this.name)
						mRef.rCity.riceTotal += 0.01
						currentRiceAmount -= 0.001
					}
				}
				
				
				if (objState == "boot")
				{
					mRef.bCity.tradecartCounter += 1;
					objState = "idle"
					////trace(this.name)
				}
			}
			// loop
		}
		//loop
	}

}