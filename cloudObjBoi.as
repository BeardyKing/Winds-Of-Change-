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


		var cloudState: String = "white"

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
				alphaCounter += 1;
				this.gotoAndStop(3);
				if (alphaCounter > 3)
				{
					alphaCounter = 0;
					alphaBoolSwitch = !alphaBoolSwitch;
				}
				if (alphaBoolSwitch == true)
				{
					this.visible = true;
				}
				else
				{
					this.visible = false;

				}
				// add rain obj
				// maybe make an active hitbox for whole obj
			}


		}

		public function Loop(e: Event)
		{

			GlobalDirMove();
			AnimationHandler();

			if (objState == "init")
			{
				speed = 0
				randomXPos = Math.round(Math.random() * 800);
				randomYPos = Math.round(Math.random() * 500);
				if ((randomXPos > 100 && randomXPos < 700) && (randomYPos > 50 && randomYPos < 450))
				{
					//trace(randomXPos)
					//trace(randomXPos)
					objState = "init"
					this.alpha = 0;
					//cloudState = ""
				}
				else
				{
					objState = "idle"
				}

				randomChangeLightGrey = Math.round(Math.random() * 15 + 2);

				randomChangeGrey = Math.round(Math.random() * 20 + 2)
				randomChangeGreyStorm = Math.round(Math.random() * 10 + 8)
				randomChangeReset = Math.round(Math.random() * 8 + 3)
				//trace(randomChangeLightGrey + " RANDOM " + this.name)
				//trace("startUp")

				// REMOVED CLOUD LOC
				//this.x = randomXPos;
				//this.y = randomYPos;
			}

			objStateCounter += 1;
			if (objStateCounter >= 60)
			{
				objStateCounter = 0;
				objStateCounterSeconds += 1
				if (objStateCounterSeconds >= randomChangeLightGrey && cloudState == "white")
				{
					cloudState = "lightGrey"
					objStateCounterSeconds = 0;
					//trace(cloudState + " " + this.name)
				}
				else if (objStateCounterSeconds >= randomChangeGrey && cloudState == "lightGrey")
				{
					cloudState = "grey"
					objStateCounterSeconds = 0
					//trace(cloudState + " " + this.name)
				}
				else if (objStateCounterSeconds >= randomChangeGreyStorm && cloudState == "grey")
				{
					cloudState = "greyStorm"
					objStateCounterSeconds = 0;
					//trace(cloudState + " " + this.name)
				}
				else if (objStateCounterSeconds >= randomChangeReset && cloudState == "greyStorm")
				{
					cloudState = "resetCloud"
				}
			}
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

			if (this.name == "cloudBoi1")
			{
				//trace(objStateCounter);
				//trace(objStateCounterSeconds);
				//trace(mRef.c1.localAngleDeg)
			}
			if (null)
			{

			}
			/*if(speed != 0)
			{
			trace(speed + "  " + this.name)
			}*/
			if (objState == "idle")
			{
				this.x -= Math.cos(angleDegLocal) * speed;
				this.y += Math.sin(angleDegLocal) * speed;

				HitTestCheck();

				ResetHitTest();
				//this.alpha = 0.7;
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