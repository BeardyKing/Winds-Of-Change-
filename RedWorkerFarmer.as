package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class RedWorkerFarmer extends MovieClip
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


		public function RedWorkerFarmer()
		{
			// constructor code

			mRef = MovieClip(this.parent)
			this.addEventListener(Event.ENTER_FRAME, Loop);
			////trace("inside " + this.name )


		}

		public function Loop(e: Event)
		{
			if (mRef.objState == "play")
			{


				///////////////////////////////////////////////// rWF1_1 & rWF1_2 & rWF1_3 //////////////////////////////
				if (this.name == "rWF1_1" || this.name == "rWF1_2" || this.name == "rWF1_3")
				{
					/*//trace("");
					//trace(objState + " " + this.name + " objState");
					//trace(currentRiceAmount + " " + this.name + " currentRiceAmount")
					//trace(currentFarmName + " " + this.name + " currentFarmName")
					//trace(mRef.rFarm1_1.remainingRice + " " + " mRef.rFarm1_1.remainingRice")
					//trace("");*/
					if (objState == "idle")
					{

						objState = "goToNearestFarm"

						if (objState == "goToNearestFarm")
						{
							FindNearestFarm();
							//////trace("find nearest called")
						}
					}

					if (objState == "goToNearestFarm")
					{
						if (mRef.rFarm1_1.canBeFarmed == false &&
							mRef.rFarm1_2.canBeFarmed == false &&
							mRef.rFarm1_3.canBeFarmed == false &&
							mRef.rFarm1_4.canBeFarmed == false &&
							mRef.rFarm1_5.canBeFarmed == false)
						{
							objState = "goToFarmingTown"
						}


						if (currentFarmName == "rFarm1_1")
						{
							FindMoveAngle(this.x, this.y, mRef.rFarm1_1.x, mRef.rFarm1_1.y);
						}
						if (currentFarmName == "rFarm1_2")
						{
							FindMoveAngle(this.x, this.y, mRef.rFarm1_2.x, mRef.rFarm1_2.y);
						}
						if (currentFarmName == "rFarm1_3")
						{
							FindMoveAngle(this.x, this.y, mRef.rFarm1_3.x, mRef.rFarm1_3.y);
						}
						if (currentFarmName == "rFarm1_4")
						{
							FindMoveAngle(this.x, this.y, mRef.rFarm1_4.x, mRef.rFarm1_4.y);
						}
						if (currentFarmName == "rFarm1_5")
						{
							FindMoveAngle(this.x, this.y, mRef.rFarm1_5.x, mRef.rFarm1_5.y);
						}
						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (currentFarmName == "rFarm1_1")
						{
							if (this.hitTestObject(mRef.rFarm1_1) == true)
							{
								//trace("HIT FROM GOTO FARM")
								objState = "collectRice"
							}
						}
						if (currentFarmName == "rFarm1_2")
						{
							if (this.hitTestObject(mRef.rFarm1_2) == true)
							{
								objState = "collectRice"
							}
						}
						if (currentFarmName == "rFarm1_3")
						{
							if (this.hitTestObject(mRef.rFarm1_3) == true)
							{
								objState = "collectRice"
							}
						}
						if (currentFarmName == "rFarm1_4")
						{
							if (this.hitTestObject(mRef.rFarm1_4) == true)
							{
								objState = "collectRice"
							}
						}
						if (currentFarmName == "rFarm1_5")
						{
							if (this.hitTestObject(mRef.rFarm1_5) == true)
							{
								objState = "collectRice"
							}
						}
						////////trace(objAngle);
						////////trace(currentFarmName + " current farm name")

					}

					if (objState == "collectRice")
					{
						if (this.hitTestObject(mRef.rFarm1_1) == true)
						{
							//trace("HIT TEST FORM rFarm1_1")
							if (mRef.rFarm1_1.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.rFarm1_1.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.rFarm1_1.remainingRice <= 0 && currentRiceAmount < maxRice)
							{
								objState = "idle"
							}

						}
						if (this.hitTestObject(mRef.rFarm1_2) == true)
						{
							if (mRef.rFarm1_2.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.rFarm1_2.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.rFarm1_2.remainingRice <= 0 && currentRiceAmount < maxRice)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.rFarm1_3) == true)
						{
							if (mRef.rFarm1_3.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.rFarm1_3.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.rFarm1_3.remainingRice <= 0 && currentRiceAmount < maxRice)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.rFarm1_4) == true)
						{
							if (mRef.rFarm1_4.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.rFarm1_4.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.rFarm1_4.remainingRice <= 0 && currentRiceAmount < maxRice)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.rFarm1_5) == true)
						{
							if (mRef.rFarm1_5.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.rFarm1_5.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.rFarm1_5.remainingRice <= 0 && currentRiceAmount < maxRice)
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
						FindMoveAngle(this.x, this.y, mRef.rFarmTown1.x, mRef.rFarmTown1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (this.hitTestObject(mRef.rFarmTown1) == true)
						{
							currentRiceAmount -= 0.1;
							mRef.rFarmTown1.currentRiceAmount += 0.1;
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




				///////////////////////////////////////////////// rWf2_1 & rWf2_2 & rWf2_3 //////////////////////////////
				if (this.name == "rWF2_1" || this.name == "rWF2_2" || this.name == "rWF2_3")
				{
					/*//trace("");
					//trace(objState + " " + this.name + " objState");
					//trace(currentRiceAmount + " " + this.name + " currentRiceAmount")
					//trace(currentFarmName + " " + this.name + " currentFarmName")
					//trace(mRef.rFarm1_1.remainingRice + " " + " mRef.rFarm1_1.remainingRice")
					//trace("");*/
					if (objState == "idle")
					{

						objState = "goToNearestFarm"

						if (objState == "goToNearestFarm")
						{
							FindNearestFarm2();
							//////trace("find nearest called")
						}
					}

					if (objState == "goToNearestFarm")
					{
						if (mRef.rFarm2_1.canBeFarmed == false &&
							mRef.rFarm2_2.canBeFarmed == false &&
							mRef.rFarm2_3.canBeFarmed == false &&
							mRef.rFarm2_4.canBeFarmed == false &&
							mRef.rFarm2_5.canBeFarmed == false)
						{
							objState = "goToFarmingTown"
						}


						if (currentFarmName == "rFarm2_1")
						{
							FindMoveAngle(this.x, this.y, mRef.rFarm2_1.x, mRef.rFarm2_1.y);
						}
						if (currentFarmName == "rFarm2_2")
						{
							FindMoveAngle(this.x, this.y, mRef.rFarm2_2.x, mRef.rFarm2_2.y);
						}
						if (currentFarmName == "rFarm2_3")
						{
							FindMoveAngle(this.x, this.y, mRef.rFarm2_3.x, mRef.rFarm2_3.y);
						}
						if (currentFarmName == "rFarm2_4")
						{
							FindMoveAngle(this.x, this.y, mRef.rFarm2_4.x, mRef.rFarm2_4.y);
						}
						if (currentFarmName == "rFarm2_5")
						{
							FindMoveAngle(this.x, this.y, mRef.rFarm2_5.x, mRef.rFarm2_5.y);
						}
						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (currentFarmName == "rFarm2_1")
						{
							if (this.hitTestObject(mRef.rFarm2_1) == true)
							{
								//trace("HIT FROM GOTO FARM")
								objState = "collectRice"
							}
						}
						if (currentFarmName == "rFarm2_2")
						{
							if (this.hitTestObject(mRef.rFarm2_2) == true)
							{
								objState = "collectRice"
							}
						}
						if (currentFarmName == "rFarm2_3")
						{
							if (this.hitTestObject(mRef.rFarm2_3) == true)
							{
								objState = "collectRice"
							}
						}
						if (currentFarmName == "rFarm2_4")
						{
							if (this.hitTestObject(mRef.rFarm2_4) == true)
							{
								objState = "collectRice"
							}
						}
						if (currentFarmName == "rFarm2_5")
						{
							if (this.hitTestObject(mRef.rFarm2_5) == true)
							{
								objState = "collectRice"
							}
						}
						////////trace(objAngle);
						////////trace(currentFarmName + " current farm name")

					}

					if (objState == "collectRice")
					{
						if (this.hitTestObject(mRef.rFarm2_1) == true)
						{
							//trace("HIT TEST FORM rFarm2_1")
							if (mRef.rFarm2_1.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.rFarm2_1.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.rFarm2_1.remainingRice <= 0 && currentRiceAmount < maxRice)
							{
								objState = "idle"
							}

						}
						if (this.hitTestObject(mRef.rFarm2_2) == true)
						{
							if (mRef.rFarm2_2.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.rFarm2_2.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.rFarm2_2.remainingRice <= 0 && currentRiceAmount < maxRice)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.rFarm2_3) == true)
						{
							if (mRef.rFarm2_3.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.rFarm2_3.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.rFarm2_3.remainingRice <= 0 && currentRiceAmount < maxRice)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.rFarm2_4) == true)
						{
							if (mRef.rFarm2_4.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.rFarm2_4.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.rFarm2_4.remainingRice <= 0 && currentRiceAmount < maxRice)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.rFarm2_5) == true)
						{
							if (mRef.rFarm2_5.remainingRice > 0 && currentRiceAmount < maxRice)
							{
								mRef.rFarm2_5.remainingRice -= 0.1
								currentRiceAmount += 0.1;
							}
							if (mRef.rFarm2_5.remainingRice <= 0 && currentRiceAmount < maxRice)
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
						FindMoveAngle(this.x, this.y, mRef.rFarmTown2.x, mRef.rFarmTown2.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (this.hitTestObject(mRef.rFarmTown2) == true)
						{
							currentRiceAmount -= 0.1;
							mRef.rFarmTown1.currentRiceAmount += 0.1;
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
		}
		//loop

		// loop





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
		public function FindNearestFarm()
		{
			fDist1 = Math.sqrt((this.x - mRef.rFarm1_1.x) * (this.x - mRef.rFarm1_1.x) + (this.y - mRef.rFarm1_1.y) * (this.y - mRef.rFarm1_1.y))
			if (mRef.rFarm1_1.remainingRice <= 0)
			{
				fDist1 = Infinity;
			}
			fDist2 = Math.sqrt((this.x - mRef.rFarm1_2.x) * (this.x - mRef.rFarm1_2.x) + (this.y - mRef.rFarm1_2.y) * (this.y - mRef.rFarm1_2.y))
			if (mRef.rFarm1_2.remainingRice <= 0)
			{
				fDist2 = Infinity;
			}
			fDist3 = Math.sqrt((this.x - mRef.rFarm1_3.x) * (this.x - mRef.rFarm1_3.x) + (this.y - mRef.rFarm1_3.y) * (this.y - mRef.rFarm1_3.y))
			if (mRef.rFarm1_3.remainingRice <= 0)
			{
				fDist3 = Infinity;
			}
			fDist4 = Math.sqrt((this.x - mRef.rFarm1_4.x) * (this.x - mRef.rFarm1_4.x) + (this.y - mRef.rFarm1_4.y) * (this.y - mRef.rFarm1_4.y))
			if (mRef.rFarm1_4.remainingRice <= 0)
			{
				fDist4 = Infinity;
			}
			fDist5 = Math.sqrt((this.x - mRef.rFarm1_5.x) * (this.x - mRef.rFarm1_5.x) + (this.y - mRef.rFarm1_5.y) * (this.y - mRef.rFarm1_5.y))
			if (mRef.rFarm1_5.remainingRice <= 0)
			{
				fDist5 = Infinity;
			}
			if (fDist1 < fDist2 &&
				fDist1 < fDist3 &&
				fDist1 < fDist2 &&
				fDist1 < fDist4)
			{
				currentFarmName = mRef.rFarm1_1.name;
				//FindMoveAngle(this.x, this.y, mRef.f1.x, mRef.f1.y);

				//////trace(fDist1)
			}
			//x1, y1, x2, y2

			if (fDist2 < fDist1 &&
				fDist2 < fDist3 &&
				fDist2 < fDist4 &&
				fDist2 < fDist5)
			{
				currentFarmName = mRef.rFarm1_2.name;

				//FindMoveAngle(this.x, this.y, mRef.f2.x, mRef.f2.y);
				//////trace(fDist2)
			}

			if (fDist3 < fDist1 &&
				fDist3 < fDist2 &&
				fDist3 < fDist4 &&
				fDist3 < fDist5)
			{
				currentFarmName = mRef.rFarm1_3.name;

				//FindMoveAngle(this.x, this.y, mRef.f3.x, mRef.f3.y);
				//////trace(fDist3)
			}

			if (fDist4 < fDist1 &&
				fDist4 < fDist2 &&
				fDist4 < fDist3 &&
				fDist4 < fDist5)
			{
				currentFarmName = mRef.rFarm1_4.name;

				//FindMoveAngle(this.x, this.y, mRef.f4.x, mRef.f4.y);
				//////trace(fDist4)
			}

			if (fDist5 < fDist1 &&
				fDist5 < fDist2 &&
				fDist5 < fDist3 &&
				fDist5 < fDist4)
			{
				currentFarmName = mRef.rFarm1_5.name;

				//FindMoveAngle(this.x, this.y, mRef.f5.x, mRef.f5.y);
				//////trace(fDist5)
			}
			//////trace("aaaaaa");
			return;
		}

		public function FindNearestFarm2()
		{
			fDist1 = Math.sqrt((this.x - mRef.rFarm2_1.x) * (this.x - mRef.rFarm2_1.x) + (this.y - mRef.rFarm2_1.y) * (this.y - mRef.rFarm2_1.y))
			if (mRef.rFarm2_1.remainingRice <= 0)
			{
				fDist1 = Infinity;
			}
			fDist2 = Math.sqrt((this.x - mRef.rFarm2_2.x) * (this.x - mRef.rFarm2_2.x) + (this.y - mRef.rFarm2_2.y) * (this.y - mRef.rFarm2_2.y))
			if (mRef.rFarm2_2.remainingRice <= 0)
			{
				fDist2 = Infinity;
			}
			fDist3 = Math.sqrt((this.x - mRef.rFarm2_3.x) * (this.x - mRef.rFarm2_3.x) + (this.y - mRef.rFarm2_3.y) * (this.y - mRef.rFarm2_3.y))
			if (mRef.rFarm2_3.remainingRice <= 0)
			{
				fDist3 = Infinity;
			}
			fDist4 = Math.sqrt((this.x - mRef.rFarm2_4.x) * (this.x - mRef.rFarm2_4.x) + (this.y - mRef.rFarm2_4.y) * (this.y - mRef.rFarm2_4.y))
			if (mRef.rFarm2_4.remainingRice <= 0)
			{
				fDist4 = Infinity;
			}
			fDist5 = Math.sqrt((this.x - mRef.rFarm2_5.x) * (this.x - mRef.rFarm2_5.x) + (this.y - mRef.rFarm2_5.y) * (this.y - mRef.rFarm2_5.y))
			if (mRef.rFarm2_5.remainingRice <= 0)
			{
				fDist5 = Infinity;
			}
			if (fDist1 < fDist2 &&
				fDist1 < fDist3 &&
				fDist1 < fDist2 &&
				fDist1 < fDist4)
			{
				currentFarmName = mRef.rFarm2_1.name;
				//FindMoveAngle(this.x, this.y, mRef.f1.x, mRef.f1.y);

				//////trace(fDist1)
			}
			//x1, y1, x2, y2

			if (fDist2 < fDist1 &&
				fDist2 < fDist3 &&
				fDist2 < fDist4 &&
				fDist2 < fDist5)
			{
				currentFarmName = mRef.rFarm2_2.name;

				//FindMoveAngle(this.x, this.y, mRef.f2.x, mRef.f2.y);
				//////trace(fDist2)
			}

			if (fDist3 < fDist1 &&
				fDist3 < fDist2 &&
				fDist3 < fDist4 &&
				fDist3 < fDist5)
			{
				currentFarmName = mRef.rFarm2_3.name;

				//FindMoveAngle(this.x, this.y, mRef.f3.x, mRef.f3.y);
				//////trace(fDist3)
			}

			if (fDist4 < fDist1 &&
				fDist4 < fDist2 &&
				fDist4 < fDist3 &&
				fDist4 < fDist5)
			{
				currentFarmName = mRef.rFarm2_4.name;

				//FindMoveAngle(this.x, this.y, mRef.f4.x, mRef.f4.y);
				//////trace(fDist4)
			}

			if (fDist5 < fDist1 &&
				fDist5 < fDist2 &&
				fDist5 < fDist3 &&
				fDist5 < fDist4)
			{
				currentFarmName = mRef.rFarm2_5.name;

				//FindMoveAngle(this.x, this.y, mRef.f5.x, mRef.f5.y);
				//////trace(fDist5)
			}
			//////trace("aaaaaa");
			return;
		}

	}
}