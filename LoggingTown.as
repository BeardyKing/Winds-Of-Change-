package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class LoggingTown extends MovieClip
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
		var isOnFireBool: Boolean = false;
		var captureCounter: Number = 0;
		var isBeingCaptured: Boolean = false;

		public function LoggingTown()
		{
			this.alpha = 0;
			this.addEventListener(Event.ENTER_FRAME, Loop);
			mRef = MovieClip(this.parent)

		}

		public function ResetFunction()
		{
			objState = "boot";
			objHealth= 100;
			currentWoodAmount= 0;
			hasTradeCartActive = false;
			hasYokaiEvent= false;
			yokaiRandomChance = 800;
			hitByWhirlwind = false;
			maxWood = 50;
			hasThreeWorkers= true;
			teamState= "na"
			isOnFireBool= false;
			captureCounter = 0;
			isBeingCaptured= false;
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
					////trace(currentWoodAmount + "   " + hasTradeCartActive)
					if (currentWoodAmount >= 40 && hasTradeCartActive == false)
					{
						mRef.bCity.AddTradeCart(this.name)
					}

					if (mRef.fire1_Start1.objState == "onFire" || mRef.yokaiManager1.townDisabled == "bLoggingTown1")
					{
						isOnFireBool = true;

						mRef.tree11.objState = "drought";
						mRef.tree12.objState = "drought";
						mRef.tree13.objState = "drought";
						mRef.tree14.objState = "drought";
						mRef.tree15.objState = "drought";



					}
					else
					{

						mRef.tree11.objState = "growing";
						mRef.tree12.objState = "growing";
						mRef.tree13.objState = "growing";
						mRef.tree14.objState = "growing";
						mRef.tree15.objState = "growing";
						isOnFireBool = false
						mRef.bwl7.isAlive = true;
						mRef.bwl8.isAlive = true;
						mRef.bwl9.isAlive = true;


					}


				}
				if (this.name == "bLoggingTown3")
				{
					////trace(currentWoodAmount + "   " + hasTradeCartActive)
					if (currentWoodAmount >= 45 && hasTradeCartActive == false)
					{
						mRef.bCity.AddTradeCart(this.name)
					}

					if (mRef.fire1_Start7.objState == "onFire" || mRef.yokaiManager1.townDisabled == "bLoggingTown3")
					{
						isOnFireBool = true;

						mRef.tree1.objState = "drought";
						mRef.tree2.objState = "drought";
						mRef.tree3.objState = "drought";
						mRef.tree4.objState = "drought";
						mRef.tree5.objState = "drought";

					}
					else
					{

						mRef.tree1.objState = "growing";
						mRef.tree2.objState = "growing";
						mRef.tree3.objState = "growing";
						mRef.tree4.objState = "growing";
						mRef.tree5.objState = "growing";

						isOnFireBool = false

						mRef.bwl1.isAlive = true;
						mRef.bwl2.isAlive = true;
						mRef.bwl3.isAlive = true;
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