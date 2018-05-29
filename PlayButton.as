package
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;


	public class PlayButton extends MovieClip
	{

		var mouseIsOver: Boolean = false;
		var mRef: MovieClip
		var singlePass: Boolean = false;
		var yHolder: Number = 0;

		var animCounter: Number = 0;
		var animCounterMax: Number = 8;
		var animBool: Boolean = false;
		
		var bigResetBool : Boolean = false;
		var fireResetBool : Boolean = false;
		var expandReset1 : Boolean = false;
		var tradeReset : Boolean = false;


		public function PlayButton()
		{

			mRef = MovieClip(this.parent)
			this.addEventListener(Event.ENTER_FRAME, Loop);
			this.addEventListener(MouseEvent.MOUSE_DOWN, MouseDown);
			this.addEventListener(MouseEvent.MOUSE_UP, MouseUp);

			this.addEventListener(MouseEvent.MOUSE_OVER, MouseOver)
			this.addEventListener(MouseEvent.MOUSE_OUT, MouseOut)

			// constructor code
		}
		public function MouseOver(e: MouseEvent)
		{
			////trace("OVER")
			mouseIsOver = true;
		}

		public function MouseOut(e: MouseEvent)
		{
			mouseIsOver = false;
			////trace("OUT")
		}
		public function Loop(e: Event)
		{
			if (animCounterMax >= 0)
			{
				if (mRef.fireIntro1.isActive == true && mRef.fireIntro2.isActive == true)
				{
					this.alpha = 0.3;
					mRef.playBar1.alpha = 0.3;
				}
				if (mRef.fireIntro1.isActive == false && mRef.fireIntro2.isActive == false)
				{
					animCounter += 1;
					if (animCounter >= 15)
					{
						animCounter = 0;
						animBool = !animBool;
						animCounterMax -= 1;
					}

					if (animBool == true)
					{
						this.alpha = 1;
						mRef.playBar1.alpha = 1;
					}
					if (animBool == false)
					{
						this.alpha = 0.5
						mRef.playBar1.alpha = 1;
					}
				}
				if (animCounterMax < 0)
				{
					this.alpha = 1;
					mRef.playBar1.alpha = 1;
				}
			}

			if (singlePass == false)
			{
				mRef.intro1.x = 0;
				mRef.intro1.y = 0
				this.x = 400;
				this.y = 223;
				mRef.playBar1.y = this.y;
				mRef.playBar1.x = this.x;
				yHolder = this.y;
				singlePass = true;
			}
			if (mouseIsOver == false)
			{
				this.y = yHolder;
			}
			if (mouseIsOver == true)
			{
				this.y = yHolder + 2;
			}
			
			if (mRef.objState == "win" || mRef.objState == "lose")
			{
				this.alpha = 1;
				mRef.playBar1.alpha = 1;
			}
		}

		public function MouseDown(md: MouseEvent)
		{

		}

		public function MouseUp(mu: MouseEvent)
		{
			//trace("Start Game")
			if (mRef.objState == "start")
			{
				if (mRef.fireIntro1.isActive == false && mRef.fireIntro2.isActive == false)
				{
					mRef.objState = "play"
					mRef.intro1.x = -1000;
					mRef.intro1.y = -1000
					this.x = -1000;
					this.y = -1000;
					mRef.playBar1.y = this.y;
					mRef.playBar1.x = this.x;
				}
			}
			if (mRef.objState == "win" || mRef.objState == "lose")
			{
				mRef.objState = "play"
				mRef.win1.x = -1000;
				mRef.win1.y = -1000;
				mRef.intro1.x = -1000;
				mRef.intro1.y = -1000
				
				mRef.lose1.x = -1000;
				mRef.lose1.y = -1000;
				this.x = -1000;
				this.y = -1000;
				mRef.playBar1.y = this.y;
				mRef.playBar1.x = this.x;
				
				
				/////// HELL RESET ///////////
				// bcity reset
				mRef.bCity.ResetFunction();
				// rcity reset
				mRef.rCity.ResetFunction();
				// for cloudObjBoi
				bigResetBool = true;
				// fireObjReset
				fireResetBool = true;
				// expandObj
				expandReset1 = true;
				// expandConnector
				mRef.expandConnector1.ResetFunction();
				// bfighter1 & 2
				mRef.bFighter1.ResetFunction();
				mRef.bFighter2.ResetFunction();
				// tradecart reset
				tradeReset = true
				//bfarm town
				mRef.farmTown1.ResetFunction();
				mRef.farmTown2.ResetFunction();
				//bFishingTown
				mRef.bFishingTown1.ResetFunction();
				mRef.bFishingTown3.ResetFunction();
				//bloggingTown 
				mRef.bLoggingTown3.ResetFunction();
				mRef.bLoggingTown1.ResetFunction();
				//rFarmTown
				mRef.rFarmTown2.ResetFunction();
				mRef.rFarmTown1.ResetFunction();
				//rLoggingTown
				mRef.rLog1.ResetFunction();
				mRef.rLog2.ResetFunction();
				//rFishTown
				mRef.rFishTown2.ResetFunction();
				mRef.rFishTown1.ResetFunction();
				// main
				mRef.globalDir = -2.5;
				

			}
		}
	}

}