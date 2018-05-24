package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class FighterCart extends MovieClip
	{

		var mRef: MovieClip;
		var nodeNumber: Number = 1;
		var objState: String = "idle"

		var speed: Number = 0.2;
		var objAngle: Number = 0;
		var angleRad: Number = 0;
		var fDist1: Number = 0;
		var hypotDist: Number = 10;
		var isInWater: Boolean = false;

		var objHealth: Number = 100;

		var isActiveBool: Boolean = false
		var dmgCounter: Number = 0;
		var resetCounter: Number = 0;

		var overwriteAll: Boolean = false;

		public function FighterCart()
		{
			// constructor code
			mRef = MovieClip(this.parent);

			this.addEventListener(Event.ENTER_FRAME, Loop);
		}

		public function Loop(e: Event)
		{

			//trace(objState + " objState " + this.name)
			//trace(fDist1 + " fDist1 " + this.name)
			if (overwriteAll == false)
			{

				if (objState == "idle")
				{
					if (isActiveBool == true)
					{
						this.alpha = 1;
						objState = "moving"
					}
				}


				if (objState == "moving")
				{
					if (this.alpha != 1)
					{
						this.alpha = 1;
					}
					Node1();
					Node2();
					Node3();
					Node4();
					Node5();
					Node6();
					Node7();
					Node8();
					Node9();
				}

				if (objState == "landed")
				{
					this.alpha -= 0.03;
					if (this.alpha <= 0)
					{
						this.alpha = 0;
						isActiveBool = false;
						objState = "reset";
						objHealth = 100;
						
					}

				}
				if (objState == "reset")
				{
					this.x = 1000;
					nodeNumber = 1;
					objState = "idle"

				}
			}
			if (overwriteAll == true)
			{
				
				resetCounter += 1;
				if (resetCounter >= (stage.frameRate / 4))
				{
					overwriteAll = false;
				}
				dmgCounter += 1;
				if (dmgCounter >= 0 && dmgCounter <= 7)
				{

					// change this to red box later
					this.alpha = 1
				}
				if (dmgCounter >= 7 && dmgCounter <= 14)
				{
					this.alpha = 0.3;
				}
				if (dmgCounter >= 15)
				{
					dmgCounter = 0;
				}
				objHealth -= 100 / (stage.frameRate * 2)
				if(objHealth <= 0 )
				{
					this.alpha = 1;
					objState = "landed"
				}
			}





			trace(overwriteAll + " overwriteAll " + this.name)

			//loop
		}
		//loop

		public function Node1()
		{
			if (nodeNumber == 1)
			{
				fDist1 = Math.sqrt((this.x - mRef.nodeFarm1_1.x) *
					(this.x - mRef.nodeFarm1_1.x) +
					(this.y - mRef.nodeFarm1_1.y) *
					(this.y - mRef.nodeFarm1_1.y))
				FindMoveAngle(this.x, this.y, mRef.nodeFarm1_1.x, mRef.nodeFarm1_1.y);

				this.x += Math.cos(objAngle) * speed;
				this.y += Math.sin(objAngle) * speed;

				if (fDist1 <= hypotDist)
				{
					nodeNumber += 1;
				}
			}
		}
		public function Node2()
		{
			if (nodeNumber == 2)
			{
				fDist1 = Math.sqrt((this.x - mRef.nodeFarm3_1.x) *
					(this.x - mRef.nodeFarm3_1.x) +
					(this.y - mRef.nodeFarm3_1.y) *
					(this.y - mRef.nodeFarm3_1.y))
				FindMoveAngle(this.x, this.y, mRef.nodeFarm3_1.x, mRef.nodeFarm3_1.y);

				this.x += Math.cos(objAngle) * speed;
				this.y += Math.sin(objAngle) * speed;

				if (fDist1 <= hypotDist)
				{
					nodeNumber += 1;
				}
			}
		}
		public function Node3()
		{
			if (nodeNumber == 3)
			{
				fDist1 = Math.sqrt((this.x - mRef.nodeFarm4_1.x) *
					(this.x - mRef.nodeFarm4_1.x) +
					(this.y - mRef.nodeFarm4_1.y) *
					(this.y - mRef.nodeFarm4_1.y))
				FindMoveAngle(this.x, this.y, mRef.nodeFarm4_1.x, mRef.nodeFarm4_1.y);

				this.x += Math.cos(objAngle) * speed;
				this.y += Math.sin(objAngle) * speed;

				if (fDist1 <= hypotDist)
				{
					nodeNumber += 1;
				}
			}
		}
		public function Node4()
		{
			if (nodeNumber == 4)
			{
				fDist1 = Math.sqrt((this.x - mRef.nodeFarm4_3.x) *
					(this.x - mRef.nodeFarm4_3.x) +
					(this.y - mRef.nodeFarm4_3.y) *
					(this.y - mRef.nodeFarm4_3.y))
				FindMoveAngle(this.x, this.y, mRef.nodeFarm4_3.x, mRef.nodeFarm4_3.y);

				this.x += Math.cos(objAngle) * speed;
				this.y += Math.sin(objAngle) * speed;

				if (fDist1 <= hypotDist)
				{
					nodeNumber += 1;
				}
			}
		}
		public function Node5()
		{
			if (nodeNumber == 5)
			{
				fDist1 = Math.sqrt((this.x - mRef.nodeFarm5_1.x) *
					(this.x - mRef.nodeFarm5_1.x) +
					(this.y - mRef.nodeFarm5_1.y) *
					(this.y - mRef.nodeFarm5_1.y))
				FindMoveAngle(this.x, this.y, mRef.nodeFarm5_1.x, mRef.nodeFarm5_1.y);

				this.x += Math.cos(objAngle) * speed;
				this.y += Math.sin(objAngle) * speed;

				if (fDist1 <= hypotDist)
				{
					nodeNumber += 1;
				}
			}
		}
		public function Node6()
		{
			if (nodeNumber == 6)
			{
				fDist1 = Math.sqrt((this.x - mRef.nodeFarm15_1.x) *
					(this.x - mRef.nodeFarm15_1.x) +
					(this.y - mRef.nodeFarm15_1.y) *
					(this.y - mRef.nodeFarm15_1.y))
				FindMoveAngle(this.x, this.y, mRef.nodeFarm15_1.x, mRef.nodeFarm15_1.y);

				this.x += Math.cos(objAngle) * speed;
				this.y += Math.sin(objAngle) * speed;

				if (fDist1 <= hypotDist)
				{
					nodeNumber += 1;
				}
			}
		}
		public function Node7()
		{
			if (nodeNumber == 7)
			{
				fDist1 = Math.sqrt((this.x - mRef.bFishingTown1.x) *
					(this.x - mRef.bFishingTown1.x) +
					(this.y - mRef.bFishingTown1.y) *
					(this.y - mRef.bFishingTown1.y))
				FindMoveAngle(this.x, this.y, mRef.bFishingTown1.x, mRef.bFishingTown1.y);

				this.x += Math.cos(objAngle) * speed;
				this.y += Math.sin(objAngle) * speed;

				if (fDist1 <= hypotDist)
				{
					nodeNumber += 1;
					isInWater = true;
				}
			}
		}

		public function Node8()
		{
			if (nodeNumber == 8)
			{
				fDist1 = Math.sqrt((this.x - mRef.rFishTown1.x) *
					(this.x - mRef.rFishTown1.x) +
					(this.y - mRef.rFishTown1.y) *
					(this.y - mRef.rFishTown1.y))
				FindMoveAngle(this.x, this.y, mRef.rFishTown1.x, mRef.rFishTown1.y);

				this.x += Math.cos(objAngle) * speed;
				this.y += Math.sin(objAngle) * speed;

				if (fDist1 <= hypotDist)
				{
					if (mRef.rFishTown1.teamState == "red")
					{
						objState = "landed";
						isInWater = false;
						if (mRef.bFighter1.isActiveBool == false)
						{
							mRef.bFighter1.PlaceSamuari(mRef.rFishTown1.x, mRef.rFishTown1.y, "rFishTown1");
						}
						else if (mRef.bFighter2.isActiveBool == false)
						{
							mRef.bFighter2.PlaceSamuari(mRef.rFishTown1.x, mRef.rFishTown1.y, "rFishTown1");
						}
					}
					if (mRef.rFishTown1.teamState == "blue")
					{
						nodeNumber += 1;
						isInWater = false;
					}
				}
			}
		}

		public function Node9()
		{
			if (nodeNumber == 9)
			{
				fDist1 = Math.sqrt((this.x - mRef.rCity.x) *
					(this.x - mRef.rCity.x) +
					(this.y - mRef.rCity.y) *
					(this.y - mRef.rCity.y))
				FindMoveAngle(this.x, this.y, mRef.rCity.x, mRef.rCity.y);

				this.x += Math.cos(objAngle) * speed;
				this.y += Math.sin(objAngle) * speed;

				if (fDist1 <= hypotDist)
				{
					mRef.bFighter1.PlaceSamuari(mRef.rCity.x, (mRef.rCity.y + 40), "rCity");
					objState = "landed";
					nodeNumber += 1;
					isInWater = false;
				}
			}
		}

		public function FindMoveAngle(x1, y1, x2, y2)
		{
			var deltaX: Number = x1 - x2
			var deltaY: Number = y1 - y2

			angleRad = Math.atan2(deltaY, deltaX)


			objAngle = angleRad * 180 / Math.PI;
			//angleRad += (Math.PI/2)
			objAngle -= 45;

			////////trace("done")
			return;

		}
	}

}