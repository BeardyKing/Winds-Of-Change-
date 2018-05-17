package
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;


	public class FireObj extends MovieClip
	{

		var objState = "init"
		var animCounter: Number = 0;
		var animSwitch: Boolean = false;
		var MainGlobalDir: Number = 45;
		var mRef: MovieClip;
		public function FireObj()
		{
			// constructor code
			mRef = MovieClip(this.parent);
			this.addEventListener(Event.ENTER_FRAME, Loop);
			this.addEventListener(MouseEvent.MOUSE_DOWN, MouseD)

		}
		public function MouseD(md: MouseEvent)
		{
			trace(this.name)
			objState = "onFire";
			mRef.fireManager1.startingFire = this;
		}
		public function Loop(e: Event)
		{
			if (this.name == "fire1" || this.name == "fire2")
			{
				if (this.hitTestObject(mRef.expandBox1) == true)
				{
					objState = "onFire"
				}
			}
			if (this.hitTestObject(mRef.expandConnector1) == true)
				{
					objState = "onFire"
				}
			if (objState == "init")
			{
				SetRandomTimer();
				objState = "idle"
			}
			if (objState == "idle")
			{
				this.alpha = 0;
			}
			if (objState == "onFire")
			{
				if(this.name == "fire2")
				{
					
				}
				this.alpha = 1;
				DoAnim();
			}
			if (objState == "findNextFire")
			{

			}
			if (objState == "")
			{

			}
		}

		public function DoAnim()
		{
			animCounter++;
			//trace(animSwitch)

			if (animCounter >= 5)
			{
				animSwitch = !animSwitch;
				animCounter = 0;
			}

			if (animSwitch == false)
			{
				this.scaleX = -1;
			}
			if (animSwitch == true)
			{
				this.scaleX = 1;
			}



		}

		public function SetRandomTimer()
		{

		}
	}

}