package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class WorkerLogger extends MovieClip
	{

		var objState: String = "idle"

		var maxWood: Number = 10;
		var isAlive: Boolean = true;
		var currentWoodAmount: Number = 0;
		var objHealth: Number = 100;
		var hitByWhirlwind: Boolean = false;
		var LoggingHomeTownName: String = "";
		var currentTreeName: String = "";
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
		public function WorkerLogger()
		{
			// constructor code

			mRef = MovieClip(this.parent);
			this.addEventListener(Event.ENTER_FRAME, Loop);
			//trace("inside : " + this.name)
		}

		public function Loop(e: Event)
		{
			if (mRef.objState == "play")
			{

				///////////////////////////////////// LOGGING TOWN 1//////////////////////////////////  
				if (this.name == "bwl7" || this.name == "bwl8" || this.name == "bwl9" && isAlive == true)
				{
					if (mRef.bLoggingTown1.isOnFireBool == true)
					{
						isAlive = false;
						this.visible = false;
					}
					else
					{
						this.visible = true;
					}
					if (objState == "idle")
					{
						objState = "goToNearestFarm"
						if (objState == "goToNearestFarm")
						{
							FindNearestTree3();
						}
					}

					if (objState == "goToNearestFarm")
					{
						if (mRef.tree11.canBeLogged == false &&
							mRef.tree12.canBeLogged == false &&
							mRef.tree13.canBeLogged == false &&
							mRef.tree14.canBeLogged == false &&
							mRef.tree15.canBeLogged == false)
						{
							objState = "goToLoggingTown"
						}

						if (currentTreeName == "tree11")
						{
							FindMoveAngle(this.x, this.y, mRef.tree11.x, mRef.tree11.y);
						}
						if (currentTreeName == "tree12")
						{
							FindMoveAngle(this.x, this.y, mRef.tree12.x, mRef.tree12.y);
						}
						if (currentTreeName == "tree13")
						{
							FindMoveAngle(this.x, this.y, mRef.tree13.x, mRef.tree13.y);
						}
						if (currentTreeName == "tree14")
						{
							FindMoveAngle(this.x, this.y, mRef.tree14.x, mRef.tree14.y);
						}
						if (currentTreeName == "tree15")
						{
							FindMoveAngle(this.x, this.y, mRef.tree15.x, mRef.tree15.y);
						}
						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (currentTreeName == "tree11")
						{
							if (this.hitTestObject(mRef.tree11) == true)
							{
								objState = "collectWood"
							}
						}
						if (currentTreeName == "tree12")
						{
							if (this.hitTestObject(mRef.tree12) == true)
							{
								objState = "collectWood"
							}
						}
						if (currentTreeName == "tree13")
						{
							if (this.hitTestObject(mRef.tree13) == true)
							{
								objState = "collectWood"
							}
						}
						if (currentTreeName == "tree14")
						{
							if (this.hitTestObject(mRef.tree14) == true)
							{
								objState = "collectWood"
							}
						}
						if (currentTreeName == "tree15")
						{
							if (this.hitTestObject(mRef.tree15) == true)
							{
								objState = "collectWood"
							}
						}
					}

					if (objState == "collectWood")
					{
						if (this.hitTestObject(mRef.tree11) == true)
						{
							if (mRef.tree11.remainingWood > 0 && currentWoodAmount < maxWood)
							{
								mRef.tree11.remainingWood -= 0.1
								currentWoodAmount += 0.1;
							}
							if (mRef.tree11.remainingWood <= 0 && currentWoodAmount < maxWood)
							{
								objState = "idle"
							}

						}
						if (this.hitTestObject(mRef.tree12) == true)
						{
							if (mRef.tree12.remainingWood > 0 && currentWoodAmount < maxWood)
							{
								mRef.tree12.remainingWood -= 0.1
								currentWoodAmount += 0.1;
							}
							if (mRef.tree12.remainingWood <= 0 && currentWoodAmount < maxWood)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.tree13) == true)
						{
							if (mRef.tree13.remainingWood > 0 && currentWoodAmount < maxWood)
							{
								mRef.tree13.remainingWood -= 0.1
								currentWoodAmount += 0.1;
							}
							if (mRef.tree13.remainingWood <= 0 && currentWoodAmount < maxWood)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.tree14) == true)
						{
							if (mRef.tree14.remainingWood > 0 && currentWoodAmount < maxWood)
							{
								mRef.tree14.remainingWood -= 0.1
								currentWoodAmount += 0.1;
							}
							if (mRef.tree14.remainingWood <= 0 && currentWoodAmount < maxWood)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.tree15) == true)
						{
							if (mRef.tree15.remainingWood > 0 && currentWoodAmount < maxWood)
							{
								mRef.tree15.remainingWood -= 0.1
								currentWoodAmount += 0.1;
							}
							if (mRef.tree15.remainingWood <= 0 && currentWoodAmount < maxWood)
							{
								objState = "idle"
							}
						}

						if (currentWoodAmount >= 10)
						{
							currentWoodAmount = 10
							objState = "goToLoggingTown";
						}
					}

					if (objState == "goToLoggingTown")
					{
						if (mRef.bLoggingTown1.isOnFireBool == true)
						{
							isAlive = false;
							this.visible = false;
						}
						else
						{
							this.visible = true;
						}
						FindMoveAngle(this.x, this.y, mRef.bLoggingTown1.x, mRef.bLoggingTown1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (this.hitTestObject(mRef.bLoggingTown1) == true)
						{

							currentWoodAmount -= 0.1;
							mRef.bLoggingTown1.currentWoodAmount += 0.1;
							if (currentWoodAmount <= 0)
							{
								objState = "idle"
								currentWoodAmount = 0;
							}
						}
					}

					if (objState == "notActive")
					{

					}
					if (objState == "dead")
					{

					}
				}


				///////////////////////////////////// LOGGING TOWN 3 //////////////////////////////////
				if (this.name == "bwl1" || this.name == "bwl2" || this.name == "bwl3" &&  isAlive == true)
				{
					if (mRef.bLoggingTown3.isOnFireBool == true)
					{
						isAlive = false;
						this.visible = false;
					}
					else
					{
						this.visible = true;
					}
					if (objState == "idle")
					{

						objState = "goToNearestFarm"

						if (objState == "goToNearestFarm")
						{
							FindNearestTree();
						}

					}

					if (objState == "goToNearestFarm")
					{



						if (mRef.tree1.canBeLogged == false &&
							mRef.tree2.canBeLogged == false &&
							mRef.tree3.canBeLogged == false &&
							mRef.tree4.canBeLogged == false &&
							mRef.tree5.canBeLogged == false)
						{
							objState = "goToLoggingTown"
						}


						if (currentTreeName == "tree1")
						{
							FindMoveAngle(this.x, this.y, mRef.tree1.x, mRef.tree1.y);
						}
						if (currentTreeName == "tree2")
						{
							FindMoveAngle(this.x, this.y, mRef.tree2.x, mRef.tree2.y);
						}
						if (currentTreeName == "tree3")
						{
							FindMoveAngle(this.x, this.y, mRef.tree3.x, mRef.tree3.y);
						}
						if (currentTreeName == "tree4")
						{
							FindMoveAngle(this.x, this.y, mRef.tree4.x, mRef.tree4.y);
						}
						if (currentTreeName == "tree5")
						{
							FindMoveAngle(this.x, this.y, mRef.tree5.x, mRef.tree5.y);
						}
						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (currentTreeName == "tree1")
						{
							if (this.hitTestObject(mRef.tree1) == true)
							{
								objState = "collectWood"
							}
						}
						if (currentTreeName == "tree2")
						{
							if (this.hitTestObject(mRef.tree2) == true)
							{
								objState = "collectWood"
							}
						}
						if (currentTreeName == "tree3")
						{
							if (this.hitTestObject(mRef.tree3) == true)
							{
								objState = "collectWood"
							}
						}
						if (currentTreeName == "tree4")
						{
							if (this.hitTestObject(mRef.tree4) == true)
							{
								objState = "collectWood"
							}
						}
						if (currentTreeName == "tree5")
						{
							if (this.hitTestObject(mRef.tree5) == true)
							{
								objState = "collectWood"
							}
						}
					}

					if (objState == "collectWood")
					{
						if (this.hitTestObject(mRef.tree1) == true)
						{
							if (mRef.tree1.remainingWood > 0 && currentWoodAmount < maxWood)
							{
								mRef.tree1.remainingWood -= 0.1
								currentWoodAmount += 0.1;
							}
							if (mRef.tree1.remainingWood <= 0 && currentWoodAmount < maxWood)
							{
								objState = "idle"
							}

						}
						if (this.hitTestObject(mRef.tree2) == true)
						{
							if (mRef.tree2.remainingWood > 0 && currentWoodAmount < maxWood)
							{
								mRef.tree2.remainingWood -= 0.1
								currentWoodAmount += 0.1;
							}
							if (mRef.tree2.remainingWood <= 0 && currentWoodAmount < maxWood)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.tree3) == true)
						{
							if (mRef.tree3.remainingWood > 0 && currentWoodAmount < maxWood)
							{
								mRef.tree3.remainingWood -= 0.1
								currentWoodAmount += 0.1;
							}
							if (mRef.tree3.remainingWood <= 0 && currentWoodAmount < maxWood)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.tree4) == true)
						{
							if (mRef.tree4.remainingWood > 0 && currentWoodAmount < maxWood)
							{
								mRef.tree4.remainingWood -= 0.1
								currentWoodAmount += 0.1;
							}
							if (mRef.tree4.remainingWood <= 0 && currentWoodAmount < maxWood)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.tree5) == true)
						{
							if (mRef.tree5.remainingWood > 0 && currentWoodAmount < maxWood)
							{
								mRef.tree5.remainingWood -= 0.1
								currentWoodAmount += 0.1;
							}
							if (mRef.tree5.remainingWood <= 0 && currentWoodAmount < maxWood)
							{
								objState = "idle"
							}
						}

						if (currentWoodAmount >= 10)
						{
							currentWoodAmount = 10
							objState = "goToLoggingTown";
						}

					}

					if (objState == "goToLoggingTown")
					{


						FindMoveAngle(this.x, this.y, mRef.bLoggingTown3.x, mRef.bLoggingTown3.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (this.hitTestObject(mRef.bLoggingTown3) == true)
						{
							currentWoodAmount -= 0.1;
							mRef.bLoggingTown3.currentWoodAmount += 0.1;
							if (currentWoodAmount <= 0)
							{
								objState = "idle"
								currentWoodAmount = 0;
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
			//loop
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

			////////trace("done")
			return;

		}
		public function FindNearestTree()
		{
			fDist1 = Math.sqrt((this.x - mRef.tree1.x) * (this.x - mRef.tree1.x) + (this.y - mRef.tree1.y) * (this.y - mRef.tree1.y))
			if (mRef.tree1.remainingWood <= 0)
			{
				fDist1 = Infinity;
			}
			fDist2 = Math.sqrt((this.x - mRef.tree2.x) * (this.x - mRef.tree2.x) + (this.y - mRef.tree2.y) * (this.y - mRef.tree2.y))
			if (mRef.tree2.remainingWood <= 0)
			{
				fDist2 = Infinity;
			}
			fDist3 = Math.sqrt((this.x - mRef.tree3.x) * (this.x - mRef.tree3.x) + (this.y - mRef.tree3.y) * (this.y - mRef.tree3.y))
			if (mRef.tree3.remainingWood <= 0)
			{
				fDist3 = Infinity;
			}
			fDist4 = Math.sqrt((this.x - mRef.tree4.x) * (this.x - mRef.tree4.x) + (this.y - mRef.tree4.y) * (this.y - mRef.tree4.y))
			if (mRef.tree4.remainingWood <= 0)
			{
				fDist4 = Infinity;
			}
			fDist5 = Math.sqrt((this.x - mRef.tree5.x) * (this.x - mRef.tree5.x) + (this.y - mRef.tree5.y) * (this.y - mRef.tree5.y))
			if (mRef.tree5.remainingWood <= 0)
			{
				fDist5 = Infinity;
			}
			if (fDist1 < fDist2 &&
				fDist1 < fDist3 &&
				fDist1 < fDist2 &&
				fDist1 < fDist4)
			{
				currentTreeName = mRef.tree1.name;
				//FindMoveAngle(this.x, this.y, mRef.tree1.x, mRef.tree1.y);

				//////trace(fDist1)
			}
			//x1, y1, x2, y2

			if (fDist2 < fDist1 &&
				fDist2 < fDist3 &&
				fDist2 < fDist4 &&
				fDist2 < fDist5)
			{
				currentTreeName = mRef.tree2.name;

				//FindMoveAngle(this.x, this.y, mRef.tree2.x, mRef.tree2.y);
				//////trace(fDist2)
			}

			if (fDist3 < fDist1 &&
				fDist3 < fDist2 &&
				fDist3 < fDist4 &&
				fDist3 < fDist5)
			{
				currentTreeName = mRef.tree3.name;

				//FindMoveAngle(this.x, this.y, mRef.tree3.x, mRef.tree3.y);
				//////trace(fDist3)
			}

			if (fDist4 < fDist1 &&
				fDist4 < fDist2 &&
				fDist4 < fDist3 &&
				fDist4 < fDist5)
			{
				currentTreeName = mRef.tree4.name;

				//FindMoveAngle(this.x, this.y, mRef.tree4.x, mRef.tree4.y);
				//////trace(fDist4)
			}

			if (fDist5 < fDist1 &&
				fDist5 < fDist2 &&
				fDist5 < fDist3 &&
				fDist5 < fDist4)
			{
				currentTreeName = mRef.tree5.name;

				//FindMoveAngle(this.x, this.y, mRef.tree5.x, mRef.tree5.y);
				//////trace(fDist5)
			}
			//////trace("aaaaaa");
			return;
		}

		public function FindNearestTree2()
		{
			fDist1 = Math.sqrt((this.x - mRef.tree6.x) * (this.x - mRef.tree6.x) + (this.y - mRef.tree6.y) * (this.y - mRef.tree6.y))
			if (mRef.tree6.remainingWood <= 0)
			{
				fDist1 = Infinity;
			}
			fDist2 = Math.sqrt((this.x - mRef.tree7.x) * (this.x - mRef.tree7.x) + (this.y - mRef.tree7.y) * (this.y - mRef.tree7.y))
			if (mRef.tree7.remainingWood <= 0)
			{
				fDist2 = Infinity;
			}
			fDist3 = Math.sqrt((this.x - mRef.tree8.x) * (this.x - mRef.tree8.x) + (this.y - mRef.tree8.y) * (this.y - mRef.tree8.y))
			if (mRef.tree8.remainingWood <= 0)
			{
				fDist3 = Infinity;
			}
			fDist4 = Math.sqrt((this.x - mRef.tree9.x) * (this.x - mRef.tree9.x) + (this.y - mRef.tree9.y) * (this.y - mRef.tree9.y))
			if (mRef.tree9.remainingWood <= 0)
			{
				fDist4 = Infinity;
			}
			fDist5 = Math.sqrt((this.x - mRef.tree10.x) * (this.x - mRef.tree10.x) + (this.y - mRef.tree10.y) * (this.y - mRef.tree10.y))
			if (mRef.tree10.remainingWood <= 0)
			{
				fDist5 = Infinity;
			}
			if (fDist1 < fDist2 &&
				fDist1 < fDist3 &&
				fDist1 < fDist2 &&
				fDist1 < fDist4)
			{
				currentTreeName = mRef.tree6.name;
				//FindMoveAngle(this.x, this.y, mRef.tree6.x, mRef.tree6.y);

				//////trace(fDist1)
			}
			//x1, y1, x2, y2

			if (fDist2 < fDist1 &&
				fDist2 < fDist3 &&
				fDist2 < fDist4 &&
				fDist2 < fDist5)
			{
				currentTreeName = mRef.tree7.name;

				//FindMoveAngle(this.x, this.y, mRef.tree7.x, mRef.tree7.y);
				//////trace(fDist2)
			}

			if (fDist3 < fDist1 &&
				fDist3 < fDist2 &&
				fDist3 < fDist4 &&
				fDist3 < fDist5)
			{
				currentTreeName = mRef.tree8.name;

				//FindMoveAngle(this.x, this.y, mRef.tree8.x, mRef.tree8.y);
				//////trace(fDist3)
			}

			if (fDist4 < fDist1 &&
				fDist4 < fDist2 &&
				fDist4 < fDist3 &&
				fDist4 < fDist5)
			{
				currentTreeName = mRef.tree9.name;

				//FindMoveAngle(this.x, this.y, mRef.tree9.x, mRef.tree9.y);
				//////trace(fDist4)
			}

			if (fDist5 < fDist1 &&
				fDist5 < fDist2 &&
				fDist5 < fDist3 &&
				fDist5 < fDist4)
			{
				currentTreeName = mRef.tree10.name;

				//FindMoveAngle(this.x, this.y, mRef.tree10.x, mRef.tree10.y);
				//////trace(fDist5)
			}
			//////trace("aaaaaa");
			return;
		}

		public function FindNearestTree3()
		{
			fDist1 = Math.sqrt((this.x - mRef.tree11.x) * (this.x - mRef.tree11.x) + (this.y - mRef.tree11.y) * (this.y - mRef.tree11.y))
			if (mRef.tree11.remainingWood <= 0)
			{
				fDist1 = Infinity;
			}
			fDist2 = Math.sqrt((this.x - mRef.tree12.x) * (this.x - mRef.tree12.x) + (this.y - mRef.tree12.y) * (this.y - mRef.tree12.y))
			if (mRef.tree12.remainingWood <= 0)
			{
				fDist2 = Infinity;
			}
			fDist3 = Math.sqrt((this.x - mRef.tree13.x) * (this.x - mRef.tree13.x) + (this.y - mRef.tree13.y) * (this.y - mRef.tree13.y))
			if (mRef.tree13.remainingWood <= 0)
			{
				fDist3 = Infinity;
			}
			fDist4 = Math.sqrt((this.x - mRef.tree14.x) * (this.x - mRef.tree14.x) + (this.y - mRef.tree14.y) * (this.y - mRef.tree14.y))
			if (mRef.tree14.remainingWood <= 0)
			{
				fDist4 = Infinity;
			}
			fDist5 = Math.sqrt((this.x - mRef.tree15.x) * (this.x - mRef.tree15.x) + (this.y - mRef.tree15.y) * (this.y - mRef.tree15.y))
			if (mRef.tree15.remainingWood <= 0)
			{
				fDist5 = Infinity;
			}
			if (fDist1 < fDist2 &&
				fDist1 < fDist3 &&
				fDist1 < fDist2 &&
				fDist1 < fDist4)
			{
				currentTreeName = mRef.tree11.name;
				//FindMoveAngle(this.x, this.y, mRef.tree11.x, mRef.tree11.y);

				//////trace(fDist1)
			}
			//x1, y1, x2, y2

			if (fDist2 < fDist1 &&
				fDist2 < fDist3 &&
				fDist2 < fDist4 &&
				fDist2 < fDist5)
			{
				currentTreeName = mRef.tree12.name;

				//FindMoveAngle(this.x, this.y, mRef.tree12.x, mRef.tree12.y);
				//////trace(fDist2)
			}

			if (fDist3 < fDist1 &&
				fDist3 < fDist2 &&
				fDist3 < fDist4 &&
				fDist3 < fDist5)
			{
				currentTreeName = mRef.tree13.name;

				//FindMoveAngle(this.x, this.y, mRef.tree13.x, mRef.tree13.y);
				//////trace(fDist3)
			}

			if (fDist4 < fDist1 &&
				fDist4 < fDist2 &&
				fDist4 < fDist3 &&
				fDist4 < fDist5)
			{
				currentTreeName = mRef.tree14.name;

				//FindMoveAngle(this.x, this.y, mRef.tree14.x, mRef.tree14.y);
				//////trace(fDist4)
			}

			if (fDist5 < fDist1 &&
				fDist5 < fDist2 &&
				fDist5 < fDist3 &&
				fDist5 < fDist4)
			{
				currentTreeName = mRef.tree15.name;

				//FindMoveAngle(this.x, this.y, mRef.tree15.x, mRef.tree15.y);
				//////trace(fDist5)
			}
			//////trace("aaaaaa");
			return;
		}

	}

}