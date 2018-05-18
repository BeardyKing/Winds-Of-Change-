package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class BWorkerFisher extends MovieClip
	{

		var mRef: MovieClip;
		var objState: String = "idle";

		var maxFish: Number = 15
		var isAlive: Boolean = true;
		var currentFishAmount: Number = 0;
		var objHealth: Number = 100;
		var hitByWhirlwind: Boolean = false;
		var hitByStorm: Boolean = false;
		var fishingHomeTownName: String = "";
		var isPoisoned: Boolean = false;
		var currentFishingSpotName: String = "";
		var speed: Number = 0.3;
		var resetSpeed: Number = speed
		var objAngle: Number = 0;
		var angleRad: Number = 0;
		var isCollecting: Boolean = false;
		var dirHasBeenChanged: Boolean = false;
		var dirHasBeenChangedCounter: Number = 180;

		public function BWorkerFisher()
		{
			////trace("inside " + this.name);
			mRef = MovieClip(this.parent);


			this.addEventListener(Event.ENTER_FRAME, Loop);
		}

		public function Loop(e: Event)
		{ // loop start
			if (mRef.objState == "play")
			{
				//const if's
				if (this.name == "bFisher1" && isAlive == true)
				{
					if (mRef.bFishingTown1.isOnFireBool == true)
					{
						isAlive = false;
						this.visible = false;
					}
					else
					{
						this.visible = true;
					}

					if (this.x < 115)
					{
						objState = "idle"
					}
					//const if's

					if (objState == "idle")
					{

						objState = "findFishingSpot"
					}

					if (objState == "findFishingSpot")
					{
						mRef.fishPoint1.x = mRef.water1.x;
						mRef.fishPoint1.y = mRef.water1.y;
						FindNewFishingLoc(mRef.water1.width, mRef.water1.height);
					}

					if (objState == "goToFishingSpot")
					{
						this.scaleX = 1;
						this.gotoAndStop(1);
						FindMoveAngle(this.x, this.y, mRef.fishPoint1.x, mRef.fishPoint1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (this.hitTestObject(mRef.fishPoint1) == true)
						{
							objState = "collectingFish"
						}
					}

					if (objState == "collectingFish")
					{

						this.gotoAndStop(2);

						if (this.hitTestObject(mRef.fishPoint1) == true)
						{
							currentFishAmount += 0.1;
							if (currentFishAmount >= maxFish)
							{
								objState = "goToFishingTown"
							}
						}
					}

					if (objState == "goToFishingTown")
					{
						this.scaleX = -1;
						this.gotoAndStop(1);
						FindMoveAngle(this.x, this.y, mRef.bFishingTown1.x, mRef.bFishingTown1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (this.hitTestObject(mRef.bFishingTown1) == true)
						{
							speed = 0;
							mRef.bFishingTown1.currentFishAmount += 0.1
							currentFishAmount -= 0.05;
							if (currentFishAmount <= 0)
							{
								currentFishAmount = 0;
								objState = "idle"
								speed = resetSpeed;
							}
						}
					}

					if (objState == "dead")
					{

					}

					if (objState == "changeCourse")
					{

					}
				}

				/////////////////////////////////////////// FISH 3 ////////////////////////////////////////////
				if (this.name == "bFisher3" && isAlive == true)
				{

					if (objState == "idle")
					{

						objState = "findFishingSpot"
					}

					if (objState == "findFishingSpot")
					{

						mRef.fishPoint3.x = mRef.water3.x;
						mRef.fishPoint3.y = mRef.water3.y;
						FindNewFishingLoc(mRef.water3.width, mRef.water3.height);
					}

					if (objState == "goToFishingSpot")
					{
						this.scaleX = -1;
						this.gotoAndStop(1);
						FindMoveAngle(this.x, this.y, mRef.fishPoint3.x, mRef.fishPoint3.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (this.hitTestObject(mRef.fishPoint3) == true)
						{
							objState = "collectingFish"
						}
					}

					if (objState == "collectingFish")
					{
						this.scaleX = -1;
						this.gotoAndStop(2);
						if (this.hitTestObject(mRef.fishPoint3) == true)
						{
							currentFishAmount += 0.1;
							if (currentFishAmount >= maxFish)
							{
								objState = "goToFishingTown"
							}
						}
					}

					if (objState == "goToFishingTown")
					{
						this.scaleX = 1;
						this.gotoAndStop(1);
						FindMoveAngle(this.x, this.y, mRef.bFishingTown3.x, mRef.bFishingTown3.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (this.hitTestObject(mRef.bFishingTown3) == true)
						{
							speed = 0;
							mRef.bFishingTown3.currentFishAmount += 0.1
							currentFishAmount -= 0.05;
							if (currentFishAmount <= 0)
							{
								currentFishAmount = 0;
								objState = "idle"
								speed = resetSpeed;
							}
						}
					}

					if (objState == "dead")
					{

					}

					if (objState == "changeCourse")
					{

					}
				}

			}
		// loop end
		}
		// loop end

		public function FindMoveAngle(x1, y1, x2, y2)
		{

			var deltaX: Number = x1 - x2
			var deltaY: Number = y1 - y2

			angleRad = Math.atan2(deltaY, deltaX)


			objAngle = angleRad * 180 / Math.PI;
			objAngle -= 45;
		}

		public function FindNewFishingLoc(maxX, maxY)
		{

			var waterName: String = ""
			var newRandomX: Number;
			var newRandomY: Number;

			if (this.name == "bFisher1")
			{
				currentFishingSpotName = "fishPoint1"
				waterName = "water1"
				newRandomX = Math.round(Math.random() * maxX);
				newRandomY = Math.round(Math.random() * maxY);

				mRef.fishPoint1.x = newRandomX + mRef.water1.x
				mRef.fishPoint1.y = newRandomY + mRef.water1.y
			}

			if (this.name == "bFisher3")
			{
				currentFishingSpotName = "fishPoint3"
				waterName = "water3"
				newRandomX = Math.round(Math.random() * maxX);
				newRandomY = Math.round(Math.random() * maxY);

				mRef.fishPoint3.x = newRandomX + mRef.water3.x
				mRef.fishPoint3.y = newRandomY + mRef.water3.y
			}
			objState = "goToFishingSpot";
		}
	}
}