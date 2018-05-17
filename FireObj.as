package
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;


	public class FireObj extends MovieClip
	{

		var objState = "init"
		
		var animSwitch: Boolean = false;
		var MainGlobalDir: Number = 45;
		var mRef: MovieClip;
		var isActive : Boolean = false;
		var singlePass : Boolean = false;
		var animCounter: Number = 0;
		var animCounter2 : Number = 0;
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
					isActive = true;
				}
			}
			if (this.hitTestObject(mRef.expandConnector1) == true)
			{
				isActive = true;
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
				this.gotoAndStop(1);
			}
			if (objState == "onFire")
			{
				if (this.name == "fire2")
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
			trace(currentFrame);
			
			animCounter += 1;
			if(animCounter >= 3)
			{
				animCounter = 0;
				animCounter2 += 1;
			}
			
			this.gotoAndStop(animCounter2);
			if(this.currentFrame >= 20)
			{
				animCounter2 = 1;
			}
		
			 
		



		}

		public function SetRandomTimer()
		{

		}
	}

}