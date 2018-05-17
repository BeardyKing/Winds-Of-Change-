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
			//trace("inside " + this.name )


		}

		public function Loop(e: Event)
		{
			if (mRef.objState == "play")
			{


				///////////////////////////////////////////////// BWf4 & BWF5 & BWF6 //////////////////////////////
				if (this.name == "rWF1_1" || this.name == "rWF1_2" || this.name == "rWF1_3")
				{
					trace("");
					trace(objState + " " + this.name + " objState");
					trace(currentRiceAmount + " " + this.name + " currentRiceAmount")
					trace(currentFarmName + " " + this.name + " currentFarmName")
					trace(mRef.rFarm1_1.remainingRice + " " + " mRef.rFarm1_1.remainingRice")
					trace("");
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
								trace("HIT FROM GOTO FARM")
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
						//////trace(objAngle);
						//////trace(currentFarmName + " current farm name")

					}
					
					if (objState == "collectRice")
					{
						if (this.hitTestObject(mRef.rFarm1_1) == true)
						{
							trace("HIT TEST FORM rFarm1_1")
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
			}
		}
		// loop



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

				////trace(fDist1)
			}
			//x1, y1, x2, y2

			if (fDist2 < fDist1 &&
				fDist2 < fDist3 &&
				fDist2 < fDist4 &&
				fDist2 < fDist5)
			{
				currentFarmName = mRef.rFarm1_2.name;

				//FindMoveAngle(this.x, this.y, mRef.f2.x, mRef.f2.y);
				////trace(fDist2)
			}

			if (fDist3 < fDist1 &&
				fDist3 < fDist2 &&
				fDist3 < fDist4 &&
				fDist3 < fDist5)
			{
				currentFarmName = mRef.rFarm1_3.name;

				//FindMoveAngle(this.x, this.y, mRef.f3.x, mRef.f3.y);
				////trace(fDist3)
			}

			if (fDist4 < fDist1 &&
				fDist4 < fDist2 &&
				fDist4 < fDist3 &&
				fDist4 < fDist5)
			{
				currentFarmName = mRef.rFarm1_4.name;

				//FindMoveAngle(this.x, this.y, mRef.f4.x, mRef.f4.y);
				////trace(fDist4)
			}

			if (fDist5 < fDist1 &&
				fDist5 < fDist2 &&
				fDist5 < fDist3 &&
				fDist5 < fDist4)
			{
				currentFarmName = mRef.rFarm1_5.name;

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