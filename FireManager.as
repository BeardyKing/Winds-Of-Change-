package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class FireManager extends MovieClip
	{


		var totalFires: Number;
		var firesOnFire: Number;
		var startingFire: String;
		var mRef: MovieClip;
		var objState: String = "boot"

		var randomSpawnTimer: Number = 0;
		var randomSelection: Number = 0;
		var spawnCounterTick: Number = 0;
		var spawnCounterSeconds: Number = 0;

		var counter: Number = 0;
		var amountOfFireActive: Number = 0;
		var totalFireAmount: Number = 0;

		var randomHasHappened: Boolean = false;

		var resetCounter: Number = 0;

		public function FireManager()
		{
			mRef = MovieClip(this.parent)
			// constructor code

			this.addEventListener(Event.ENTER_FRAME, Loop);
		}
		public function Loop(e: Event)
		{
			trace(totalFireAmount + " totalFireAmount" + this.name)
			trace(amountOfFireActive + " amountOfFireActive" + this.name)

			if (objState == "boot")
			{
				if (mRef.objState == "play" && randomHasHappened == false)
				{
					randomHasHappened = true;
					objState = "newRandom"
				}
			}
			if (objState == "newRandom")
			{

				randomSpawnTimer = Math.round((Math.random() * 40) + 35);
				// testing spawnCounter;				
				//randomSpawnTimer = 1;
				randomSelection = Math.round(Math.random() * 8);
				if (randomSelection == 0)
				{
					randomSelection = 3;
				}
				objState = "finished"


			}
			if (objState == "finished")
			{
				spawnCounterTick += 1
				if (spawnCounterTick >= stage.frameRate)
				{
					spawnCounterTick = 0;
					spawnCounterSeconds += 1;
				}
				trace(randomSpawnTimer + " randomSpawnTimer")
				trace(spawnCounterSeconds + " spawnCounterTick")
				trace(randomSelection + " randomSelection")

				if (spawnCounterSeconds >= randomSpawnTimer)
				{
					if (randomSelection == 1)
					{
						mRef.expandBox1.isActiveBool = true
						objState = "waitingForNoFire"
					}
					if (randomSelection == 2)
					{
						mRef.expandBox2.isActiveBool = true
						objState = "waitingForNoFire"
					}
					if (randomSelection == 3)
					{
						mRef.expandBox3.isActiveBool = true
						objState = "waitingForNoFire"
					}
					if (randomSelection == 4)
					{
						mRef.expandBox4.isActiveBool = true
						objState = "waitingForNoFire"
					}
					if (randomSelection == 5)
					{
						mRef.expandBox5.isActiveBool = true
						objState = "waitingForNoFire"
					}
					if (randomSelection == 6)
					{
						mRef.expandBox6.isActiveBool = true
						objState = "waitingForNoFire"
					}
					if (randomSelection == 7)
					{
						mRef.expandBox7.isActiveBool = true
						objState = "waitingForNoFire"
					}
					if (randomSelection == 8)
					{
						mRef.expandBox8.isActiveBool = true
						objState = "waitingForNoFire"
					}
				}
			}
			if (objState == "waitingForNoFire")
			{
				if(resetCounter < 60)
				{
					resetCounter += 1;
				}
				if (resetCounter >= 60)
				{
					if (amountOfFireActive == 0)
					{
						objState = "reset"
					}
				}

			}
			if (objState == "reset")
			{
				randomHasHappened = false;
				objState = "newRandom";
				mRef.expandBox1.objState = "init"
				mRef.expandBox2.objState = "init"
				mRef.expandBox3.objState = "init"
				mRef.expandBox4.objState = "init"
				mRef.expandBox5.objState = "init"
				mRef.expandBox6.objState = "init"
				mRef.expandBox7.objState = "init"
				mRef.expandBox8.objState = "init"
				mRef.expandConnector1.objState = "init"

				mRef.expandBox1.isActiveBool = false
				mRef.expandBox2.isActiveBool = false
				mRef.expandBox3.isActiveBool = false
				mRef.expandBox4.isActiveBool = false
				mRef.expandBox5.isActiveBool = false
				mRef.expandBox6.isActiveBool = false
				mRef.expandBox7.isActiveBool = false
				mRef.expandBox8.isActiveBool = false
			}


			//trace(startingFire);

			counter++;
			if (counter >= 15)
			{
				counter = 0;
			}
		}
	}

}