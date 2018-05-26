package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class CloudObj extends MovieClip
	{
		var isBeingUsed: Boolean = false;

		var mRef: MovieClip;
		var objState: String = "init";

		var localAngleDeg: Number = 0;
		var randomAngleDeg: Number = 0;
		var randomPosOrNeg: Number = 0;

		var speedNum: Number = 0;

		var xLoc: Number = 0;
		var yLoc: Number = 0;

		var startX: Number = 0;
		var startY: Number = 0;
		var objHealth: Number = 100;
		var singlePassAnim: Boolean = false;
		var singlePassAnim2: Boolean = false;
		var animCounter: Number = 0;
		var animCounter2: Number = 0;



		public function CloudObj()
		{
			mRef = MovieClip(this.parent);
			// constructor code
			this.addEventListener(Event.ENTER_FRAME, Loop);
			this.addEventListener(Event.EXIT_FRAME, ExitLoop)
		}
		public function ExitLoop(e: Event)
		{

		}
		public function Loop(E: Event)
		{

			if (objState == "waiting")
			{

				animCounter += 1;
				if (animCounter >= 3)
				{
					animCounter = 0;
					nextFrame();

				}
				if (currentFrame >= 16)
				{
					gotoAndStop(2);
				}
			}
			if (objState == "moving")
			{
				animCounter2 += 1;
				if (animCounter2 >= 3)
				{
					animCounter2 = 0;
					nextFrame();

				}
				if (currentFrame >= 29)
				{
					gotoAndStop(17);
				}

			}
			if (objState == "idle")
			{

			}

			if (this.name == "c1")
			{
				////trace(objState + "   objState")
				////trace(localAngleDeg + "      anglle deg local")
			}
			////trace(objState + "" + this.name)
			if (objState == "init")
			{
				startX = this.x
				startY = this.y;

				objState = "idle"
			}
			if (objState == "idle")
			{
				this.rotation = 0;
				if (this.name == "c1" && mRef.clickLoc.windCounter == 1 && mRef.clickLoc.mouseDown == true)
				{

					isBeingUsed = true
					this.x = mRef.mouseDir.x + 12
					this.y = mRef.mouseDir.y + 12
					objState = "waiting"
					this.alpha = 0
				}

				if (this.name == "c2" && mRef.clickLoc.windCounter == 2 && mRef.clickLoc.mouseDown == true)
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x - 12
					this.y = mRef.mouseDir.y - 12
					objState = "waiting"
					this.alpha = 0
				}

				if (this.name == "c3" && mRef.clickLoc.windCounter == 3 && mRef.clickLoc.mouseDown == true)
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x + 12
					this.y = mRef.mouseDir.y - 12
					objState = "waiting"
					this.alpha = 0
				}

				if (this.name == "c4" && mRef.clickLoc.windCounter == 4 && mRef.clickLoc.mouseDown == true)
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x - 12
					this.y = mRef.mouseDir.y + 12
					objState = "waiting"
					this.alpha = 0
				}

				if (this.name == "c5" && mRef.clickLoc.windCounter == 5 && mRef.clickLoc.mouseDown == true)
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x - 20
					this.y = mRef.mouseDir.y
					objState = "waiting"
					this.alpha = 0
				}

				if (this.name == "c6" && mRef.clickLoc.windCounter == 6 && mRef.clickLoc.mouseDown == true)
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x + 20
					this.y = mRef.mouseDir.y
					objState = "waiting"
					this.alpha = 0
				}

				if (this.name == "c7" && mRef.clickLoc.windCounter == 7 && mRef.clickLoc.mouseDown == true)
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x
					this.y = mRef.mouseDir.y - 20
					objState = "waiting"
					this.alpha = 0
				}

				if (this.name == "c8" && mRef.clickLoc.windCounter == 8 && mRef.clickLoc.mouseDown == true)
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x
					this.y = mRef.mouseDir.y + 20
					objState = "waiting"
					this.alpha = 0
				}

				if (this.name == "c9" && mRef.clickLoc.windCounter == 9 && mRef.clickLoc.mouseDown == true)
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x - 30
					this.y = mRef.mouseDir.y - 15
					objState = "waiting"
					this.alpha = 0
				}

				if (this.name == "c10" && mRef.clickLoc.windCounter == 10 && mRef.clickLoc.mouseDown == true)
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x - 15
					this.y = mRef.mouseDir.y - 30
					objState = "waiting"
					this.alpha = 0
				}

				if (this.name == "c11" && mRef.clickLoc.windCounter == 11 && mRef.clickLoc.mouseDown == true)
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x + 30
					this.y = mRef.mouseDir.y + 15
					objState = "waiting"
					this.alpha = 0
				}

				if (this.name == "c12" && mRef.clickLoc.windCounter == 12 && mRef.clickLoc.mouseDown == true)
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x - 8
					this.y = mRef.mouseDir.y - 18
					objState = "waiting"
					this.alpha = 0
				}

				if (this.name == "c13" && mRef.clickLoc.windCounter == 13 && mRef.clickLoc.mouseDown == true)
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x - 18
					this.y = mRef.mouseDir.y - 8
					objState = "waiting"
					this.alpha = 0
				}

				if (this.name == "c14" && mRef.clickLoc.windCounter == 14 && mRef.clickLoc.mouseDown == true)
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x + 18
					this.y = mRef.mouseDir.y + 8
					objState = "waiting"
					this.alpha = 0
				}

				if (this.name == "c15" && mRef.clickLoc.windCounter == 15 && mRef.clickLoc.mouseDown == true)
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x - 8
					this.y = mRef.mouseDir.y - 18
					objState = "waiting"
					this.alpha = 0
				}

				if (this.name == "c1_2" && mRef.clickLoc.windCounter == 1 && mRef.clickLoc.mouseDown == true && mRef.c1.objState == "moving")
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x + 12
					this.y = mRef.mouseDir.y + 12
					objState = "waiting"
					this.alpha = 0
				}
				if (this.name == "c2_2" && mRef.clickLoc.windCounter == 2 && mRef.clickLoc.mouseDown == true && mRef.c2.objState == "moving")
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x - 12
					this.y = mRef.mouseDir.y - 12
					objState = "waiting"
					this.alpha = 0
				}
				if (this.name == "c3_2" && mRef.clickLoc.windCounter == 3 && mRef.clickLoc.mouseDown == true && mRef.c3.objState == "moving")
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x + 12
					this.y = mRef.mouseDir.y - 12
					objState = "waiting"
					this.alpha = 0
				}
				if (this.name == "c4_2" && mRef.clickLoc.windCounter == 4 && mRef.clickLoc.mouseDown == true && mRef.c4.objState == "moving")
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x - 12
					this.y = mRef.mouseDir.y + 12
					objState = "waiting"
					this.alpha = 0
				}
				if (this.name == "c5_2" && mRef.clickLoc.windCounter == 5 && mRef.clickLoc.mouseDown == true && mRef.c5.objState == "moving")
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x - 20
					this.y = mRef.mouseDir.y
					objState = "waiting"
					this.alpha = 0
				}
				if (this.name == "c6_2" && mRef.clickLoc.windCounter == 6 && mRef.clickLoc.mouseDown == true && mRef.c6.objState == "moving")
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x + 20
					this.y = mRef.mouseDir.y
					objState = "waiting"
					this.alpha = 0
				}
				if (this.name == "c7_2" && mRef.clickLoc.windCounter == 7 && mRef.clickLoc.mouseDown == true && mRef.c7.objState == "moving")
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x
					this.y = mRef.mouseDir.y - 20
					objState = "waiting"
					this.alpha = 0
				}
				if (this.name == "c8_2" && mRef.clickLoc.windCounter == 8 && mRef.clickLoc.mouseDown == true && mRef.c8.objState == "moving")
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x
					this.y = mRef.mouseDir.y + 20
					objState = "waiting"
					this.alpha = 0
				}
				if (this.name == "c9_2" && mRef.clickLoc.windCounter == 9 && mRef.clickLoc.mouseDown == true && mRef.c9.objState == "moving")
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x - 30
					this.y = mRef.mouseDir.y - 15
					objState = "waiting"
					this.alpha = 0
				}
				if (this.name == "c10_2" && mRef.clickLoc.windCounter == 10 && mRef.clickLoc.mouseDown == true && mRef.c10.objState == "moving")
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x - 15
					this.y = mRef.mouseDir.y - 30
					objState = "waiting"
					this.alpha = 0
				}
				if (this.name == "c11_2" && mRef.clickLoc.windCounter == 11 && mRef.clickLoc.mouseDown == true && mRef.c11.objState == "moving")
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x + 30
					this.y = mRef.mouseDir.y + 15
					objState = "waiting"
					this.alpha = 0
				}
				if (this.name == "c12_2" && mRef.clickLoc.windCounter == 12 && mRef.clickLoc.mouseDown == true && mRef.c12.objState == "moving")
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x - 8
					this.y = mRef.mouseDir.y - 18
					objState = "waiting"
					this.alpha = 0
				}
				if (this.name == "c13_2" && mRef.clickLoc.windCounter == 13 && mRef.clickLoc.mouseDown == true && mRef.c13.objState == "moving")
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x - 18
					this.y = mRef.mouseDir.y - 8
					objState = "waiting"
					this.alpha = 0
				}
				if (this.name == "c14_2" && mRef.clickLoc.windCounter == 14 && mRef.clickLoc.mouseDown == true && mRef.c14.objState == "moving")
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x + 18
					this.y = mRef.mouseDir.y + 8
					objState = "waiting"
					this.alpha = 0
				}
				if (this.name == "c15_2" && mRef.clickLoc.windCounter == 15 && mRef.clickLoc.mouseDown == true && mRef.c15.objState == "moving")
				{
					isBeingUsed = true
					this.x = mRef.mouseDir.x - 8
					this.y = mRef.mouseDir.y - 18
					objState = "waiting"
					this.alpha = 0
				}

			}

			// end idle
			if (objState == "waiting")
			{
				this.alpha += 0.04
				if (this.alpha > 1)
				{
					this.alpha = 1
					if (mRef.clickLoc.windCounter >= 5)
					{
						this.alpha = 5;
					}
				}
				speedNum = this.alpha;

				////trace(this.name)
				////trace(mRef.clickLoc.mouseDown)

				if (mRef.clickLoc.mouseDown == false)
				{
					randomAngleDeg = Math.round(Math.random() * 10)


					randomPosOrNeg = Math.round(Math.random())
					////trace(randomPosOrNeg)

					if (randomPosOrNeg == 1)
					{
						////trace(randomAngleDeg + "+ ve")
						randomAngleDeg = -randomAngleDeg
						////trace(randomAngleDeg + "-ve")
						////trace()
					}



					////trace("goToMove")
					this.rotation = mRef.clickLoc.angleDeg;
					isBeingUsed = false;

					localAngleDeg = (mRef.clickLoc.angleDeg + randomAngleDeg) / 180 * Math.PI;
					localAngleDeg = -localAngleDeg;
					objState = "moving"




				}
			}
			// end waiting
			if (objState == "moving")
			{
				speedNum -= 0.1 / stage.frameRate;
				if (speedNum <= 0)
				{
					speedNum = 0
					this.alpha -= 0.05
					if (this.alpha <= 0)
					{
						this.alpha = 0
						objState = "idle"
					}
				}


				this.alpha = speedNum;

				if (this.alpha > 1)
				{
					this.alpha = 1;
				}
				this.x -= Math.cos(localAngleDeg) * speedNum;
				this.y += Math.sin(localAngleDeg) * speedNum;

				//HitTestCheck();

				if (this.x > 800)
				{
					//this.x = 0;
					objState = "idle";
					this.x = startX
					this.y = startY
				}

				if (this.x < 0)
				{
					//this.x = 800;
					objState = "idle";
					this.x = startX
					this.y = startY
				}

				if (this.y < 0)
				{
					//this.y = 600;
					objState = "idle";
					this.x = startX
					this.y = startY
				}

				if (this.y > 600)
				{
					//this.y = 0;
					objState = "idle";
					this.x = startX
					this.y = startY
				}
			}



			//loop
		}
		// loop


	}


}