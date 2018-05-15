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
			trace("inside " + this.name);
			mRef = MovieClip(this.parent);


			this.addEventListener(Event.ENTER_FRAME, Loop);
		}

		public function Loop(e: Event)
		{ // loop s
			if (mRef.objState == "play")
			{
				
				//this.rotation = objAngle - 45;
				if (this.name == "bFisher1")
				{
					if (this.x < 115)
				{
					objState = "idle"
					trace("")
					trace(objAngle + "  " + this.name)
					trace(mRef.fishPoint1.x + "  fishpoint1 x ")
					trace(mRef.fishPoint1.y + "  fishpoint1 y ")
					trace(mRef.bFishingTown1.x + "  bFishingTown1 x ")
					trace(mRef.bFishingTown1.y + "  bFishingTown1 y ")
					trace(this.x + "  this x ")
					trace(this.y + "  this y ")
					trace("")
					trace("")
					trace("")
					trace("")
					trace("")
					trace("")
					trace("")
					trace("")
					trace("")
					trace("")
					trace("")
					trace("")
					trace("")
					trace("")
					trace("")
					trace("")
					trace("")
				}
					//trace(this.name)
					if (objState == "idle")
					{

						objState = "findFishingSpot"
					}

					if (objState == "findFishingSpot")
					{
						mRef.fishPoint1.x = mRef.water1.x;
						mRef.fishPoint1.y = mRef.water1.y;
						FindNewFishingLoc(125, 180);
					}

					if (objState == "goToFishingSpot")
					{
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

						if (this.hitTestObject(mRef.fishPoint1) == true)
						{
							//trace(currentFishAmount)
							currentFishAmount += 0.1;
							if (currentFishAmount >= maxFish)
							{
								objState = "goToFishingTown"
							}
						}

						if (this.hitTestObject(mRef.fishPoint1) != true)
						{
							//currentRiceAmount += 0.1;
							if (currentFishAmount <= maxFish)
							{
								objState = "goToFishingSpot"
							}
						}
					}

					if (objState == "goToFishingTown")
					{
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
				/////////////////////////////////// FISHER 2 //////////////////////////////////////////////
				if (this.name == "bFisher2")
				{
					if (this.x < 370)
					{
						objState = "idle"
						trace("")
						trace(objAngle + "  " + this.name)
						trace(mRef.fishPoint2.x + "  fishpoint2 x ")
						trace(mRef.fishPoint2.y + "  fishpoint2 y ")
						trace(mRef.bFishingTown2.x + "  bFishingTown2 x ")
						trace(mRef.bFishingTown2.y + "  bFishingTown2 y ")
						trace(this.x + "  this x ")
						trace(this.y + "  this y ")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
					}
					//trace(this.name)
					if (objState == "idle")
					{

						objState = "findFishingSpot"
					}

					if (objState == "findFishingSpot")
					{
						mRef.fishPoint2.x = mRef.water2.x;
						mRef.fishPoint2.y = mRef.water2.y;
						FindNewFishingLoc(400, 140);
					}

					if (objState == "goToFishingSpot")
					{
						FindMoveAngle(this.x, this.y, mRef.fishPoint2.x, mRef.fishPoint2.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (this.hitTestObject(mRef.fishPoint2) == true)
						{
							objState = "collectingFish"
						}
					}

					if (objState == "collectingFish")
					{

						if (this.hitTestObject(mRef.fishPoint2) == true)
						{
							//trace(currentFishAmount)
							currentFishAmount += 0.1;
							if (currentFishAmount >= maxFish)
							{
								objState = "goToFishingTown"
							}
						}

						if (this.hitTestObject(mRef.fishPoint2) != true)
						{
							//currentRiceAmount += 0.1;
							if (currentFishAmount <= maxFish)
							{
								objState = "goToFishingSpot"
							}
						}
					}

					if (objState == "goToFishingTown")
					{
						FindMoveAngle(this.x, this.y, mRef.bFishingTown2.x, mRef.bFishingTown2.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (this.hitTestObject(mRef.bFishingTown2) == true)
						{
							speed = 0;
							mRef.bFishingTown2.currentFishAmount += 0.1
							currentFishAmount -= 0.05;
							if (currentFishAmount <= 0)
							{
								currentFishAmount = 0;
								objState = "idle"
								speed = resetSpeed;
							}

						}


						/*if(this.x < mRef.fishPoint1 - 10)
						{
							objState = "idle"
						}*/
					}

					if (objState == "dead")
					{

					}

					if (objState == "changeCourse")
					{

					}
				}
				/////////////////////////////////////////// FISH 3 ////////////////////////////////////////////
				if (this.name == "bFisher3")
				{
					if (this.x < 570)
					{
						trace(objState + " obj state")
						this.x = mRef.bFishingTown3.x
						this.y = mRef.bFishingTown3.y
						objState = "idle"
						trace("")
						trace(objAngle + "  " + this.name)
						trace(mRef.fishPoint3.x + "  fishpoint3 x ")
						trace(mRef.fishPoint3.y + "  fishpoint3 y ")
						trace(mRef.bFishingTown3.x + "  bFishingTown3 x ")
						trace(mRef.bFishingTown3.y + "  bFishingTown3 y ")
						trace(this.x + "  this x ")
						trace(this.y + "  this y ")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
						trace("")
					}

					//trace(this.name)
					if (objState == "idle")
					{

						objState = "findFishingSpot"
					}

					if (objState == "findFishingSpot")
					{
						mRef.fishPoint3.x = mRef.water3.x;
						mRef.fishPoint3.y = mRef.water3.y;
						FindNewFishingLoc(200, 100);
					}

					if (objState == "goToFishingSpot")
					{
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

						if (this.hitTestObject(mRef.fishPoint3) == true)
						{
							//trace(currentFishAmount)
							currentFishAmount += 0.1;
							if (currentFishAmount >= maxFish)
							{
								objState = "goToFishingTown"
							}
						}

						if (this.hitTestObject(mRef.fishPoint3) != true)
						{
							//currentRiceAmount += 0.1;
							if (currentFishAmount <= maxFish)
							{
								objState = "goToFishingSpot"
							}
						}
					}

					if (objState == "goToFishingTown")
					{
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


						/*if(this.x < mRef.fishPoint1 - 10)
						{
							objState = "idle"
						}*/
					}

					if (objState == "dead")
					{

					}

					if (objState == "changeCourse")
					{

					}
				}
				//
			}
			// loop f
		}
		// loop f

		public function FindMoveAngle(x1, y1, x2, y2)
		{

			var deltaX: Number = x1 - x2
			var deltaY: Number = y1 - y2

			angleRad = Math.atan2(deltaY, deltaX)


			objAngle = angleRad * 180 / Math.PI;
			//angleRad += (Math.PI/2)
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
				//trace(newRandomX + " " + this.name);
				//trace(newRandomY + " " + this.name);
				//trace("")

			}

			if (this.name == "bFisher2")
			{
				currentFishingSpotName = "fishPoint2"
				waterName = "water2"
				newRandomX = Math.round(Math.random() * maxX);
				newRandomY = Math.round(Math.random() * maxY);

				mRef.fishPoint2.x = newRandomX + mRef.water2.x
				mRef.fishPoint2.y = newRandomY + mRef.water2.y
				//trace(newRandomX + " " + this.name);
				//trace(newRandomY + " " + this.name);
				//trace("")

			}


			if (this.name == "bFisher2")
			{
				currentFishingSpotName = "fishPoint2"
				waterName = "water2"
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