package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class FireManager extends MovieClip
	{


		var totalFires: Number;
		var firesOnFire: Number;
		var startingFire : Object = null;

		var counter: Number = 0;
		public function FireManager()
		{
			// constructor code

			this.addEventListener(Event.ENTER_FRAME, Loop);
		}
		public function Loop(e: Event)
		{
			//trace(startingFire);
			
			counter++;
			if (counter >= 15)
			{
				counter = 0;
			}
		}
	}

}