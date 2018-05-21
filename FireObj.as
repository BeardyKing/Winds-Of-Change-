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
		var isActive: Boolean = false;
		var singlePass: Boolean = false;
		var animCounter: Number = 0;
		var animCounter2: Number = 0;

		var singlePassFireTotal: Boolean = false;
		var singlePassFireActive: Boolean = false;
		var singlePassMinusFireActive: Boolean = false;
		public function FireObj()
		{

			// constructor code
			mRef = MovieClip(this.parent);
			this.addEventListener(Event.ENTER_FRAME, Loop);
			this.addEventListener(MouseEvent.MOUSE_DOWN, MouseD)

		}
		public function MouseD(md: MouseEvent)
		{
			////trace(this.name)
			//objState = "onFire";
			//mRef.fireManager1.startingFire = this.name;
		}
		public function Loop(e: Event)
		{
			if (singlePassFireTotal == false)
			{
				singlePassFireTotal = true;
				mRef.fireManager1.totalFireAmount += 1;
			}

			HitTestFunction();



			if (objState == "init")
			{

				SetRandomTimer();
				objState = "idle"
			}
			if (objState == "idle")
			{

				this.alpha = 0;
				this.gotoAndStop(1);

				objState = "waiting";

			}
			if (objState == "onFire")
			{
				//trace();

				if (singlePassFireActive == false)
				{
					trace("HAS BEEN SET TO TRUE" + this.name)
					singlePassFireActive = true
					mRef.fireManager1.amountOfFireActive += 1;
				}

				//this.alpha = 1;
				DoAnim();
			}
			if (objState == "findNextFire " + this.name)
			{

			}
			if (objState == "dead")
			{
				singlePassFireActive = false
				mRef.fireManager1.amountOfFireActive -= 1;

				this.alpha = 0;

				trace("DEAD FROM FIRE " + this.name)
				objState = "init"
			}
			if (objState == "")
			{

			}
			//
		}
		//
		public function HitTestFunction()
		{
			if (this.name == "fire5" || this.name == "fire7" ||
				this.name == "fire8" || this.name == "fire9" ||
				this.name == "fire11" || this.name == "fire12")
			{
				if (this.hitTestObject(mRef.expandConnector1) == true)
				{
					if (mRef.expandConnector1.isActiveBool == true)
					{
						isActive = true;
						objState = "onFire"
					}
				}
			}
			if (this.name != "fire5" || this.name != "fire7" ||
				  this.name != "fire8" || this.name != "fire9" || 
				  this.name != "fire11" || this.name != "fire12")
			{
				if (this.hitTestObject(mRef.expandBox1) == true)
				{
					if (mRef.expandBox1.isActiveBool == true)
					{
						objState = "onFire"
						isActive = true;
					}
				}
				if (this.hitTestObject(mRef.expandBox2) == true)
				{
					if (mRef.expandBox2.isActiveBool == true)
					{
						objState = "onFire"
						isActive = true;
					}
				}
				if (this.hitTestObject(mRef.expandBox3) == true)
				{
					if (mRef.expandBox3.isActiveBool == true)
					{
						objState = "onFire"
						isActive = true;
					}
				}
				if (this.hitTestObject(mRef.expandBox4) == true)
				{
					if (mRef.expandBox4.isActiveBool == true)
					{
						objState = "onFire"
						isActive = true;
					}
				}
				if (this.hitTestObject(mRef.expandBox5) == true)
				{
					if (mRef.expandBox5.isActiveBool == true)
					{
						objState = "onFire"
						isActive = true;
					}
				}
				if (this.hitTestObject(mRef.expandBox6) == true)
				{
					if (mRef.expandBox6.isActiveBool == true)
					{
						objState = "onFire"
						isActive = true;
					}
				}
				if (this.hitTestObject(mRef.expandBox7) == true)
				{
					if (mRef.expandBox7.isActiveBool == true)
					{
						objState = "onFire"
						isActive = true;
					}
				}
				if (this.hitTestObject(mRef.expandBox8) == true)
				{
					if (mRef.expandBox8.isActiveBool == true)
					{
						objState = "onFire"
						isActive = true;
					}
				}
			}

		}


		public function DoAnim()
		{
			////trace(currentFrame);
			this.alpha += 0.05;
			if (this.alpha >= 1)
			{
				this.alpha = 1;
			}


			animCounter += 1;
			if (animCounter >= 3)
			{
				animCounter = 0;
				animCounter2 += 1;
			}

			this.gotoAndStop(animCounter2);
			if (this.currentFrame >= 20)
			{
				animCounter2 = 1;
			}
		}

		public function SetRandomTimer()
		{

		}
	}

}