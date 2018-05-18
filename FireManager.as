package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class FireManager extends MovieClip
	{


		var totalFires: Number;
		var firesOnFire: Number;
		var startingFire : String;
		var mRef : MovieClip;

		var counter: Number = 0;
		public function FireManager()
		{
			mRef = MovieClip(this.parent)
			// constructor code

			this.addEventListener(Event.ENTER_FRAME, Loop);
		}
		public function Loop(e: Event)
		{
			mRef.expandBox6.isActiveBool = true
			
			//trace(startingFire);
			
			counter++;
			if (counter >= 15)
			{
				counter = 0;
			}
		}
	}

}