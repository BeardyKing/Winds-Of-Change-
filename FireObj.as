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
			mRef.fireManager1.startingFire = this.name;
		}
		public function Loop(e: Event)
		{
			

			/*if (    this.name == "fire1" || this.name == "fire2" 
				|| this.name == "fire_Fish1" || this.name == "fire1_Start1" 
				|| this.name == "fire1_Start2" || this.name == "fire1_Start3" 
				|| this.name == "fire1_Start4" || this.name == "fire1_Start5" 
				|| this.name == "fire1_Start6" || this.name == "fire1_Start7" 
				|| this.name == "fire1_Start8" || this.name == "fire1_2"
				|| this.name == "fire1_3" || this.name == "fire1_4" 
				|| this.name == "fire1_5" || this.name == "fire1_6" 
				|| this.name == "fire1_7" || this.name == "fire1_8" 
				|| this.name == "fire1_9" || this.name == "fire2_1" 
				|| this.name == "fire2_2" || this.name == "fire2_3" 
				|| this.name == "fire2_4" || this.name == "fire2_5" 
				|| this.name == "fire2_6" || this.name == "fire2_7" 
				|| this.name == "fire2_8" || this.name == "fire2_9 ")
			{*/
				if (this.hitTestObject(mRef.expandBox1) == true)
				{
					if(mRef.expandBox1.isActiveBool == true)
					{
					objState = "onFire"
					isActive = true;
					}
				}
				if (this.hitTestObject(mRef.expandBox2) == true)
				{
					if(mRef.expandBox2.isActiveBool == true)
					{
					objState = "onFire"
					isActive = true;
					}
				}
				if (this.hitTestObject(mRef.expandBox3) == true)
				{
					if(mRef.expandBox3.isActiveBool == true)
					{
					objState = "onFire"
					isActive = true;
					}
				}
				if (this.hitTestObject(mRef.expandBox4) == true)
				{
					if(mRef.expandBox4.isActiveBool == true)
					{
					objState = "onFire"
					isActive = true;
					}
				}
				if (this.hitTestObject(mRef.expandBox5) == true)
				{
					if(mRef.expandBox5.isActiveBool == true)
					{
					objState = "onFire"
					isActive = true;
					}
				}
				if (this.hitTestObject(mRef.expandBox6) == true)
				{
					if(mRef.expandBox6.isActiveBool == true)
					{
					objState = "onFire"
					isActive = true;
					}
				}
				if (this.hitTestObject(mRef.expandBox7) == true)
				{
					if(mRef.expandBox7.isActiveBool == true)
					{
					objState = "onFire"
					isActive = true;
					}
				}
				if (this.hitTestObject(mRef.expandBox8) == true)
				{
					if(mRef.expandBox8.isActiveBool == true)
					{
					objState = "onFire"
					isActive = true;
					}
				}
			
			//}
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
				
				//this.alpha = 1;
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
			//trace(currentFrame);
			this.alpha += 0.05;
			if(this.alpha >= 1)
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