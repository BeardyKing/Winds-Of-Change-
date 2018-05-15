package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class BWorkerFarmer extends MovieClip
	{

		var objState: String = "idle"

		var maxRice: Number = 10;
		var isAlive: Boolean = true;
		var currentRiceAmount: Number = 0;
		var objHealth: Number = 100;
		var hitByWhirlwind: Boolean = false;
		var isPoisioned: Boolean = false;
		var farmHomeTownName: String = "";
		var currentFarmName: String = "";
		var speed: Number = 0.3;
		var objAngle: Number = 0;
		var hypotLen: Number = 0;
		var isCollecting: Boolean = false;

		var mRef: MovieClip;

		var fDist1: Number = 0;
		var fDist2: Number = 0;
		var fDist3: Number = 0;
		var fDist4: Number = 0;
		var fDist5: Number = 0;
		var angleRad: Number = 0;


		public function BWorkerFarmer()
		{
			// constructor code

			mRef = MovieClip(this.parent)
			this.addEventListener(Event.ENTER_FRAME, Loop);
			//trace("inside " + this.name )


		}

		public function Loop(e: Event)
		{
			if (mRef.objState == "play")
			{
				//this.rotation = objAngle + 45;
				///////////////////////////////////// BWF1 & BWF2 & BWF3 //////////////////////////////////
				if (this.name == "bwf1" || this.name == "bwf2" || this.name == "bwf3")
				{

					//if (this.x < mRef.farmTown1.x - 60)
					//{
					//	objState = "idle";

					//}
					//if (this.x > mRef.farmTown1.x + 30)
					//{
					//	objState = "idle"

					//}
					//if (this.y < mRef.farmTown1.y - 50)
					//{
					//	objState = "idle"
					//	//trace("ow")
					//}
					//if (this.y > mRef.farmTown1.y + 20)
					//{
					//	objState = "idle"
					//}
					/*////trace(this.x + this.name)
				if (this.name == "bwf1")
				{

					////trace(currentFarmName + " " + this.name)
					////trace(objState + " " + this.name)
					////trace(currentRiceAmount + " " + this.name)
				}*/
					/*////trace(fDist1 + "  fDist1")
			////trace(fDist2 + "  fDist2")
			////trace(fDist3 + "  fDist3")
			////trace(fDist4 + "  fDist4")
			////trace(fDist5 + "  fDist5")
			////trace(objState + " objState")*/
					if (objState == "idle")
					{

						objState = "goToNearestFarm"

						if (objState == "goToNearestFarm")
						{
							FindNearestFarm();
							////trace("find nearest called")

						}

					}

					if (objState == "goToNearestFarm")
					{



						if (mRef.f1.canBeFarmed == false &&
							mRef.f2.canBeFarmed == false &&
							mRef.f3.canBeFarmed == false &&
							mRef.f4.canBeFarmed == false &&
							mRef.f5.canBeFarmed == false)
						{
							objState = "goToFarmingTown"
						}


						if (currentFarmName == "f1")
						{
							FindMoveAngle(this.x, this.y, mRef.f1.x, mRef.f1.y);
						}
						if (currentFarmName == "f2")
						{
							FindMoveAngle(this.x, this.y, mRef.f2.x, mRef.f2.y);
						}
						if (currentFarmName == "f3")
						{
							FindMoveAngle(this.x, this.y, mRef.f3.x, mRef.f3.y);
						}
						if (currentFarmName == "f4")
						{
							FindMoveAngle(this.x, this.y, mRef.f4.x, mRef.f4.y);
						}
						if (currentFarmName == "f5")
						{
							FindMoveAngle(this.x, this.y, mRef.f5.x, mRef.f5.y);
						}
						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (currentFarmName == "f1")
						{
							if (this.hitTestObject(mRef.f1) == true)
							{
								objState = "collectRice"
							}
						}
						if (currentFarmName == "f2")
						{
							if (this.hitTestObject(mRef.f2) == true)
							{
								objState = "collectRice"
							}
						}
						if (currentFarmName == "f3")
						{
							if (this.hitTestObject(mRef.f3) == true)
							{
								objState = "collectRice"
							}
						}
						if (currentFarmName == "f4")
						{
							if (this.hitTestObject(mRef.f4) == true)
							{
								objState = "collectRice"
							}
						}
						if (currentFarmName == "f5")
						{
							if (this.hitTestObject(mRef.f5) == true)
							{
								objState = "collectRice"
							}
						}
						//////trace(objAngle);
						//////trace(currentFarmName + " current farm name")

					}

					if (objState == "collectRice")
					{
						if (this.hitTestObject(mRef.f1) == true)
						{
							if (mRef.f1.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.f1.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.f1.remainingRice <= 0 && currentRiceAmount < maxRice)
							{
								objState = "idle"
							}

						}
						if (this.hitTestObject(mRef.f2) == true)
						{
							if (mRef.f2.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.f2.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.f2.remainingRice <= 0 && currentRiceAmount < maxRice)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.f3) == true)
						{
							if (mRef.f3.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.f3.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.f3.remainingRice <= 0 && currentRiceAmount < maxRice)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.f4) == true)
						{
							if (mRef.f4.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.f4.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.f4.remainingRice <= 0 && currentRiceAmount < maxRice)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.f5) == true)
						{
							if (mRef.f5.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.f5.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.f5.remainingRice <= 0 && currentRiceAmount < maxRice)
							{
								objState = "idle"
							}
						}

						if (currentRiceAmount >= 10)
						{
							currentRiceAmount = 10
							objState = "goToFarmingTown";
						}

					}

					if (objState == "goToFarmingTown")
					{


						FindMoveAngle(this.x, this.y, mRef.farmTown1.x, mRef.farmTown1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (this.hitTestObject(mRef.farmTown1) == true)
						{
							currentRiceAmount -= 0.1;
							mRef.farmTown1.currentRiceAmount += 0.1;
							if (currentRiceAmount <= 0)
							{
								objState = "idle"
								currentRiceAmount = 0;
							}
							//objState = "idle"
						}
					}

					if (objState == "notActive")
					{

					}
					if (objState == "dead")
					{

					}
				}
				///////////////////////////////////////////////// BWf4 & BWF5 & BWF6 //////////////////////////////
				if (this.name == "bwf4" || this.name == "bwf5" || this.name == "bwf6")
				{
					/*if (this.x < mRef.farmTown2.x - 25.5)
					{
						objState = "idle";

					}
					if (this.x > mRef.farmTown2.x + 15)
					{
						objState = "idle"

					}
					if (this.y < mRef.farmTown2.y - 42)
					{
						objState = "idle"
						trace("ow")
					}
					if (this.y > mRef.farmTown2.y + 34)
					{
						objState = "idle"
						trace("ow")
					}*/

					//////trace(this.x + this.name)
					/*if (this.name == "bwf1")
				{
					
					////trace(currentFarmName + " " + this.name)
					////trace(objState + " " + this.name)
					////trace(currentRiceAmount + " " + this.name)
				}*/
					/*////trace(fDist1 + "  fDist1")
			////trace(fDist2 + "  fDist2")
			////trace(fDist3 + "  fDist3")
			////trace(fDist4 + "  fDist4")
			////trace(fDist5 + "  fDist5")
			////trace(objState + " objState")*/
					if (objState == "idle")
					{

						objState = "goToNearestFarm"

						if (objState == "goToNearestFarm")
						{
							FindNearestFarm2();
							////trace("find nearest called")

						}

					}

					if (objState == "goToNearestFarm")
					{

						if (mRef.f6.canBeFarmed == false &&
							mRef.f7.canBeFarmed == false &&
							mRef.f8.canBeFarmed == false &&
							mRef.f9.canBeFarmed == false &&
							mRef.f10.canBeFarmed == false)
						{
							objState = "goToFarmingTown"
						}


						if (currentFarmName == "f6")
						{
							FindMoveAngle(this.x, this.y, mRef.f6.x, mRef.f6.y);
						}
						if (currentFarmName == "f7")
						{
							FindMoveAngle(this.x, this.y, mRef.f7.x, mRef.f7.y);
						}
						if (currentFarmName == "f8")
						{
							FindMoveAngle(this.x, this.y, mRef.f8.x, mRef.f8.y);
						}
						if (currentFarmName == "f9")
						{
							FindMoveAngle(this.x, this.y, mRef.f9.x, mRef.f9.y);
						}
						if (currentFarmName == "f10")
						{
							FindMoveAngle(this.x, this.y, mRef.f10.x, mRef.f10.y);
						}
						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (currentFarmName == "f6")
						{
							if (this.hitTestObject(mRef.f6) == true)
							{
								objState = "collectRice"
							}
						}
						if (currentFarmName == "f7")
						{
							if (this.hitTestObject(mRef.f7) == true)
							{
								objState = "collectRice"
							}
						}
						if (currentFarmName == "f8")
						{
							if (this.hitTestObject(mRef.f8) == true)
							{
								objState = "collectRice"
							}
						}
						if (currentFarmName == "f9")
						{
							if (this.hitTestObject(mRef.f9) == true)
							{
								objState = "collectRice"
							}
						}
						if (currentFarmName == "f10")
						{
							if (this.hitTestObject(mRef.f10) == true)
							{
								objState = "collectRice"
							}
						}
						//////trace(objAngle);
						//////trace(currentFarmName + " current farm name")

					}

					if (objState == "collectRice")
					{
						if (this.hitTestObject(mRef.f6) == true)
						{
							if (mRef.f6.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.f6.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.f6.remainingRice <= 0 && currentRiceAmount < maxRice)
							{
								objState = "idle"
							}

						}
						if (this.hitTestObject(mRef.f7) == true)
						{
							if (mRef.f7.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.f7.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.f7.remainingRice <= 0 && currentRiceAmount < maxRice)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.f8) == true)
						{
							if (mRef.f8.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.f8.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.f8.remainingRice <= 0 && currentRiceAmount < maxRice)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.f9) == true)
						{
							if (mRef.f9.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.f9.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.f9.remainingRice <= 0 && currentRiceAmount < maxRice)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.f10) == true)
						{
							if (mRef.f10.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.f10.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.f10.remainingRice <= 0 && currentRiceAmount < maxRice)
							{
								objState = "idle"
							}
						}

						if (currentRiceAmount >= 10)
						{
							currentRiceAmount = 10
							objState = "goToFarmingTown";
						}

					}

					if (objState == "goToFarmingTown")
					{
						FindMoveAngle(this.x, this.y, mRef.farmTown2.x, mRef.farmTown2.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (this.hitTestObject(mRef.farmTown2) == true)
						{
							currentRiceAmount -= 0.1;
							mRef.farmTown2.currentRiceAmount += 0.1;
							if (currentRiceAmount <= 0)
							{
								objState = "idle"
								currentRiceAmount = 0;
							}
							//objState = "idle"
						}
					}

					if (objState == "notActive")
					{

					}
					if (objState == "dead")
					{

					}
				}
			}
			// loop
		}
		//loop

		public function FindMoveAngle(x1, y1, x2, y2)
		{
			var deltaX: Number = x1 - x2
			var deltaY: Number = y1 - y2

			angleRad = Math.atan2(deltaY, deltaX)


			objAngle = angleRad * 180 / Math.PI;
			//angleRad += (Math.PI/2)
			objAngle -= 45;

			//////trace("done")
			return;

		}
		public function FindNearestFarm()
		{
			fDist1 = Math.sqrt((this.x - mRef.f1.x) * (this.x - mRef.f1.x) + (this.y - mRef.f1.y) * (this.y - mRef.f1.y))
			if (mRef.f1.remainingRice <= 0)
			{
				fDist1 = Infinity;
			}
			fDist2 = Math.sqrt((this.x - mRef.f2.x) * (this.x - mRef.f2.x) + (this.y - mRef.f2.y) * (this.y - mRef.f2.y))
			if (mRef.f2.remainingRice <= 0)
			{
				fDist2 = Infinity;
			}
			fDist3 = Math.sqrt((this.x - mRef.f3.x) * (this.x - mRef.f3.x) + (this.y - mRef.f3.y) * (this.y - mRef.f3.y))
			if (mRef.f3.remainingRice <= 0)
			{
				fDist3 = Infinity;
			}
			fDist4 = Math.sqrt((this.x - mRef.f4.x) * (this.x - mRef.f4.x) + (this.y - mRef.f4.y) * (this.y - mRef.f4.y))
			if (mRef.f4.remainingRice <= 0)
			{
				fDist4 = Infinity;
			}
			fDist5 = Math.sqrt((this.x - mRef.f5.x) * (this.x - mRef.f5.x) + (this.y - mRef.f5.y) * (this.y - mRef.f5.y))
			if (mRef.f5.remainingRice <= 0)
			{
				fDist5 = Infinity;
			}
			if (fDist1 < fDist2 &&
				fDist1 < fDist3 &&
				fDist1 < fDist2 &&
				fDist1 < fDist4)
			{
				currentFarmName = mRef.f1.name;
				//FindMoveAngle(this.x, this.y, mRef.f1.x, mRef.f1.y);

				////trace(fDist1)
			}
			//x1, y1, x2, y2

			if (fDist2 < fDist1 &&
				fDist2 < fDist3 &&
				fDist2 < fDist4 &&
				fDist2 < fDist5)
			{
				currentFarmName = mRef.f2.name;

				//FindMoveAngle(this.x, this.y, mRef.f2.x, mRef.f2.y);
				////trace(fDist2)
			}

			if (fDist3 < fDist1 &&
				fDist3 < fDist2 &&
				fDist3 < fDist4 &&
				fDist3 < fDist5)
			{
				currentFarmName = mRef.f3.name;

				//FindMoveAngle(this.x, this.y, mRef.f3.x, mRef.f3.y);
				////trace(fDist3)
			}

			if (fDist4 < fDist1 &&
				fDist4 < fDist2 &&
				fDist4 < fDist3 &&
				fDist4 < fDist5)
			{
				currentFarmName = mRef.f4.name;

				//FindMoveAngle(this.x, this.y, mRef.f4.x, mRef.f4.y);
				////trace(fDist4)
			}

			if (fDist5 < fDist1 &&
				fDist5 < fDist2 &&
				fDist5 < fDist3 &&
				fDist5 < fDist4)
			{
				currentFarmName = mRef.f5.name;

				//FindMoveAngle(this.x, this.y, mRef.f5.x, mRef.f5.y);
				////trace(fDist5)
			}
			////trace("aaaaaa");
			return;
		}

		public function FindNearestFarm2()
		{
			fDist1 = Math.sqrt((this.x - mRef.f6.x) * (this.x - mRef.f6.x) + (this.y - mRef.f6.y) * (this.y - mRef.f6.y))
			if (mRef.f6.remainingRice <= 0)
			{
				fDist1 = Infinity;
			}
			fDist2 = Math.sqrt((this.x - mRef.f7.x) * (this.x - mRef.f7.x) + (this.y - mRef.f7.y) * (this.y - mRef.f7.y))
			if (mRef.f7.remainingRice <= 0)
			{
				fDist2 = Infinity;
			}
			fDist3 = Math.sqrt((this.x - mRef.f8.x) * (this.x - mRef.f8.x) + (this.y - mRef.f8.y) * (this.y - mRef.f8.y))
			if (mRef.f8.remainingRice <= 0)
			{
				fDist3 = Infinity;
			}
			fDist4 = Math.sqrt((this.x - mRef.f9.x) * (this.x - mRef.f9.x) + (this.y - mRef.f9.y) * (this.y - mRef.f9.y))
			if (mRef.f9.remainingRice <= 0)
			{
				fDist4 = Infinity;
			}
			fDist5 = Math.sqrt((this.x - mRef.f10.x) * (this.x - mRef.f10.x) + (this.y - mRef.f10.y) * (this.y - mRef.f10.y))
			if (mRef.f10.remainingRice <= 0)
			{
				fDist5 = Infinity;
			}
			if (fDist1 < fDist2 &&
				fDist1 < fDist3 &&
				fDist1 < fDist2 &&
				fDist1 < fDist4)
			{
				currentFarmName = mRef.f6.name;
				//FindMoveAngle(this.x, this.y, mRef.f1.x, mRef.f1.y);

				////trace(fDist1)
			}
			//x1, y1, x2, y2

			if (fDist2 < fDist1 &&
				fDist2 < fDist3 &&
				fDist2 < fDist4 &&
				fDist2 < fDist5)
			{
				currentFarmName = mRef.f7.name;

				//FindMoveAngle(this.x, this.y, mRef.f2.x, mRef.f2.y);
				////trace(fDist2)
			}

			if (fDist3 < fDist1 &&
				fDist3 < fDist2 &&
				fDist3 < fDist4 &&
				fDist3 < fDist5)
			{
				currentFarmName = mRef.f8.name;

				//FindMoveAngle(this.x, this.y, mRef.f3.x, mRef.f3.y);
				////trace(fDist3)
			}

			if (fDist4 < fDist1 &&
				fDist4 < fDist2 &&
				fDist4 < fDist3 &&
				fDist4 < fDist5)
			{
				currentFarmName = mRef.f9.name;

				//FindMoveAngle(this.x, this.y, mRef.f4.x, mRef.f4.y);
				////trace(fDist4)
			}

			if (fDist5 < fDist1 &&
				fDist5 < fDist2 &&
				fDist5 < fDist3 &&
				fDist5 < fDist4)
			{
				currentFarmName = mRef.f10.name;

				//FindMoveAngle(this.x, this.y, mRef.f5.x, mRef.f5.y);
				////trace(fDist5)
			}
			//trace("aaaaaa");
			return;
		}

	}

}