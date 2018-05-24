package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class YokaiManager extends MovieClip
	{

		var mRef: MovieClip;

		var amountOfYokaiActive: Number = 0;

		var objState: String = "boot"

		var randomChoice: Number = 0;
		var randomSpawnTime: Number = 0;

		var timerSeconds: Number = 0;
		var timerTick: Number = 0;
		
		var townDisabled : String = "none"
		
		var objHealth : Number = 100;


		public function YokaiManager()
		{
			// constructor code

			mRef = MovieClip(this.parent);

			this.addEventListener(Event.ENTER_FRAME, Loop);
		}

		public function Loop(e: Event)
		{
			if (mRef.objState == "play")
			{
				trace(objState + "  " +this.name)
				/*trace("inside " + this.name)*/

				if (objState == "boot")
				{

					objState = "idle"
				}

				if (objState == "idle")
				{
					objState = "newRandom"


				}

				if (objState == "newRandom")
				{
					GenerateRandom();

					objState = "countDown"
				}

				if (objState == "countDown")
				{
					CountdownTimer();

				}

				if (objState == "yokaiActive")
				{

				}
				if(objState == "dealingDamage")
				{
					
				}


				if (objState == "reset")
				{
					objState = "idle"
					timerSeconds = 0;
					timerTick = 0;
					

				}
			}
			// loop
		}
		// loop

		public function GenerateRandom()
		{

			randomChoice = Math.round(Math.random() * 3) + 1;

			// TESTING
			randomSpawnTime = Math.round(Math.random() * 20) + 25;
			//randomSpawnTime = 1;
			//trace(randomChoice + " randomChoice " + this.name)
			//trace(randomSpawnTime + " randomSpawnTime " + this.name)
		}



		public function CountdownTimer()
		{
			timerTick += 1;
			if (timerTick >= stage.frameRate)
			{
				timerTick = 0;
				timerSeconds += 1;
			}

			if (timerSeconds >= randomSpawnTime)
			{
				ChooseYokai();
				objState = "yokaiActive"
			}
		}

		public function ChooseYokai()
		{
			if (randomChoice == 1)
			{
				mRef.yokai1.x = mRef.bLoggingTown1.x
				mRef.yokai1.y = mRef.bLoggingTown1.y
				townDisabled = "bLoggingTown1"
				mRef.yokai1.isActiveBool = true;

			}
			if (randomChoice == 2)
			{
				mRef.yokai1.x = mRef.bLoggingTown3.x
				mRef.yokai1.y = mRef.bLoggingTown3.y
				townDisabled = "bLoggingTown3"
				mRef.yokai1.isActiveBool = true;
			}
			if (randomChoice == 3)
			{
				mRef.yokai1.x = mRef.farmTown1.x
				mRef.yokai1.y = mRef.farmTown1.y
				townDisabled = "farmTown1";
				mRef.yokai1.isActiveBool = true;
			}
			if (randomChoice == 4)
			{
				mRef.yokai1.x = mRef.farmTown2.x
				mRef.yokai1.y = mRef.farmTown2.y
				townDisabled = "farmTown2"
				mRef.yokai1.isActiveBool = true;
			}
		}

	}

}