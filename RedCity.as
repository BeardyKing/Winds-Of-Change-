package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class RedCity extends MovieClip
	{
		var mRef: MovieClip;

		var objState: String = "boot"

		var woodTotal: Number = 0;
		var fishTotal: Number = 0;
		var riceTotal: Number = 0;
		

		var objHealth: Number = 100;
		var isBeingCaptued: Boolean = false;
		var captureCounter: Number = 0;

		public function RedCity()
		{
			mRef = MovieClip(this.parent);

			this.addEventListener(Event.ENTER_FRAME, Loop)

		}

		public function Loop(e: Event)
		{
			if (mRef.objState == "play")
			{

				
				mRef.RedriceText1.text = riceTotal.toString() + "Red Team Rice";
				mRef.RedfishText1.text = fishTotal.toString() + "Red Team fish";
				mRef.RedwoodText1.text = woodTotal.toString() + "Red Team wood";
				
				if(objHealth <= 0)
				{
					mRef.objState = "win";
				}

			}
		//Loop
		}
		//loop
	}

}