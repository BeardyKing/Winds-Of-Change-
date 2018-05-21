package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class cloudObjBoi extends MovieClip
	{

		var mRef: MovieClip;
		var hasBeenHit: Boolean = false;
		var angleDegLocal: Number = 0;
		var objState: String = "init";
		var speed: Number = 0;
		var minusAmount: Number = 0.1;

		var singlePass1: Boolean = false;
		var singlePass2: Boolean = false;
		var singlePass3: Boolean = false;
		var singlePass4: Boolean = false;
		var singlePass5: Boolean = false;
		var singlePass6: Boolean = false;
		var singlePass7: Boolean = false;
		var singlePass8: Boolean = false;
		var singlePass9: Boolean = false;
		var singlePass10: Boolean = false;
		var singlePass11: Boolean = false;
		var singlePass12: Boolean = false;
		var singlePass13: Boolean = false;
		var singlePass14: Boolean = false;
		var singlePass15: Boolean = false;

		var singlePass1_2: Boolean = false;
		var singlePass2_2: Boolean = false;
		var singlePass3_2: Boolean = false;
		var singlePass4_2: Boolean = false;
		var singlePass5_2: Boolean = false;
		var singlePass6_2: Boolean = false;
		var singlePass7_2: Boolean = false;
		var singlePass8_2: Boolean = false;
		var singlePass9_2: Boolean = false;
		var singlePass10_2: Boolean = false;
		var singlePass11_2: Boolean = false;
		var singlePass12_2: Boolean = false;
		var singlePass13_2: Boolean = false;
		var singlePass14_2: Boolean = false;
		var singlePass15_2: Boolean = false;

		var singlePassRandom: Boolean = false;


		var randomPosOrNeg: Number = 0;
		var randomAngleDeg: Number = 0;

		var objStateCounter: Number = 0;
		var objStateCounterSeconds: Number = 0;


		/*var cloudState: String = "white"*/
		var cloudState: String = "greyStorm"

		var randomChangeLightGrey: Number;
		var randomChangeGrey: Number;
		var randomChangeGreyStorm: Number;
		var randomChangeReset: Number;

		var randomXPos: Number = 0;
		var randomYPos: Number = 0;

		var tickCounter: Number = 0;
		var frameSkipBool: Boolean = false;

		var alphaCounter: Number = 0;
		var alphaBoolSwitch: Boolean = false;


		public function cloudObjBoi()
		{

			mRef = MovieClip(this.parent);
			this.addEventListener(Event.ENTER_FRAME, Loop);
			this.addEventListener(Event.EXIT_FRAME, ExitLoop);
			mRef.testCounter += 1;

		}
		public function ExitLoop(e: Event)
		{


		}

		private function GlobalDirMove()
		{
			tickCounter += 1;
			if (tickCounter > 2)
			{
				tickCounter = 0;
				frameSkipBool = true
			}
			if (frameSkipBool == true)
			{
				frameSkipBool = false;
				this.x -= Math.cos(mRef.globalDir) * mRef.globalMoveSpeedTest;
				this.y -= Math.sin(mRef.globalDir) * mRef.globalMoveSpeedTest;
			}
			//this.y -= Math.sin(mRef.globalDir) * mRef.globalMoveSpeed ;

		}

		public function RandomSpawnLoc()
		{

		}


		public function Loop(e: Event)
		{
			if (mRef.objState == "play")
			{

				GlobalDirMove();
				AnimationHandler();
				StateHandeler();
				// TESTING
				cloudState = "greyStorm"
				// TESTING
			}
			if (this.name == "cloudBoi1")
			{
				// TESTING
				this.x = stage.mouseX;
				this.y = stage.mouseY;
				//
			}
		}


		public function StateHandeler()
		{
			if (objState == "init")
			{
				//sets spawn Loc & state change timer
				SetRandomValues()
			}

			StateChangeHandeler();

			if (cloudState == "white")
			{
				this.alpha += 0.03;
				if (this.alpha >= 0.7)
				{
					this.alpha = 0.7
				}
			}

			if (cloudState == "lightGrey")
			{
				this.alpha += 0.01;
				if (this.alpha >= 0.9)
				{
					this.alpha = 0.9
				}
			}

			if (cloudState == "grey")
			{
				this.alpha += 0.01
				if (this.alpha >= 1)
				{
					this.alpha = 1
				}
			}

			if (cloudState == "greyStorm")
			{

				this.alpha += 0.02;
				if (this.alpha >= 1)
				{
					this.alpha = 1
				}

				RainHitTestCheck();
				// add new texture for this frame
			}

			if (cloudState == "resetCloud")
			{
				this.alpha -= 0.003
				if (this.alpha <= 0)
				{
					this.alpha = 0;
					objState = "init";
					cloudState = "white"
				}

			}

			if (objState == "idle_")
			{
				this.x -= Math.cos(angleDegLocal) * speed;
				this.y += Math.sin(angleDegLocal) * speed;

				HitTestCheck();
				ResetHitTest();

			}
		}

		public function RainHitTestCheck()
		{
			HitTestExpandObjs();
			HitTestFire();
			HitTestRicePaddy();
		}

		public function HitTestExpandObjs()
		{
			if (this.hitTestObject(mRef.expandBox1) == true)
			{
				if (mRef.expandBox1.isActiveBool == true)
				{
					mRef.expandBox1.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.expandBox2) == true)
			{
				if (mRef.expandBox2.isActiveBool == true)
				{
					mRef.expandBox2.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.expandBox3) == true)
			{
				if (mRef.expandBox3.isActiveBool == true)
				{
					mRef.expandBox3.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.expandBox4) == true)
			{
				if (mRef.expandBox4.isActiveBool == true)
				{
					mRef.expandBox4.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.expandBox5) == true)
			{
				if (mRef.expandBox5.isActiveBool == true)
				{
					mRef.expandBox5.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.expandBox6) == true)
			{
				if (mRef.expandBox6.isActiveBool == true)
				{
					mRef.expandBox6.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.expandBox7) == true)
			{
				if (mRef.expandBox7.isActiveBool == true)
				{
					mRef.expandBox7.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.expandBox8) == true)
			{
				if (mRef.expandBox8.isActiveBool == true)
				{
					mRef.expandBox8.objState = "dead"
				}
			}
		}


		public function HitTestFire()
		{

			if (this.hitTestObject(mRef.fire1_Start1) == true)
			{
				if (mRef.fire1_Start1.isActive == true)
				{
					mRef.fire1_Start1.objState = "dead"
					mRef.fire1_Start1.isActive = false
				}

			}
			if (this.hitTestObject(mRef.fire1_Start2) == true)
			{
				if (mRef.fire1_Start2.isActive == true)
				{
					mRef.fire1_Start2.objState = "dead"
					mRef.fire1_Start2.isActive = false
				}

			}
			if (this.hitTestObject(mRef.fire1_Start3) == true)
			{
				if (mRef.fire1_Start3.isActive == true)
				{
					mRef.fire1_Start3.objState = "dead"
					mRef.fire1_Start3.isActive = false
				}

			}
			if (this.hitTestObject(mRef.fire1_Start4) == true)
			{
				if (mRef.fire1_Start4.isActive == true)
				{
					mRef.fire1_Start4.objState = "dead"
					mRef.fire1_Start4.isActive = false
				}

			}
			if (this.hitTestObject(mRef.fire1_Start5) == true)
			{
				if (mRef.fire1_Start5.isActive == true)
				{
					mRef.fire1_Start5.objState = "dead"
					mRef.fire1_Start5.isActive = false
				}

			}
			if (this.hitTestObject(mRef.fire1_Start6) == true)
			{
				if (mRef.fire1_Start6.isActive == true)
				{
					mRef.fire1_Start6.objState = "dead"
					mRef.fire1_Start6.isActive = false
				}

			}
			if (this.hitTestObject(mRef.fire1_Start7) == true)
			{
				if (mRef.fire1_Start7.isActive == true)
				{
					mRef.fire1_Start7.objState = "dead"
					mRef.fire1_Start7.isActive = false
				}

			}
			if (this.hitTestObject(mRef.fire1_Start8) == true)
			{
				if (mRef.fire1_Start8.isActive == true)
				{
					mRef.fire1_Start8.objState = "dead"
					mRef.fire1_Start8.isActive = false
				}

			}

			// end of starting


			if (this.hitTestObject(mRef.fire1_1) == true)
			{
				if (mRef.fire1_1.isActive == true)
				{
					mRef.fire1_1.isActive = false
					mRef.fire1_1.objState = "dead"
				}

			}
			if (this.hitTestObject(mRef.fire1_2) == true)
			{
				if (mRef.fire1_2.isActive == true)
				{
					mRef.fire1_2.isActive = false
					mRef.fire1_2.objState = "dead"
				}

			}
			if (this.hitTestObject(mRef.fire1_3) == true)
			{
				if (mRef.fire1_3.isActive == true)
				{
					mRef.fire1_3.isActive = false
					mRef.fire1_3.objState = "dead"
				}

			}
			if (this.hitTestObject(mRef.fire1_4) == true)
			{
				if (mRef.fire1_4.isActive == true)
				{
					mRef.fire1_4.isActive = false
					mRef.fire1_4.objState = "dead"
				}

			}
			if (this.hitTestObject(mRef.fire1_5) == true)
			{
				if (mRef.fire1_5.isActive == true)
				{
					mRef.fire1_5.isActive = false
					mRef.fire1_5.objState = "dead"
				}

			}
			if (this.hitTestObject(mRef.fire1_6) == true)
			{
				if (mRef.fire1_6.isActive == true)
				{
					mRef.fire1_6.isActive = false
					mRef.fire1_6.objState = "dead"
				}

			}
			if (this.hitTestObject(mRef.fire1_7) == true)
			{
				if (mRef.fire1_7.isActive == true)
				{
					mRef.fire1_7.isActive = false
					mRef.fire1_7.objState = "dead"
				}

			}
			if (this.hitTestObject(mRef.fire1_8) == true)
			{
				if (mRef.fire1_8.isActive == true)
				{
					mRef.fire1_8.isActive = false
					mRef.fire1_8.objState = "dead"
				}

			}
			if (this.hitTestObject(mRef.fire1_9) == true)
			{
				if (mRef.fire1_9.isActive == true)
				{
					mRef.fire1_9.isActive = false
					mRef.fire1_9.objState = "dead"
				}

			}

			/// SET 2

			if (this.hitTestObject(mRef.fire2_1) == true)
			{
				if (mRef.fire2_1.isActive == true)
				{
					mRef.fire2_1.isActive = false
					mRef.fire2_1.objState = "dead"
				}

			}
			if (this.hitTestObject(mRef.fire2_2) == true)
			{
				if (mRef.fire2_2.isActive == true)
				{
					mRef.fire2_2.isActive = false
					mRef.fire2_2.objState = "dead"
				}

			}
			if (this.hitTestObject(mRef.fire2_3) == true)
			{
				if (mRef.fire2_3.isActive == true)
				{
					mRef.fire2_3.isActive = false
					mRef.fire2_3.objState = "dead"
				}

			}
			if (this.hitTestObject(mRef.fire2_4) == true)
			{
				if (mRef.fire2_4.isActive == true)
				{
					mRef.fire2_4.isActive = false
					mRef.fire2_4.objState = "dead"
				}

			}
			if (this.hitTestObject(mRef.fire2_5) == true)
			{
				if (mRef.fire2_5.isActive == true)
				{
					mRef.fire2_5.isActive = false
					mRef.fire2_5.objState = "dead"
				}

			}
			if (this.hitTestObject(mRef.fire2_6) == true)
			{
				if (mRef.fire2_6.isActive == true)
				{
					mRef.fire2_6.isActive = false
					mRef.fire2_6.objState = "dead"
				}

			}
			if (this.hitTestObject(mRef.fire2_7) == true)
			{
				if (mRef.fire2_7.isActive == true)
				{
					mRef.fire2_7.isActive = false
					mRef.fire2_7.objState = "dead"
				}

			}
			if (this.hitTestObject(mRef.fire2_8) == true)
			{
				if (mRef.fire2_8.isActive == true)
				{
					mRef.fire2_8.isActive = false
					mRef.fire2_8.objState = "dead"
				}

			}
			if (this.hitTestObject(mRef.fire2_9) == true)
			{
				if (mRef.fire2_9.isActive == true)
				{
					mRef.fire2_9.isActive = false
					mRef.fire2_9.objState = "dead"
				}

			}

			// SET 3

			if (this.hitTestObject(mRef.fire3_1) == true)
			{
				if (mRef.fire3_1.isActive == true)
				{
					mRef.fire3_1.isActive = false
					mRef.fire3_1.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire3_2) == true)
			{
				if (mRef.fire3_2.isActive == true)
				{
					mRef.fire3_2.isActive = false
					mRef.fire3_2.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire3_3) == true)
			{
				if (mRef.fire3_3.isActive == true)
				{
					mRef.fire3_3.isActive = false
					mRef.fire3_3.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire3_4) == true)
			{
				if (mRef.fire3_4.isActive == true)
				{
					mRef.fire3_4.isActive = false
					mRef.fire3_4.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire3_5) == true)
			{
				if (mRef.fire3_5.isActive == true)
				{
					mRef.fire3_5.isActive = false
					mRef.fire3_5.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire3_6) == true)
			{
				if (mRef.fire3_6.isActive == true)
				{
					mRef.fire3_6.isActive = false
					mRef.fire3_6.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire3_7) == true)
			{
				if (mRef.fire3_7.isActive == true)
				{
					mRef.fire3_7.isActive = false
					mRef.fire3_7.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire3_8) == true)
			{
				if (mRef.fire3_8.isActive == true)
				{
					mRef.fire3_8.isActive = false
					mRef.fire3_8.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire3_9) == true)
			{
				if (mRef.fire3_9.isActive == true)
				{
					mRef.fire3_9.isActive = false
					mRef.fire3_9.objState = "dead"
				}
			}

			// SET 4

			if (this.hitTestObject(mRef.fire4_1) == true)
			{
				if (mRef.fire4_1.isActive == true)
				{
					mRef.fire4_1.isActive = false
					mRef.fire4_1.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire4_2) == true)
			{
				if (mRef.fire4_2.isActive == true)
				{
					mRef.fire4_2.isActive = false
					mRef.fire4_2.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire4_3) == true)
			{
				if (mRef.fire4_3.isActive == true)
				{
					mRef.fire4_3.isActive = false
					mRef.fire4_3.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire4_4) == true)
			{
				if (mRef.fire4_4.isActive == true)
				{
					mRef.fire4_4.isActive = false
					mRef.fire4_4.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire4_5) == true)
			{
				if (mRef.fire4_5.isActive == true)
				{
					mRef.fire4_5.isActive = false
					mRef.fire4_5.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire4_6) == true)
			{
				if (mRef.fire4_6.isActive == true)
				{
					mRef.fire4_6.isActive = false
					mRef.fire4_6.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire4_7) == true)
			{
				if (mRef.fire4_7.isActive == true)
				{
					mRef.fire4_7.isActive = false
					mRef.fire4_7.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire4_8) == true)
			{
				if (mRef.fire4_8.isActive == true)
				{
					mRef.fire4_8.isActive = false
					mRef.fire4_8.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire4_9) == true)
			{
				if (mRef.fire4_9.isActive == true)
				{
					mRef.fire4_9.isActive = false
					mRef.fire4_9.objState = "dead"
				}
			}

			// SET 5

			if (this.hitTestObject(mRef.fire5_1) == true)
			{
				if (mRef.fire5_1.isActive == true)
				{
					mRef.fire5_1.isActive = false
					mRef.fire5_1.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire5_2) == true)
			{
				if (mRef.fire5_2.isActive == true)
				{
					mRef.fire5_2.isActive = false
					mRef.fire5_2.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire5_3) == true)
			{
				if (mRef.fire5_3.isActive == true)
				{
					mRef.fire5_3.isActive = false
					mRef.fire5_3.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire5_4) == true)
			{
				if (mRef.fire5_4.isActive == true)
				{
					mRef.fire5_4.isActive = false
					mRef.fire5_4.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire5_5) == true)
			{
				if (mRef.fire5_5.isActive == true)
				{
					mRef.fire5_5.isActive = false
					mRef.fire5_5.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire5_6) == true)
			{
				if (mRef.fire5_6.isActive == true)
				{
					mRef.fire5_6.isActive = false
					mRef.fire5_6.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire5_7) == true)
			{
				if (mRef.fire5_7.isActive == true)
				{
					mRef.fire5_7.isActive = false
					mRef.fire5_7.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire5_8) == true)
			{
				if (mRef.fire5_8.isActive == true)
				{
					mRef.fire5_8.isActive = false
					mRef.fire5_8.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire5_9) == true)
			{
				if (mRef.fire5_9.isActive == true)
				{
					mRef.fire5_9.isActive = false
					mRef.fire5_9.objState = "dead"
				}
			}

			// SET 6

			if (this.hitTestObject(mRef.fire6_1) == true)
			{
				if (mRef.fire6_1.isActive == true)
				{
					mRef.fire6_1.isActive = false
					mRef.fire6_1.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire6_2) == true)
			{
				if (mRef.fire6_2.isActive == true)
				{
					mRef.fire6_2.isActive = false
					mRef.fire6_2.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire6_3) == true)
			{
				if (mRef.fire6_3.isActive == true)
				{
					mRef.fire6_3.isActive = false
					mRef.fire6_3.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire6_4) == true)
			{
				if (mRef.fire6_4.isActive == true)
				{
					mRef.fire6_4.isActive = false
					mRef.fire6_4.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire6_5) == true)
			{
				if (mRef.fire6_5.isActive == true)
				{
					mRef.fire6_5.isActive = false
					mRef.fire6_5.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire6_6) == true)
			{
				if (mRef.fire6_6.isActive == true)
				{
					mRef.fire6_6.isActive = false
					mRef.fire6_6.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire6_7) == true)
			{
				if (mRef.fire6_7.isActive == true)
				{
					mRef.fire6_7.isActive = false
					mRef.fire6_7.objState = "dead"
				}
			}

			// SET 7 fire 1 to 12 with fire names missing :^) good coding right here

			if (this.hitTestObject(mRef.fire1) == true)
			{
				if (mRef.fire1.isActive == true)
				{
					mRef.fire1.isActive = false
					mRef.fire1.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire2) == true)
			{
				if (mRef.fire2.isActive == true)
				{
					mRef.fire2.isActive = false
					mRef.fire2.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire3) == true)
			{
				if (mRef.fire3.isActive == true)
				{
					mRef.fire3.isActive = false
					mRef.fire3.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire5) == true)
			{
				if (mRef.fire5.isActive == true)
				{
					mRef.fire5.isActive = false
					mRef.fire5.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire7) == true)
			{
				if (mRef.fire7.isActive == true)
				{
					mRef.fire7.isActive = false
					mRef.fire7.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire8) == true)
			{
				if (mRef.fire8.isActive == true)
				{
					mRef.fire8.isActive = false
					mRef.fire8.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire9) == true)
			{
				if (mRef.fire9.isActive == true)
				{
					mRef.fire9.isActive = false
					mRef.fire9.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire11) == true)
			{
				if (mRef.fire11.isActive == true)
				{
					mRef.fire11.isActive = false
					mRef.fire11.objState = "dead"
				}
			}
			if (this.hitTestObject(mRef.fire12) == true)
			{
				if (mRef.fire12.isActive == true)
				{
					mRef.fire12.isActive = false
					mRef.fire12.objState = "dead"
				}
			}

			if (this.hitTestObject(mRef.fire_Fish1) == true)
			{
				if (mRef.fire_Fish1.isActive == true)
				{
					mRef.fire_Fish1.isActive = false
					mRef.fire_Fish1.objState = "dead"
				}
			}


			if (this.hitTestObject(mRef.fire3_10) == true)
			{
				if (mRef.fire3_10.isActive == true)
				{
					mRef.fire3_10.isActive = false
					mRef.fire3_10.objState = "dead"
				}
			}



		}
		public function HitTestRicePaddy()
		{

		}

		public function SetRandomValues()
		{
			speed = 0
			randomXPos = Math.round(Math.random() * 800);
			randomYPos = Math.round(Math.random() * 500);
			if ((randomXPos > 100 && randomXPos < 700) &&
				(randomYPos > 50 && randomYPos < 450))
			{
				objState = "init"
				this.alpha = 0;
			}
			else
			{
				objState = "idle_"
			}

			randomChangeLightGrey = Math.round(Math.random() * 15 + 2);
			randomChangeGrey = Math.round(Math.random() * 20 + 2)
			randomChangeGreyStorm = Math.round(Math.random() * 10 + 8)
			randomChangeReset = Math.round(Math.random() * 8 + 3)

			// SET SPAWN
			//this.x = randomXPos;
			//this.y = randomYPos;
		}

		public function StateChangeHandeler()
		{
			objStateCounter += 1;
			if (objStateCounter >= 60)
			{
				objStateCounter = 0;
				objStateCounterSeconds += 1
				if (objStateCounterSeconds >= randomChangeLightGrey && cloudState == "white")
				{
					cloudState = "lightGrey"
					objStateCounterSeconds = 0;
					////trace(cloudState + " " + this.name)
				}
				else if (objStateCounterSeconds >= randomChangeGrey && cloudState == "lightGrey")
				{
					cloudState = "grey"
					objStateCounterSeconds = 0
					////trace(cloudState + " " + this.name)
				}
				else if (objStateCounterSeconds >= randomChangeGreyStorm && cloudState == "grey")
				{
					cloudState = "greyStorm"
					objStateCounterSeconds = 0;
					////trace(cloudState + " " + this.name)
				}
				else if (objStateCounterSeconds >= randomChangeReset && cloudState == "greyStorm")
				{
					cloudState = "resetCloud"
				}
			}
		}

		public function HitTestCheckTwo()
		{
			// add hitTest for fire1 & other fireObjs
			if (this.hitTestObject(mRef.c1_2) == true)
			{
				if (mRef.c1_2.objState == "moving")
				{
					if (singlePass1_2 == false)
					{
						singlePass1_2 = true;
						angleDegLocal = mRef.c1_2.localAngleDeg;
						speed = mRef.c1_2.speedNum;
					}
					mRef.c1_2.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c2_2) == true)
			{
				if (mRef.c2_2.objState == "moving")
				{
					if (singlePass2_2 == false)
					{
						singlePass2_2 = true;
						angleDegLocal = mRef.c2_2.localAngleDeg;
						speed = mRef.c2_2.speedNum;
					}
					mRef.c2_2.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c3_2) == true)
			{
				if (mRef.c3_2.objState == "moving")
				{
					if (singlePass3_2 == false)
					{
						singlePass3_2 = true;
						angleDegLocal = mRef.c3_2.localAngleDeg;
						speed = mRef.c3_2.speedNum;
					}
					mRef.c3_2.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c4_2) == true)
			{
				if (mRef.c4_2.objState == "moving")
				{
					if (singlePass4_2 == false)
					{
						singlePass4_2 = true;
						angleDegLocal = mRef.c4_2.localAngleDeg;
						speed = mRef.c4_2.speedNum;
					}
					mRef.c4_2.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c5_2) == true)
			{
				if (mRef.c5_2.objState == "moving")
				{
					if (singlePass5_2 == false)
					{
						singlePass5_2 = true;
						angleDegLocal = mRef.c5_2.localAngleDeg;
						speed = mRef.c5_2.speedNum;
					}
					mRef.c5_2.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c6_2) == true)
			{
				if (mRef.c6_2.objState == "moving")
				{
					if (singlePass6_2 == false)
					{
						singlePass6_2 = true;
						angleDegLocal = mRef.c6_2.localAngleDeg;
						speed = mRef.c6_2.speedNum;
					}
					mRef.c6_2.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c7_2) == true)
			{
				if (mRef.c7_2.objState == "moving")
				{
					if (singlePass7_2 == false)
					{
						singlePass7_2 = true;
						angleDegLocal = mRef.c7_2.localAngleDeg;
						speed = mRef.c7_2.speedNum;
					}
					mRef.c7_2.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c8_2) == true)
			{
				if (mRef.c8_2.objState == "moving")
				{
					if (singlePass8_2 == false)
					{
						singlePass8_2 = true;
						angleDegLocal = mRef.c8_2.localAngleDeg;
						speed = mRef.c8_2.speedNum;
					}
					mRef.c8_2.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c9_2) == true)
			{
				if (mRef.c9_2.objState == "moving")
				{
					if (singlePass9_2 == false)
					{
						singlePass9_2 = true;
						angleDegLocal = mRef.c9_2.localAngleDeg;
						speed = mRef.c9_2.speedNum;
					}
					mRef.c9_2.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c10_2) == true)
			{
				if (mRef.c10_2.objState == "moving")
				{
					if (singlePass10_2 == false)
					{
						singlePass10_2 = true;
						angleDegLocal = mRef.c10_2.localAngleDeg;
						speed = mRef.c10_2.speedNum;
					}
					mRef.c10_2.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c11_2) == true)
			{
				if (mRef.c11_2.objState == "moving")
				{
					if (singlePass11_2 == false)
					{
						singlePass11_2 = true;
						angleDegLocal = mRef.c11_2.localAngleDeg;
						speed = mRef.c11_2.speedNum;
					}
					mRef.c11_2.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c12_2) == true)
			{
				if (mRef.c12_2.objState == "moving")
				{
					if (singlePass12_2 == false)
					{
						singlePass12_2 = true;
						angleDegLocal = mRef.c12_2.localAngleDeg;
						speed = mRef.c12_2.speedNum;
					}
					mRef.c12_2.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c13_2) == true)
			{
				if (mRef.c13_2.objState == "moving")
				{
					if (singlePass13_2 == false)
					{
						singlePass13_2 = true;
						angleDegLocal = mRef.c13_2.localAngleDeg;
						speed = mRef.c13_2.speedNum;
					}
					mRef.c13_2.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c14_2) == true)
			{
				if (mRef.c14_2.objState == "moving")
				{
					if (singlePass14_2 == false)
					{
						singlePass14_2 = true;
						angleDegLocal = mRef.c14_2.localAngleDeg;
						speed = mRef.c14_2.speedNum;
					}
					mRef.c14_2.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c15_2) == true)
			{
				if (mRef.c1_2.objState == "moving")
				{
					if (singlePass1_2 == false)
					{
						singlePass1_2 = true;
						angleDegLocal = mRef.c1_2.localAngleDeg;
						speed = mRef.c1_2.speedNum;
					}
					mRef.c1_2.speedNum -= minusAmount;
				}
			}


		}

		public function AnimationHandler()
		{

			// State refs white / lightGrey / grey / greyStorm

			if (cloudState == "white")
			{
				this.gotoAndStop(1);
				this.visible = true;
			}

			if (cloudState == "lightGrey")
			{
				this.gotoAndStop(2);
				this.visible = true;
			}

			if (cloudState == "grey")
			{
				this.gotoAndStop(3);
				this.visible = true;
			}

			if (cloudState == "greyStorm")
			{
				// alphaCounter : Number = 0;
				//var alphaBoolSwitch
				//alphaCounter += 1;
				this.visible = true;
				this.gotoAndStop(3);
				/*if (alphaCounter > 2)
				{
					alphaCounter = 0;
					alphaBoolSwitch = !alphaBoolSwitch;
				}
				if (alphaBoolSwitch == true)
				{
			
				}
				else
				{
					this.visible = false;

				}*/
				// add rain obj
				// maybe make an active hitbox for whole obj
			}


		}


		public function ResetHitTest()
		{
			HitTestCheckTwo();
			if (speed > 0)
			{
				speed -= 0.2 / stage.frameRate;
				if (speed <= 0)
				{
					speed = 0;
					singlePass1 = false;
					singlePass2 = false;
					singlePass3 = false;
					singlePass4 = false;
					singlePass5 = false;
					singlePass6 = false;
					singlePass7 = false;
					singlePass8 = false;
					singlePass9 = false;
					singlePass10 = false;
					singlePass11 = false;
					singlePass12 = false;
					singlePass13 = false;
					singlePass14 = false;
					singlePass15 = false;

					singlePass1_2 = false;
					singlePass2_2 = false;
					singlePass3_2 = false;
					singlePass4_2 = false;
					singlePass5_2 = false;
					singlePass6_2 = false;
					singlePass7_2 = false;
					singlePass8_2 = false;
					singlePass9_2 = false;
					singlePass10_2 = false;
					singlePass11_2 = false;
					singlePass12_2 = false;
					singlePass13_2 = false;
					singlePass14_2 = false;
					singlePass15_2 = false;

				}

			}

			if (speed < 0)
			{
				speed += 0.2 / stage.frameRate;
				if (speed <= 0)
				{
					speed = 0;
					singlePass1 = false;
					singlePass2 = false;
					singlePass3 = false;
					singlePass4 = false;
					singlePass5 = false;
					singlePass6 = false;
					singlePass7 = false;
					singlePass8 = false;
					singlePass9 = false;
					singlePass10 = false;
					singlePass11 = false;
					singlePass12 = false;
					singlePass13 = false;
					singlePass14 = false;
					singlePass15 = false;

					singlePass1_2 = false;
					singlePass2_2 = false;
					singlePass3_2 = false;
					singlePass4_2 = false;
					singlePass5_2 = false;
					singlePass6_2 = false;
					singlePass7_2 = false;
					singlePass8_2 = false;
					singlePass9_2 = false;
					singlePass10_2 = false;
					singlePass11_2 = false;
					singlePass12_2 = false;
					singlePass13_2 = false;
					singlePass14_2 = false;
					singlePass15_2 = false;

				}

			}

		}



		public function HitTestCheck()
		{


			if (this.hitTestObject(mRef.c1) == true)
			{
				if (mRef.c1.objState == "moving")
				{
					if (singlePass1 == false)
					{
						singlePass1 = true;
						angleDegLocal = mRef.c1.localAngleDeg;
						speed = mRef.c1.speedNum;
					}
					mRef.c1.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c2) == true)
			{
				if (mRef.c2.objState == "moving")
				{
					if (singlePass2 == false)
					{
						singlePass2 = true;
						angleDegLocal = mRef.c2.localAngleDeg;
						speed = mRef.c2.speedNum;
					}
					mRef.c2.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c3) == true)
			{
				if (mRef.c3.objState == "moving")
				{
					if (singlePass3 == false)
					{
						singlePass3 = true;
						angleDegLocal = mRef.c3.localAngleDeg;
						speed = mRef.c3.speedNum;
					}
					mRef.c3.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c4) == true)
			{
				if (mRef.c4.objState == "moving")
				{
					if (singlePass4 == false)
					{
						singlePass4 = true;
						angleDegLocal = mRef.c4.localAngleDeg;
						speed = mRef.c4.speedNum;
					}
					mRef.c4.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c5) == true)
			{
				if (mRef.c5.objState == "moving")
				{
					if (singlePass5 == false)
					{
						singlePass5 = true;
						angleDegLocal = mRef.c5.localAngleDeg;
						speed = mRef.c5.speedNum;
					}
					mRef.c5.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c6) == true)
			{
				if (mRef.c6.objState == "moving")
				{
					if (singlePass6 == false)
					{
						singlePass6 = true;
						angleDegLocal = mRef.c6.localAngleDeg;
						speed = mRef.c6.speedNum;
					}
					mRef.c6.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c7) == true)
			{
				if (mRef.c7.objState == "moving")
				{
					if (singlePass7 == false)
					{
						singlePass7 = true;
						angleDegLocal = mRef.c7.localAngleDeg;
						speed = mRef.c7.speedNum;
					}
					mRef.c7.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c8) == true)
			{
				if (mRef.c8.objState == "moving")
				{
					if (singlePass8 == false)
					{
						singlePass8 = true;
						angleDegLocal = mRef.c8.localAngleDeg;
						speed = mRef.c8.speedNum;
					}
					mRef.c8.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c9) == true)
			{
				if (mRef.c9.objState == "moving")
				{
					if (singlePass9 == false)
					{
						singlePass9 = true;
						angleDegLocal = mRef.c9.localAngleDeg;
						speed = mRef.c9.speedNum;
					}
					mRef.c9.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c10) == true)
			{
				if (mRef.c10.objState == "moving")
				{
					if (singlePass10 == false)
					{
						singlePass10 = true;
						angleDegLocal = mRef.c10.localAngleDeg;
						speed = mRef.c10.speedNum;
					}
					mRef.c10.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c11) == true)
			{
				if (mRef.c11.objState == "moving")
				{
					if (singlePass11 == false)
					{
						singlePass11 = true;
						angleDegLocal = mRef.c11.localAngleDeg;
						speed = mRef.c11.speedNum;
					}
					mRef.c11.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c12) == true)
			{
				if (mRef.c12.objState == "moving")
				{
					if (singlePass12 == false)
					{
						singlePass12 = true;
						angleDegLocal = mRef.c12.localAngleDeg;
						speed = mRef.c12.speedNum;
					}
					mRef.c12.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c13) == true)
			{
				if (mRef.c13.objState == "moving")
				{
					if (singlePass13 == false)
					{
						singlePass13 = true;
						angleDegLocal = mRef.c13.localAngleDeg;
						speed = mRef.c13.speedNum;
					}
					mRef.c13.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c14) == true)
			{
				if (mRef.c14.objState == "moving")
				{
					if (singlePass14 == false)
					{
						singlePass14 = true;
						angleDegLocal = mRef.c14.localAngleDeg;
						speed = mRef.c14.speedNum;
					}
					mRef.c14.speedNum -= minusAmount;
				}
			}

			if (this.hitTestObject(mRef.c15) == true)
			{
				if (mRef.c15.objState == "moving")
				{
					if (singlePass15 == false)
					{
						singlePass15 = true;
						angleDegLocal = mRef.c15.localAngleDeg;
						speed = mRef.c15.speedNum;
					}
					mRef.c15.speedNum -= minusAmount;
				}
			}



			if (singlePassRandom == false)
			{
				singlePassRandom = true;

				randomAngleDeg = Math.round(Math.random() * 40)
				randomPosOrNeg = Math.round(Math.random())

				if (randomPosOrNeg == 1)
				{
					randomAngleDeg = -randomAngleDeg
				}
				angleDegLocal += randomAngleDeg;
			}

			if (this.x > 800)
			{
				objState = "init"
			}
			if (this.x < 0)
			{
				objState = "init"
			}
			if (this.y > 600)
			{
				objState = "init"
			}
			if (this.y < 0)
			{
				objState = "init"
			}
			//
		}
		//


	}

}