package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class RedTree extends MovieClip
	{
		var mRef: MovieClip;
		var remainingWood: Number = 20;
		var objState: String = "growing";
		var canBeLogged: Boolean = true;
		var isPoisoned: Boolean = false;
		var treeResetTimer: Number = 60 * 8;
		var treeResetCounter: Number = 0;
		var hitByStorm: Boolean = false;
		var hitByWhirlwind: Boolean = false;


		var hasBeenChosen: Boolean = false;

		public function RedTree()
		{
			//trace("inside : " + this.name)
			// constructor code
			mRef = MovieClip(this.parent);
			this.addEventListener(Event.ENTER_FRAME, Loop);


		}

		public function Loop(e: Event)
		{
			if (mRef.objState == "play")
			{
				////trace(remainingRice + " " + this.name + " " + objState)
				if (objState == "growing")
				{
					this.alpha = 0.5;
					////trace(this.rotation + "  " +this.name )

					if (this.name == "tree3" || this.name == "tree4")
					{
						if (this.rotation > -90)
						{
							this.rotation -= 1
						}
					}
					else if (this.name == "tree1" || this.name == "tree2" || this.name == "tree5")
					{
						if (this.rotation < 90)
						{
							this.rotation += 1
						}
					}
					else
					{
						if (this.rotation < 90)
						{
							this.rotation += 1
						}
					}

					if (canBeLogged == false)
					{
						treeResetCounter += 1;
						if (treeResetCounter >= treeResetTimer)
						{
							treeResetCounter = 0;
							canBeLogged = true;
							remainingWood = 20;
						}
					}
					if (canBeLogged == true)
					{
						objState = "readyToLog"
					}
				}


				if (objState == "readyToLog")
				{

					this.rotation = 0;

					this.alpha = 1;
					if (remainingWood <= 0)
					{

						canBeLogged = false;
						remainingWood = 0;
						objState = "growing"
					}
				}
				if (objState == "poisoned")
				{

				}
				if (objState == "drought")
				{


				}
				if (objState == "dead")
				{

				}
			}
			// loop
		}
		//loop 

	}
}