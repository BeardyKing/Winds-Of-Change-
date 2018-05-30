package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class FarmingTown extends MovieClip
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
		var isOnFireBool: Boolean = false;
		var captureCounter: Number = 0;
		var isBeingCaptured: Boolean = false;





		public function FarmingTown()
		{
			this.alpha = 0;
			// constructor code
			mRef = MovieClip(this.parent);


			this.addEventListener(Event.ENTER_FRAME, Loop)

		}

		public function ResetFunction()
		{
			objState = "boot"
			objHealth = 100;
			currentRiceAmount = 0;
			isActive = false;
			riceTotalIsPoisoned = false;
			riceTotalPoisonTimer = 1000;
			hasTradeCartActive = false;
			hasYokaiEvent = false;
			yokaiRandomChance = 800;
			hitByWhirlwind = false;
			maxRice = 50
			hasThreeWorker = true;
			teamState = "toSet"
			isOnFireBool = false;
			captureCounter = 0;
			isBeingCaptured = false;
		}

		public function Loop(e: Event)
		{
			if (mRef.objState == "play")
			{
				if (currentRiceAmount > maxRice)
				{
					currentRiceAmount = maxRice;
				}
				if (currentRiceAmount >= 30 && hasTradeCartActive == false)
				{
					mRef.bCity.AddTradeCart(this.name)
				}
				if (this.name == "farmTown1")
				{
					// sorry for lazy code its nearing deadline <3
					if (mRef.fire1_Start5.objState == "onFire" || mRef.yokaiManager1.townDisabled == "farmTown1")
					{
						isOnFireBool = true;
						mRef.f1.alpha = 0.5
						mRef.f2.alpha = 0.5
						mRef.f3.alpha = 0.5
						mRef.f4.alpha = 0.5
						mRef.f5.alpha = 0.5
					}
					else
					{
						isOnFireBool = false
						mRef.bwf1.isAlive = true;
						mRef.bwf2.isAlive = true;
						mRef.bwf3.isAlive = true;
					}
				}

				if (this.name == "farmTown2")
				{
					if (mRef.fire2.objState == "onFire" || mRef.yokaiManager1.townDisabled == "farmTown2")
					{
						isOnFireBool = true;

						mRef.f6.alpha = 0.5
						mRef.f7.alpha = 0.5
						mRef.f8.alpha = 0.5
						mRef.f9.alpha = 0.5
						mRef.f10.alpha = 0.5
					}
					else
					{
						isOnFireBool = false

						mRef.bwf4.isAlive = true;
						mRef.bwf5.isAlive = true;
						mRef.bwf6.isAlive = true;
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