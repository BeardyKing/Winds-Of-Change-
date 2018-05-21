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
			// constructor code
			mRef = MovieClip(this.parent);


			this.addEventListener(Event.ENTER_FRAME, Loop)

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
					if (mRef.fire1_Start5.objState == "onFire")
					{
						isOnFireBool = true;
						mRef.f1.alpha =  0.5
						mRef.f2.alpha =  0.5
						mRef.f3.alpha =  0.5
						mRef.f4.alpha =  0.5
						mRef.f5.alpha =  0.5
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
					if (mRef.fire2.objState == "onFire")
					{
						isOnFireBool = true;
						
						mRef.f6.objState = "drought"
						mRef.f7.objState = "drought"
						mRef.f8.objState = "drought"
						mRef.f9.objState = "drought"
						mRef.f10.objState = "drought"
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