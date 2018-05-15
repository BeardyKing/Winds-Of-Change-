package
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;


	public class WorkerTestObj extends MovieClip
	{

		var mRef: MovieClip;

		var objState: String = "boot"

		var holdingAmount: Number = 0;



		var hypotDist: Number = 0;
		var angleRad: Number = 0;
		var angleDeg: Number = 0;

		var nearestFarm: String = "";
		var thisHome: String = "";
		var thisFarm: String = "";

		var fDist1: Number = 0;
		var fDist2: Number = 0;
		var fDist3: Number = 0;
		var fDist4: Number = 0;
		var fDist5: Number = 0;

		var maxFrameCounter: Number = stage.frameRate;
		var frameCounter: Number = 0


		public function WorkerTestObj()
		{
			mRef = MovieClip(this.parent)
			//trace("start " + this.name);
			this.addEventListener(Event.ENTER_FRAME, Loop)
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown)
			stage.addEventListener(KeyboardEvent.KEY_UP, KeyUp)
			// constructor code
		}

		public function Loop(e: Event)
		{
			//trace(holdingAmount + " " + this.name);
			frameCounter++;
			if (frameCounter >= maxFrameCounter)
			{
				////trace(objState + " " + this.name)
				////trace(fDist1 + " fDist1 " + this.name);
				////trace(fDist2 + " fDist2 " + this.name);

				////trace(thisFarm + " " + this.name + " nearest");
				//trace(angleRad + " rad");
				//trace(angleDeg + " deg");
				frameCounter = 0
			}
			if (objState == "boot")
			{
				this.x += Math.cos(angleDeg) * 1;
				this.y += Math.sin(angleDeg) * 1;

				fDist1 = Math.sqrt((this.x - mRef.f1.x) * (this.x - mRef.f1.x) + (this.y - mRef.f1.y) * (this.y - mRef.f1.y))
				if (mRef.f1.riceTotal <= 0)
				{
					fDist1 = Infinity;
				}
				fDist2 = Math.sqrt((this.x - mRef.f2.x) * (this.x - mRef.f2.x) + (this.y - mRef.f2.y) * (this.y - mRef.f2.y))
				if (mRef.f2.riceTotal <= 0)
				{
					fDist2 = Infinity;
				}
				fDist3 = Math.sqrt((this.x - mRef.f3.x) * (this.x - mRef.f3.x) + (this.y - mRef.f3.y) * (this.y - mRef.f3.y))
				if (mRef.f3.riceTotal <= 0)
				{
					fDist3 = Infinity;
				}
				fDist4 = Math.sqrt((this.x - mRef.f4.x) * (this.x - mRef.f4.x) + (this.y - mRef.f4.y) * (this.y - mRef.f4.y))
				if (mRef.f4.riceTotal <= 0)
				{
					fDist4 = Infinity;
				}
				fDist5 = Math.sqrt((this.x - mRef.f5.x) * (this.x - mRef.f5.x) + (this.y - mRef.f5.y) * (this.y - mRef.f5.y))
				if (mRef.f5.riceTotal <= 0)
				{
					fDist5 = Infinity;
				}

				if (fDist1 < fDist2 &&
					fDist1 < fDist3 &&
					fDist1 < fDist2 &&
					fDist1 < fDist4)
				{
					nearestFarm = mRef.f1.name;
					thisFarm = mRef.f1.name;
					FindMoveAngle(this.x, this.y, mRef.f1.x, mRef.f1.y);
					//trace(fDist1)
				}
				//x1, y1, x2, y2

				if (fDist2 < fDist1 &&
					fDist2 < fDist3 &&
					fDist2 < fDist4 &&
					fDist2 < fDist5)
				{
					nearestFarm = mRef.f2.name;
					thisFarm = mRef.f2.name;
					FindMoveAngle(this.x, this.y, mRef.f2.x, mRef.f2.y);
					//trace(fDist2)
				}

				if (fDist3 < fDist1 &&
					fDist3 < fDist2 &&
					fDist3 < fDist4 &&
					fDist3 < fDist5)
				{
					nearestFarm = mRef.f3.name;
					thisFarm = mRef.f3.name;
					FindMoveAngle(this.x, this.y, mRef.f3.x, mRef.f3.y);
					//trace(fDist3)
				}

				if (fDist4 < fDist1 &&
					fDist4 < fDist2 &&
					fDist4 < fDist3 &&
					fDist4 < fDist5)
				{
					nearestFarm = mRef.f4.name;
					thisFarm = mRef.f4.name;
					FindMoveAngle(this.x, this.y, mRef.f4.x, mRef.f4.y);
					//trace(fDist4)
				}

				if (fDist5 < fDist1 &&
					fDist5 < fDist2 &&
					fDist5 < fDist3 &&
					fDist5 < fDist4)
				{
					nearestFarm = mRef.f5.name;
					thisFarm = mRef.f5.name;
					FindMoveAngle(this.x, this.y, mRef.f5.x, mRef.f5.y);
					//trace(fDist5)
				}

				//objState = "move";

				// FIND NEAREST OBJ;
				if (nearestFarm == "f1")
				{
					if (this.hitTestObject(mRef.f1) == true)
					{
						objState = "move";
					}
				}
				if (nearestFarm == "f2")
				{
					if (this.hitTestObject(mRef.f2) == true)
					{
						objState = "move";
					}
				}
				if (nearestFarm == "f3")
				{
					if (this.hitTestObject(mRef.f3) == true)
					{
						objState = "move";
					}
				}
				if (nearestFarm == "f4")
				{
					if (this.hitTestObject(mRef.f4) == true)
					{
						objState = "move";
					}
				}
				if (nearestFarm == "f5")
				{
					if (this.hitTestObject(mRef.f5) == true)
					{
						objState = "move";
					}
				}

			}
			if (objState == "move")
			{

				if (this.hitTestObject(mRef.f1) == true)
				{
					if (mRef.f1.riceTotal <= 0)
					{
						objState = "goHome"
					}
					if (mRef.f1.riceTotal > 0)
					{
						mRef.f1.riceTotal -= 0.1;
						holdingAmount += 0.1;
					}
					if (holdingAmount >= 10)
					{
						objState = "goHome"
					}
				}

				if (this.hitTestObject(mRef.f2) == true)
				{
					if (mRef.f2.riceTotal <= 0)
					{
						objState = "goHome"
					}
					if (mRef.f2.riceTotal > 0)
					{
						mRef.f2.riceTotal -= 0.1;
						holdingAmount += 0.1;
					}
					if (holdingAmount >= 10)
					{
						objState = "goHome"
					}
				}

				if (this.hitTestObject(mRef.f3) == true)
				{
					if (mRef.f3.riceTotal <= 0)
					{
						objState = "goHome"
					}
					if (mRef.f3.riceTotal > 0)
					{
						mRef.f3.riceTotal -= 0.1;
						holdingAmount += 0.1;
					}
					if (holdingAmount >= 10)
					{
						objState = "goHome"
					}
				}

				if (this.hitTestObject(mRef.f4) == true)
				{
					//trace("aaaaaa from f4")
					if (mRef.f4.riceTotal <= 0)
					{
						objState = "goHome"
					}
					if (mRef.f4.riceTotal > 0)
					{
						mRef.f4.riceTotal -= 0.1;
						holdingAmount += 0.1;

					}
					if (holdingAmount >= 10)
					{
						objState = "goHome"
					}
				}

				if (this.hitTestObject(mRef.f5) == true)
				{
					if (mRef.f5.riceTotal <= 0)
					{
						objState = "goHome"
					}
					if (mRef.f5.riceTotal > 0)
					{
						mRef.f5.riceTotal -= 0.1;
						holdingAmount += 0.1;
					}
					if (holdingAmount >= 10)
					{
						objState = "goHome"
					}
				}




			}
			if (objState == "goHome")
			{
				////trace("aaaaaaaaaaaaaaaaaaaa")
				FindMoveAngle(this.x, this.y, mRef.farmTown1.x, mRef.farmTown1.y)
				this.x += Math.cos(angleDeg) * 1;
				this.y += Math.sin(angleDeg) * 1;
				if (this.hitTestObject(mRef.farmTown1) == true)
				{
					if (mRef.f1.riceTotal <= 0 &&
						mRef.f2.riceTotal <= 0 &&
						mRef.f3.riceTotal <= 0 &&
						mRef.f4.riceTotal <= 0 &&
						mRef.f5.riceTotal <= 0
					)
					{
						holdingAmount = 0;
					}
					else
					{
						objState = "boot"
						holdingAmount = 0;
					}
				}

			}
			if (objState == "collecting")
			{


			}
			if (objState == "dead")
			{

			}

			//LOOP
		}
		// LOOP
		public function FindMoveAngle(x1, y1, x2, y2)
		{
			var deltaX: Number = x1 - x2
			var deltaY: Number = y1 - y2
			////trace(x1 + " x1")
			////trace(x2 + " x2")
			////trace(y1 + " y1")
			////trace(y2 + " y2")
			// CODE HERE IS WRONG FIX ON MONDAY
			// PRODUCES WRONG ANGLE 
			angleRad = Math.atan2(deltaY, deltaX)

			angleDeg = angleRad * 180 / Math.PI;
			angleDeg -= 45
			return;
			//objState = "move"

		}

		public function KeyDown(e: KeyboardEvent)
		{
			objState = "move"

			if (e.keyCode == Keyboard.W)
			{
				this.y -= 1;

			}
			if (e.keyCode == Keyboard.S)
			{
				this.y += 1;

			}
			if (e.keyCode == Keyboard.A)
			{
				this.x -= 1;

			}
			if (e.keyCode == Keyboard.D)
			{
				this.x += 1;

			}
		}

		public function KeyUp(e: KeyboardEvent)
		{
			objState = "boot"

			if (e.keyCode == Keyboard.W)
			{
				this.y -= 1;

			}
			if (e.keyCode == Keyboard.S)
			{
				this.y += 1;

			}
			if (e.keyCode == Keyboard.A)
			{
				this.x -= 1;

			}
			if (e.keyCode == Keyboard.D)
			{
				this.x += 1;

			}
		}

	}

}