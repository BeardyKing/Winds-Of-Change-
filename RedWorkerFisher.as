package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class RedWorkerFisher extends MovieClip
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

		public function RedWorkerFisher()
		{
			//////trace("inside " + this.name);
			mRef = MovieClip(this.parent);


			this.addEventListener(Event.ENTER_FRAME, Loop);
		}

		public function Loop(e: Event)
		{ // loop s
			if (mRef.objState == "play")
			{
				
				//this.rotation = objAngle - 45;
				if (this.name == "rFisher1_1")
				{

					////////trace(this.name)
					if (objState == "idle")
					{

						objState = "findFishingSpot"
					}

					if (objState == "findFishingSpot")
					{
						mRef.redFishPoint1.x = mRef.redWaterObj1.x;
						mRef.redFishPoint1.y = mRef.redWaterObj1.y;
						FindNewFishingLoc(mRef.redWaterObj1.width, mRef.redWaterObj1.height);
					}

					if (objState == "goToFishingSpot")
					{
						this.scaleX = 1;
						this.gotoAndStop(1);
						FindMoveAngle(this.x, this.y, mRef.redFishPoint1.x, mRef.redFishPoint1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (this.hitTestObject(mRef.redFishPoint1) == true)
						{
							objState = "collectingFish"
						}
					}

					if (objState == "collectingFish")
					{
						
						this.gotoAndStop(2);

						if (this.hitTestObject(mRef.redFishPoint1) == true)
						{
							////////trace(currentFishAmount)
							currentFishAmount += 0.1;
							if (currentFishAmount >= maxFish)
							{
								objState = "goToFishingTown"
							}
						}

						//if (this.hitTestObject(mRef.fishPoint1) != true)
						//{
						//	//currentRiceAmount += 0.1;
						//	if (currentFishAmount <= maxFish)
						//	{
						//		objState = "goToFishingSpot"
						//	}
						//}
						
					}

					if (objState == "goToFishingTown")
					{
						this.scaleX = -1;
						this.gotoAndStop(1);
						FindMoveAngle(this.x, this.y, mRef.rFishTown1.x, mRef.rFishTown1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (this.hitTestObject(mRef.rFishTown1) == true)
						{
							speed = 0;
							mRef.rFishTown1.currentFishAmount += 0.1
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
				
				if (this.name == "rFisher2_1")
				{

					////////trace(this.name)
					if (objState == "idle")
					{

						objState = "findFishingSpot"
					}

					if (objState == "findFishingSpot")
					{
						mRef.redFishPoint2.x = mRef.redWaterObj2.x;
						mRef.redFishPoint2.y = mRef.redWaterObj2.y;
						FindNewFishingLoc(mRef.redWaterObj2.width, mRef.redWaterObj2.height);
					}

					if (objState == "goToFishingSpot")
					{
						this.scaleX = -1;
						this.gotoAndStop(1);
						FindMoveAngle(this.x, this.y, mRef.redFishPoint2.x, mRef.redFishPoint2.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (this.hitTestObject(mRef.redFishPoint2) == true)
						{
							objState = "collectingFish"
						}
					}

					if (objState == "collectingFish")
					{
						
						this.gotoAndStop(2);

						if (this.hitTestObject(mRef.redFishPoint2) == true)
						{
							////////trace(currentFishAmount)
							currentFishAmount += 0.1;
							if (currentFishAmount >= maxFish)
							{
								objState = "goToFishingTown"
							}
						}

						//if (this.hitTestObject(mRef.fishPoint1) != true)
						//{
						//	//currentRiceAmount += 0.1;
						//	if (currentFishAmount <= maxFish)
						//	{
						//		objState = "goToFishingSpot"
						//	}
						//}
						
					}

					if (objState == "goToFishingTown")
					{
						this.scaleX = 1;
						this.gotoAndStop(1);
						FindMoveAngle(this.x, this.y, mRef.rFishTown2.x, mRef.rFishTown2.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (this.hitTestObject(mRef.rFishTown2) == true)
						{
							speed = 0;
							mRef.rFishTown2.currentFishAmount += 0.1
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

			if (this.name == "rFisher1_1")
			{
				currentFishingSpotName = "RedfishPoint1"
				waterName = "redWaterObj1"
				newRandomX = Math.round(Math.random() * maxX);
				newRandomY = Math.round(Math.random() * maxY);

				mRef.redFishPoint1.x = newRandomX + mRef.redWaterObj1.x
				mRef.redFishPoint1.y = newRandomY + mRef.redWaterObj1.y
				
				/*//trace(newRandomX + " " + this.name);
				//trace(newRandomY + " " + this.name);
				//trace("")
				//trace("aaaaaaaaaaaaaaaaaaaaa")
				//trace("aaaaaaaaaaaaaaaaaaaaa")
				//trace("aaaaaaaaaaaaaaaaaaaaa")
				//trace("aaaaaaaaaaaaaaaaaaaaa")
				//trace("aaaaaaaaaaaaaaaaaaaaa")
				//trace("aaaaaaaaaaaaaaaaaaaaa")
				//trace("aaaaaaaaaaaaaaaaaaaaa")
				//trace("aaaaaaaaaaaaaaaaaaaaa")
				//trace("aaaaaaaaaaaaaaaaaaaaa")
				//trace("aaaaaaaaaaaaaaaaaaaaa")
				//trace("aaaaaaaaaaaaaaaaaaaaa")
				//trace("aaaaaaaaaaaaaaaaaaaaa")
				//trace("aaaaaaaaaaaaaaaaaaaaa")
				*/

			}

			//if (this.name == "rFisher1_1")
			//{
			//	currentFishingSpotName = "fishPoint2"
			//	waterName = "water2"
			//	newRandomX = Math.round(Math.random() * maxX);
			//	newRandomY = Math.round(Math.random() * maxY);

			//	mRef.fishPoint2.x = newRandomX + mRef.water2.x
			//	mRef.fishPoint2.y = newRandomY + mRef.water2.y
			//	//////trace(newRandomX + " " + this.name);
			//	//////trace(newRandomY + " " + this.name);
			//	//////trace("")

			//}


			//if (this.name == "rFisher2_1")
			//{
			//	currentFishingSpotName = "fishPoint2"
			//	waterName = "water2"
			//}

			//if (this.name == "bFisher3")
			//{
			//	currentFishingSpotName = "fishPoint3"
			//	waterName = "water3"
			//	newRandomX = Math.round(Math.random() * maxX);
			//	newRandomY = Math.round(Math.random() * maxY);

			//	mRef.fishPoint3.x = newRandomX + mRef.water3.x
			//	mRef.fishPoint3.y = newRandomY + mRef.water3.y
			//}
			objState = "goToFishingSpot";

		}
	}

}