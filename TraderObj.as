package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class TraderObj extends MovieClip
	{

		var mRef: MovieClip;
		var nodeNumber: Number = 1;
		var singlePass: Boolean = false;
		var speed: Number = 0.2;
		var objAngle: Number = 0;
		var angleRad: Number = 0;
		var goingToTown: Boolean = true;
		var fDist1: Number = 0;
		var currentResourceAmount: Number = 0;
		var hypotDist: Number = 10;


		public function TraderObj()
		{

			mRef = MovieClip(this.parent);


			this.addEventListener(Event.ENTER_FRAME, Loop);
			// constructor code
		}


		public function Loop(e: Event)
		{
			if (mRef.objState == "play")
			{
				//trace(this.x + "     " +this.name)
				if (this.name == "bTradeRice1" && mRef.farmTown1.hasTradeCartActive == true)
				{
					//this.rotation = objAngle - 45;
					// nodeNumber 0 = go to bCity
					// nodeNumber 1 = go to nodeFarm1_1
					// node number 2 = go to farmTown1

					if (nodeNumber == 0)
					{
						FindMoveAngle(this.x, this.y, mRef.bCity.x, mRef.bCity.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (currentResourceAmount > 0)
						{
							if (this.hitTestObject(mRef.bCity) == true)
							{
								currentResourceAmount -= 0.1
								mRef.bCity.riceTotal += 0.1;
							}
						}
						if (currentResourceAmount <= 0)
						{
							currentResourceAmount = 0;
							nodeNumber = 1;
							goingToTown = true;
						}
					}
					if (nodeNumber == 1)
					{
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm1_1.x) *
							(this.x - mRef.nodeFarm1_1.x) +
							(this.y - mRef.nodeFarm1_1.y) *
							(this.y - mRef.nodeFarm1_1.y))
						FindMoveAngle(this.x, this.y, mRef.nodeFarm1_1.x, mRef.nodeFarm1_1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 2)
					{
						FindMoveAngle(this.x, this.y, mRef.farmTown1.x, mRef.farmTown1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (currentResourceAmount < 25)
						{
							if (this.hitTestObject(mRef.farmTown1) == true)
							{
								speed = 0;
								currentResourceAmount += 0.1
								mRef.farmTown1.currentRiceAmount -= 0.1;
							}
						}

						if (currentResourceAmount >= 25)
						{
							speed = 0.2;
							currentResourceAmount = 25;
							nodeNumber -= 1;
							goingToTown = false;
						}
					}

					// find first node


				}
				////////////////////////////////////// TRADE CART 2 //////////////////////////////////////////////////////
				if (this.name == "bTradeRice2" && mRef.farmTown2.hasTradeCartActive == true)
				{
					//this.rotation = objAngle - 45;
					// nodeNumber 0 = go to bCity
					// nodeNumber 1 = go to nodeFarm1_1
					// node number 2 = go to farmTown1

					if (nodeNumber == 0)
					{
						FindMoveAngle(this.x, this.y, mRef.bCity.x, mRef.bCity.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (currentResourceAmount > 0)
						{
							if (this.hitTestObject(mRef.bCity) == true)
							{
								currentResourceAmount -= 0.1
								mRef.bCity.riceTotal += 0.1;
							}
						}
						if (currentResourceAmount <= 0)
						{
							currentResourceAmount = 0;
							nodeNumber = 1;
							goingToTown = true;
						}
					}
					if (nodeNumber == 1)
					{
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm2_1.x) *
							(this.x - mRef.nodeFarm2_1.x) +
							(this.y - mRef.nodeFarm2_1.y) *
							(this.y - mRef.nodeFarm2_1.y))
						FindMoveAngle(this.x, this.y, mRef.nodeFarm2_1.x, mRef.nodeFarm2_1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 2)
					{
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm2_2.x) *
							(this.x - mRef.nodeFarm2_2.x) +
							(this.y - mRef.nodeFarm2_2.y) *
							(this.y - mRef.nodeFarm2_2.y))
						FindMoveAngle(this.x, this.y, mRef.nodeFarm2_2.x, mRef.nodeFarm2_2.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 3)
					{
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm2_3.x) *
							(this.x - mRef.nodeFarm2_3.x) +
							(this.y - mRef.nodeFarm2_3.y) *
							(this.y - mRef.nodeFarm2_3.y))
						FindMoveAngle(this.x, this.y, mRef.nodeFarm2_3.x, mRef.nodeFarm2_3.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 4)
					{
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm2_4.x) *
							(this.x - mRef.nodeFarm2_4.x) +
							(this.y - mRef.nodeFarm2_4.y) *
							(this.y - mRef.nodeFarm2_4.y))
						FindMoveAngle(this.x, this.y, mRef.nodeFarm2_4.x, mRef.nodeFarm2_4.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 5)
					{
						FindMoveAngle(this.x, this.y, mRef.farmTown2.x, mRef.farmTown2.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (currentResourceAmount < 25)
						{
							if (this.hitTestObject(mRef.farmTown2) == true)
							{
								speed = 0;
								currentResourceAmount += 0.1
								mRef.farmTown1.currentRiceAmount -= 0.1;
							}
						}

						if (currentResourceAmount >= 25)
						{
							speed = 0.2;
							currentResourceAmount = 25;
							nodeNumber -= 1;
							goingToTown = false;
						}

					}
				}
				////////////////////// LOGGING TOWN 1
				if (this.name == "bTradeWood1" && mRef.bLoggingTown1.hasTradeCartActive == true)
				{


					//this.rotation = objAngle - 45;
					//this.alpha = 0.8;
					// nodeNumber 0 = go to bCity
					// nodeNumber 1 = go to nodeFarm1_1
					// node number 2 = go to farmTown1

					if (nodeNumber == 0)
					{
						FindMoveAngle(this.x, this.y, mRef.bCity.x, mRef.bCity.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (currentResourceAmount > 0)
						{
							if (this.hitTestObject(mRef.bCity) == true)
							{
								currentResourceAmount -= 0.1
								mRef.bCity.woodTotal += 0.1;
							}
						}
						if (currentResourceAmount <= 0)
						{
							currentResourceAmount = 0;
							nodeNumber = 1;
							goingToTown = true;
						}
					}
					if (nodeNumber == 1)
					{
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm1_1.x) *
							(this.x - mRef.nodeFarm1_1.x) +
							(this.y - mRef.nodeFarm1_1.y) *
							(this.y - mRef.nodeFarm1_1.y))
						FindMoveAngle(this.x, this.y, mRef.nodeFarm1_1.x, mRef.nodeFarm1_1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 2)
					{
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm3_1.x) *
							(this.x - mRef.nodeFarm3_1.x) +
							(this.y - mRef.nodeFarm3_1.y) *
							(this.y - mRef.nodeFarm3_1.y))
						FindMoveAngle(this.x, this.y, mRef.nodeFarm3_1.x, mRef.nodeFarm3_1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 3)
					{
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm4_1.x) *
							(this.x - mRef.nodeFarm4_1.x) +
							(this.y - mRef.nodeFarm4_1.y) *
							(this.y - mRef.nodeFarm4_1.y))
						FindMoveAngle(this.x, this.y, mRef.nodeFarm4_1.x, mRef.nodeFarm4_1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 4)
					{
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm4_2.x) *
							(this.x - mRef.nodeFarm4_2.x) +
							(this.y - mRef.nodeFarm4_2.y) *
							(this.y - mRef.nodeFarm4_2.y))
						FindMoveAngle(this.x, this.y, mRef.nodeFarm4_2.x, mRef.nodeFarm4_2.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 5)
					{
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm4_3.x) *
							(this.x - mRef.nodeFarm4_3.x) +
							(this.y - mRef.nodeFarm4_3.y) *
							(this.y - mRef.nodeFarm4_3.y))
						FindMoveAngle(this.x, this.y, mRef.nodeFarm4_3.x, mRef.nodeFarm4_3.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 6)
					{
						FindMoveAngle(this.x, this.y, mRef.bLoggingTown1.x, mRef.bLoggingTown1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (currentResourceAmount < 25)
						{
							if (this.hitTestObject(mRef.bLoggingTown1) == true)
							{
								speed = 0;
								currentResourceAmount += 0.1
								mRef.bLoggingTown1.currentWoodAmount -= 0.1;
							}
						}

						if (currentResourceAmount >= 25)
						{
							speed = 0.2;
							currentResourceAmount = 25;
							nodeNumber -= 1;
							goingToTown = false;
						}

					}

					// END LOG t 1
				}
				// END LOG T 1

				////////////////LOGGING TOWN 2

				if (this.name == "bTradeWood2_NULL" && mRef.bLoggingTown2.hasTradeCartActive == true)
				{
					//this.rotation = objAngle - 45;
					// nodeNumber 0 = go to bCity
					// nodeNumber 1 = go to nodeFarm1_1
					// node number 2 = go to farmTown1

					if (nodeNumber == 0)
					{
						FindMoveAngle(this.x, this.y, mRef.bCity.x, mRef.bCity.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (currentResourceAmount > 0)
						{
							if (this.hitTestObject(mRef.bCity) == true)
							{
								currentResourceAmount -= 0.1
								mRef.bCity.woodTotal += 0.1;
							}
						}
						if (currentResourceAmount <= 0)
						{
							currentResourceAmount = 0;
							nodeNumber = 1;
							goingToTown = true;
						}
					}
					if (nodeNumber == 1)
					{
						//nodeNumber = 2;


						//trace(speed)
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm1_1.x) *
							(this.x - mRef.nodeFarm1_1.x) +
							(this.y - mRef.nodeFarm1_1.y) *
							(this.y - mRef.nodeFarm1_1.y))
						//trace(fDist1)
						FindMoveAngle(this.x, this.y, mRef.nodeFarm1_1.x, mRef.nodeFarm1_1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						//trace(objAngle)
						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 2)
					{
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm3_1.x) *
							(this.x - mRef.nodeFarm3_1.x) +
							(this.y - mRef.nodeFarm3_1.y) *
							(this.y - mRef.nodeFarm3_1.y))

						FindMoveAngle(this.x, this.y, mRef.nodeFarm3_1.x, mRef.nodeFarm3_1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 3)
					{
						FindMoveAngle(this.x, this.y, mRef.bLoggingTown2.x, mRef.bLoggingTown2.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (currentResourceAmount < 25)
						{
							if (this.hitTestObject(mRef.bLoggingTown2) == true)
							{
								speed = 0;
								currentResourceAmount += 0.1
								mRef.bLoggingTown2.currentWoodAmount -= 0.1;
							}
						}

						if (currentResourceAmount >= 25)
						{
							speed = 0.2;
							currentResourceAmount = 25;
							nodeNumber -= 1;
							goingToTown = false;
						}
					}

					// find first node


				}

				/////////////LOGGING TOWN 3

				if (this.name == "bTradeWood3" && mRef.bLoggingTown3.hasTradeCartActive == true)
				{
					//this.rotation = objAngle - 45;
					// nodeNumber 0 = go to bCity
					// nodeNumber 1 = go to nodeFarm1_1
					// node number 2 = go to farmTown1

					if (nodeNumber == 0)
					{
						FindMoveAngle(this.x, this.y, mRef.bCity.x, mRef.bCity.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (currentResourceAmount > 0)
						{
							if (this.hitTestObject(mRef.bCity) == true)
							{
								currentResourceAmount -= 0.1
								mRef.bCity.woodTotal += 0.1;
							}
						}
						if (currentResourceAmount <= 0)
						{
							currentResourceAmount = 0;
							nodeNumber = 1;
							goingToTown = true;
						}
					}
					if (nodeNumber == 1)
					{
						//nodeNumber = 2;

						//trace("HELLO!")
						//trace(speed)
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm2_1.x) *
							(this.x - mRef.nodeFarm2_1.x) +
							(this.y - mRef.nodeFarm2_1.y) *
							(this.y - mRef.nodeFarm2_1.y))
						//trace(fDist1)
						FindMoveAngle(this.x, this.y, mRef.nodeFarm2_1.x, mRef.nodeFarm2_1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						//trace(objAngle)
						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 2)
					{
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm2_2.x) *
							(this.x - mRef.nodeFarm2_2.x) +
							(this.y - mRef.nodeFarm2_2.y) *
							(this.y - mRef.nodeFarm2_2.y))

						FindMoveAngle(this.x, this.y, mRef.nodeFarm2_2.x, mRef.nodeFarm2_2.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 3)
					{
						FindMoveAngle(this.x, this.y, mRef.bLoggingTown3.x, mRef.bLoggingTown3.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (currentResourceAmount < 25)
						{
							if (this.hitTestObject(mRef.bLoggingTown3) == true)
							{
								speed = 0;
								currentResourceAmount += 0.1
								mRef.bLoggingTown3.currentWoodAmount -= 0.1;
							}
						}

						if (currentResourceAmount >= 25)
						{
							speed = 0.2;
							currentResourceAmount = 25;
							nodeNumber -= 1;
							goingToTown = false;
						}
					}

					// find first node




				}

				if (this.name == "bTradeFish1" && mRef.bFishingTown1.hasTradeCartActive == true)
				{
					//speed = 0.3;
					//this.rotation = objAngle - 45;
					// nodeNumber 0 = go to bCity
					// nodeNumber 1 = go to nodeFarm1_1
					// node number 2 = go to farmTown1

					//trace(currentResourceAmount)
					
					if (nodeNumber == 0)
					{
						FindMoveAngle(this.x, this.y, mRef.bCity.x, mRef.bCity.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (currentResourceAmount > 0)
						{
							if (this.hitTestObject(mRef.bCity) == true)
							{
								currentResourceAmount -= 0.1
								mRef.bCity.fishTotal += 0.1;
							}
						}
						if (currentResourceAmount <= 0)
						{
							currentResourceAmount = 0;
							nodeNumber = 1;
							goingToTown = true;
						}
					}
					if (nodeNumber == 1)
					{
						//nodeNumber = 2;

						//trace("HELLO!")
						
						//trace(speed)
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm1_1.x) *
							(this.x - mRef.nodeFarm1_1.x) +
							(this.y - mRef.nodeFarm1_1.y) *
							(this.y - mRef.nodeFarm1_1.y))
						//trace(fDist1)
						FindMoveAngle(this.x, this.y, mRef.nodeFarm1_1.x, mRef.nodeFarm1_1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						//trace(objAngle)
						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 2)
					{
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm3_1.x) *
							(this.x - mRef.nodeFarm3_1.x) +
							(this.y - mRef.nodeFarm3_1.y) *
							(this.y - mRef.nodeFarm3_1.y))

						FindMoveAngle(this.x, this.y, mRef.nodeFarm3_1.x, mRef.nodeFarm3_1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 3)
					{
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm4_1.x) *
							(this.x - mRef.nodeFarm4_1.x) +
							(this.y - mRef.nodeFarm4_1.y) *
							(this.y - mRef.nodeFarm4_1.y))

						FindMoveAngle(this.x, this.y, mRef.nodeFarm4_1.x, mRef.nodeFarm4_1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 4)
					{
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm4_2.x) *
							(this.x - mRef.nodeFarm4_2.x) +
							(this.y - mRef.nodeFarm4_2.y) *
							(this.y - mRef.nodeFarm4_2.y))

						FindMoveAngle(this.x, this.y, mRef.nodeFarm4_2.x, mRef.nodeFarm4_2.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}

					}
					if (nodeNumber == 5)
					{
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm5_1.x) *
							(this.x - mRef.nodeFarm5_1.x) +
							(this.y - mRef.nodeFarm5_1.y) *
							(this.y - mRef.nodeFarm5_1.y))

						FindMoveAngle(this.x, this.y, mRef.nodeFarm5_1.x, mRef.nodeFarm5_1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 6)
					{
						FindMoveAngle(this.x, this.y, mRef.bFishingTown1.x, mRef.bFishingTown1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (currentResourceAmount < 25)
						{
							if (this.hitTestObject(mRef.bFishingTown1) == true)
							{
								speed = 0;
								currentResourceAmount += 0.1
								mRef.bFishingTown1.currentFishAmount -= 0.1;
							}
						}

						if (currentResourceAmount >= 25)
						{
							speed = 0.2;
							currentResourceAmount = 25;
							nodeNumber -= 1;
							goingToTown = false;
						}
					}

					// find first node


				}
				/////////////////////// FISH 2
				
				if (this.name == "bTradeFish2_NULL" && mRef.bFishingTown2.hasTradeCartActive == true)
				{
					//speed = 0.3;
					//this.rotation = objAngle - 45;
					//trace(currentResourceAmount);
					// nodeNumber 0 = go to bCity
					// nodeNumber 1 = go to nodeFarm1_1
					// node number 2 = go to farmTown1

					if (nodeNumber == 0)
					{
						FindMoveAngle(this.x, this.y, mRef.bCity.x, mRef.bCity.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (currentResourceAmount > 0)
						{
							if (this.hitTestObject(mRef.bCity) == true)
							{
								//trace("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
								currentResourceAmount -= 0.1
								mRef.bCity.fishTotal += 0.1;
							}
						}
						if (currentResourceAmount <= 0)
						{
							currentResourceAmount = 0;
							nodeNumber = 1;
							goingToTown = true;
						}
					}
					if (nodeNumber == 1)
					{
						//nodeNumber = 2;

						//trace("HELLO!")
						//trace(speed)
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm1_1.x) *
							(this.x - mRef.nodeFarm1_1.x) +
							(this.y - mRef.nodeFarm1_1.y) *
							(this.y - mRef.nodeFarm1_1.y))
						//trace(fDist1)
						FindMoveAngle(this.x, this.y, mRef.nodeFarm1_1.x, mRef.nodeFarm1_1.y);

						this.x += Math.cos(objAngle) * speed ;
						this.y += Math.sin(objAngle) * speed ;
						//trace(objAngle)
						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 2)
					{
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm7_1.x) *
							(this.x - mRef.nodeFarm7_1.x) +
							(this.y - mRef.nodeFarm7_1.y) *
							(this.y - mRef.nodeFarm7_1.y))

						FindMoveAngle(this.x, this.y, mRef.nodeFarm7_1.x, mRef.nodeFarm7_1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					if (nodeNumber == 3)
					{
						fDist1 = Math.sqrt((this.x - mRef.nodeFarm7_2.x) *
							(this.x - mRef.nodeFarm7_2.x) +
							(this.y - mRef.nodeFarm7_2.y) *
							(this.y - mRef.nodeFarm7_2.y))

						FindMoveAngle(this.x, this.y, mRef.nodeFarm7_2.x, mRef.nodeFarm7_2.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (goingToTown == true && fDist1 <= hypotDist)
						{
							nodeNumber += 1;
						}

						if (goingToTown == false && fDist1 <= hypotDist)
						{
							nodeNumber -= 1;

						}
					}
					
					if (nodeNumber == 4)
					{
						FindMoveAngle(this.x, this.y, mRef.bFishingTown2.x, mRef.bFishingTown2.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;
						if (currentResourceAmount < 25)
						{
							if (this.hitTestObject(mRef.bFishingTown2) == true)
							{
								//trace("aa")
								speed = 0;
								currentResourceAmount += 0.1
								mRef.bFishingTown2.currentFishAmount -= 0.1;
								
							}
						}

						if (currentResourceAmount >= 25)
						{
							speed = 0.2;
							currentResourceAmount = 25;
							nodeNumber -= 1;
							goingToTown = false;
						}
					}

					// find first node


				}

			}
			// loop
		}
		// loop 

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
	}
}