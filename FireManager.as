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
		
		var startingX : Number;
		var startingY : Number;

		var randomSpawnTimer: Number = 0;
		var randomSelection: Number = 0;
		var spawnCounterTick: Number = 0;
		var spawnCounterSeconds: Number = 0;
		var totalFireAmount : Number = 0;
		var amountOfFireActive : Number = 0;
		
		var fireActiveTimer : Number = 0;
		var fireResetTimer : Number = 15;
		var maxResetTimer = 15;
		// set to active Fire after 15 s
		var checkFireAmountAfterTime : Number = 0;

		var counter: Number = 0;
		public function FireManager()
		{
			
			mRef = MovieClip(this.parent)
			// constructor code

			this.addEventListener(Event.ENTER_FRAME, Loop);
		}
		public function Loop(e: Event)
		{
			//  TESTING TRACES
			//trace(amountOfFireActive + " amountOfFireActive");
			//trace(totalFireAmount + " totalFireAmount")
			
			if (objState == "boot")
			{
				
				if(mRef.objState == "play")
				{
				objState = "newRandom"
				}
			}
			if (objState == "newRandom")
			{
				randomSelection = Math.round(Math.random() * 7);
				randomSpawnTimer = Math.round((Math.random() * 15) + 20);
				
				// TESTING spawnCounter & Selection;				
				//randomSpawnTimer = 1;
				//randomSelection = 6;
				
				
				if (randomSelection == 0)
				{
					randomSelection = 3;
				}
				objState = "finished"


			}
			if (objState == "finished")
			{
				spawnCounterTick +=1
				if(spawnCounterTick >= stage.frameRate)
				{
					spawnCounterTick = 0;
					spawnCounterSeconds +=1;
				}
				//trace(randomSpawnTimer + " randomSpawnTimer")
				//trace(spawnCounterSeconds + " spawnCounterTick")
				//trace(randomSelection + " randomSelection")
				//trace("");
				
				if (spawnCounterSeconds >= randomSpawnTimer   )
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
			if(objState == "waitingForNoFire")
			{
				fireActiveTimer += 1;
				if(fireActiveTimer >=  stage.frameRate)
				{
					// every second - 1
					fireActiveTimer = 0;
					fireResetTimer -= 1;
				}
				if(fireResetTimer <= 0)
				{
					fireResetTimer = maxResetTimer;
					if(checkFireAmountAfterTime == amountOfFireActive)
					{
						trace("START A NEW FIRE" + this.name)
						objState = "reset"
					}
					else
					{
						trace("FIRE CHECK NOW == TO AMOUNT OF ACTIVE FIRES" + this.name)
						checkFireAmountAfterTime = amountOfFireActive
					}
				}
				
				//trace(fireActiveTimer + " fireActiveTimer " + this.name)
				//trace(fireResetTimer + " fireResetTimer " + this.name)
				//trace(checkFireAmountAfterTime + " checkFireAmountAfterTime " + this.name)
				//trace(amountOfFireActive + " firesOnFire " + this.name)
				//trace("")
				
				 
				
				
			}
			if (objState == "reset")
			{
				spawnCounterTick = 0;
				spawnCounterSeconds = 0;
				objState = "newRandom";
			}


			////trace(startingFire);

			counter++;
			if (counter >= 15)
			{
				counter = 0;
			}
		}
	}

}