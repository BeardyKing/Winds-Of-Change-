﻿package
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

		var frameTimer: Number = 0;
		var woodSendBool: Boolean = false;


		public function RedLoggingTown()
		{
			this.alpha = 0;
			this.addEventListener(Event.ENTER_FRAME, Loop);
			mRef = MovieClip(this.parent)

		}

		public function ResetFunction()
		{
			objState = "boot";
			objHealth = 100;
			currentWoodAmount = 0;
			hasTradeCartActive = false;
			hasYokaiEvent = false;
			yokaiRandomChance = 800;
			hitByWhirlwind = false;
			maxWood = 50;
			hasThreeWorkers = true;
			teamState = "na"
			isOnFire = false;
			captureCounter = 0;
			isBeingCaptured = false;

			frameTimer = 0;
			woodSendBool = false;
		}

		public function Loop(e: Event)
		{
			if (mRef.objState == "play")
			{
				if (currentWoodAmount > maxWood)
				{
					currentWoodAmount = maxWood
				}

				if (this.name == "rLog1")
				{
					if (currentWoodAmount > 1)
					{
						woodSendBool = true;
					}
					else
					{
						woodSendBool = false;
					}
					if (woodSendBool == true)
					{
						mRef.rCity.woodTotal += 0.0055
						currentWoodAmount -= 0.0055
					}
				}
				if (this.name == "rLog2")
				{
					if (currentWoodAmount > 1)
					{
						woodSendBool = true;
					}
					else
					{
						woodSendBool = false;
					}
					if (woodSendBool == true)
					{
						mRef.rCity.woodTotal += 0.004
						currentWoodAmount -= 0.004
					}
				}

				if (objState == "boot")
				{
					mRef.bCity.tradecartCounter += 1;
					objState = "idle";
					//trace(this.name)
				}

			}
		}
		// loop
	}
	//loop

}