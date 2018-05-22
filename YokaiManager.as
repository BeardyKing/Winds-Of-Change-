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


		public function YokaiManager()
		{
			// constructor code

			mRef = MovieClip(this.parent);

			this.addEventListener(Event.ENTER_FRAME, Loop);
		}

		public function Loop(e: Event)
		{
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
			
			if(objState == "countDown")
			{
				CountdownTimer();
			}
			
			if(objState == "yokaiActive")
			{
				// add in mRef.riceYokai.isActiveBool == true || mRef. etc . . . . . . . .
				if(objState == "null")
				{
					trace("can i do !null")
					objState = "reset";
				}
			}
			

			if(objState == "reset")
			{
				
			}
		// loop
		}
		// loop
		
		public function GenerateRandom()
		{
			randomChoice = Math.round(Math.random() *3) + 1;
			randomSpawnTime = Math.round(Math.random() * 5) + 1;
			
			trace(randomChoice +" randomChoice " + this.name)
				trace(randomSpawnTime +" randomSpawnTime " + this.name)
		}
		
		public function CountdownTimer ()
		{
			timerTick +=1;
				if(timerTick >= stage.frameRate)
				{
					timerTick = 0;
					timerSeconds += 1;
				}
				
				if(timerSeconds >= randomSpawnTime )
				{
					trace("FUCKING BOOP" + this.name )
					objState = "yokaiActive"
				}
		}
	}
	
}