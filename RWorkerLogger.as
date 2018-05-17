﻿package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class RWorkerLogger extends MovieClip
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
		public function RWorkerLogger()
		{
			// constructor code

			mRef = MovieClip(this.parent);
			this.addEventListener(Event.ENTER_FRAME, Loop);
			trace("inside : " + this.name)
		}

		public function Loop(e: Event)
		{
			if (mRef.objState == "play")
			{
				//this.rotation = objAngle + 45;
				///////////////////////////////////// BWtree1 & BWtree2 & BWtree3 //////////////////////////////////
				if (this.name == "rWL1_1" || this.name == "rWL1_2" || this.name == "rWL1_3")
				{
				
					if (objState == "idle")
					{

						objState = "goToNearestFarm"

						if (objState == "goToNearestFarm")
						{
							FindNearestTree();
							////trace("find nearest called")

						}

					}

					if (objState == "goToNearestFarm")
					{



						if (mRef.rTree1_1.canBeLogged == false &&
							mRef.rTree1_2.canBeLogged == false &&
							mRef.rTree1_3.canBeLogged == false &&
							mRef.rTree1_3.canBeLogged == false &&
							mRef.rTree1_5.canBeLogged == false)
						{
							objState = "goToLoggingTown"
						}


						if (currentTreeName == "rTree1_1")
						{
							FindMoveAngle(this.x, this.y, mRef.rTree1_1.x, mRef.rTree1_1.y);
						}
						if (currentTreeName == "rTree1_2")
						{
							FindMoveAngle(this.x, this.y, mRef.rTree1_2.x, mRef.rTree1_2.y);
						}
						if (currentTreeName == "rTree1_3")
						{
							FindMoveAngle(this.x, this.y, mRef.rTree1_3.x, mRef.rTree1_3.y);
						}
						if (currentTreeName == "rTree1_4")
						{
							FindMoveAngle(this.x, this.y, mRef.rTree1_4.x, mRef.rTree1_4.y);
						}
						if (currentTreeName == "rTree1_5")
						{
							FindMoveAngle(this.x, this.y, mRef.rTree1_5.x, mRef.rTree1_5.y);
						}
						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (currentTreeName == "rTree1_1")
						{
							if (this.hitTestObject(mRef.rTree1_1) == true)
							{
								objState = "collectWood"
							}
						}
						if (currentTreeName == "rTree1_2")
						{
							if (this.hitTestObject(mRef.rTree1_2) == true)
							{
								objState = "collectWood"
							}
						}
						if (currentTreeName == "rTree1_3")
						{
							if (this.hitTestObject(mRef.rTree1_3) == true)
							{
								objState = "collectWood"
							}
						}
						if (currentTreeName == "rTree1_4")
						{
							if (this.hitTestObject(mRef.rTree1_4) == true)
							{
								objState = "collectWood"
							}
						}
						if (currentTreeName == "rTree1_5")
						{
							if (this.hitTestObject(mRef.rTree1_5) == true)
							{
								objState = "collectWood"
							}
						}
						//////trace(objAngle);
						//////trace(currentTreeName + " current farm name")

					}

					if (objState == "collectWood")
					{
						if (this.hitTestObject(mRef.rTree1_1) == true)
						{
							if (mRef.rTree1_1.remainingWood > 0 && currentWoodAmount < maxWood)
							{
								mRef.rTree1_1.remainingWood -= 0.1
								currentWoodAmount += 0.1;
							}
							if (mRef.rTree1_1.remainingWood <= 0 && currentWoodAmount < maxWood)
							{
								objState = "idle"
							}

						}
						if (this.hitTestObject(mRef.rTree1_2) == true)
						{
							if (mRef.rTree1_2.remainingWood > 0 && currentWoodAmount < maxWood)
							{
								mRef.rTree1_2.remainingWood -= 0.1
								currentWoodAmount += 0.1;
							}
							if (mRef.rTree1_2.remainingWood <= 0 && currentWoodAmount < maxWood)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.rTree1_3) == true)
						{
							if (mRef.rTree1_3.remainingWood > 0 && currentWoodAmount < maxWood)
							{
								mRef.rTree1_3.remainingWood -= 0.1
								currentWoodAmount += 0.1;
							}
							if (mRef.rTree1_3.remainingWood <= 0 && currentWoodAmount < maxWood)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.rTree1_4) == true)
						{
							if (mRef.rTree1_4.remainingWood > 0 && currentWoodAmount < maxWood)
							{
								mRef.rTree1_4.remainingWood -= 0.1
								currentWoodAmount += 0.1;
							}
							if (mRef.rTree1_4.remainingWood <= 0 && currentWoodAmount < maxWood)
							{
								objState = "idle"
							}
						}
						if (this.hitTestObject(mRef.rTree1_5) == true)
						{
							if (mRef.rTree1_5.remainingWood > 0 && currentWoodAmount < maxWood)
							{
								mRef.rTree1_5.remainingWood -= 0.1
								currentWoodAmount += 0.1;
							}
							if (mRef.rTree1_5.remainingWood <= 0 && currentWoodAmount < maxWood)
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


						FindMoveAngle(this.x, this.y, mRef.rLog1.x, mRef.rLog1.y);

						this.x += Math.cos(objAngle) * speed;
						this.y += Math.sin(objAngle) * speed;

						if (this.hitTestObject(mRef.rLog1) == true)
						{
							currentWoodAmount -= 0.1;
							mRef.rLog1.currentWoodAmount += 0.1;
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

			//////trace("done")
			return;

		}
		public function FindNearestTree()
		{
			fDist1 = Math.sqrt((this.x - mRef.rTree1_1.x) * (this.x - mRef.rTree1_1.x) + (this.y - mRef.rTree1_1.y) * (this.y - mRef.rTree1_1.y))
			if (mRef.rTree1_1.remainingWood <= 0)
			{
				fDist1 = Infinity;
			}
			fDist2 = Math.sqrt((this.x - mRef.rTree1_2.x) * (this.x - mRef.rTree1_2.x) + (this.y - mRef.rTree1_2.y) * (this.y - mRef.rTree1_2.y))
			if (mRef.rTree1_2.remainingWood <= 0)
			{
				fDist2 = Infinity;
			}
			fDist3 = Math.sqrt((this.x - mRef.rTree1_3.x) * (this.x - mRef.rTree1_3.x) + (this.y - mRef.rTree1_3.y) * (this.y - mRef.rTree1_3.y))
			if (mRef.rTree1_3.remainingWood <= 0)
			{
				fDist3 = Infinity;
			}
			fDist4 = Math.sqrt((this.x - mRef.rTree1_4.x) * (this.x - mRef.rTree1_4.x) + (this.y - mRef.rTree1_4.y) * (this.y - mRef.rTree1_4.y))
			if (mRef.rTree1_4.remainingWood <= 0)
			{
				fDist4 = Infinity;
			}
			fDist5 = Math.sqrt((this.x - mRef.rTree1_5.x) * (this.x - mRef.rTree1_5.x) + (this.y - mRef.rTree1_5.y) * (this.y - mRef.rTree1_5.y))
			if (mRef.rTree1_5.remainingWood <= 0)
			{
				fDist5 = Infinity;
			}
			if (fDist1 < fDist2 &&
				fDist1 < fDist3 &&
				fDist1 < fDist2 &&
				fDist1 < fDist4)
			{
				currentTreeName = mRef.rTree1_1.name;
				//FindMoveAngle(this.x, this.y, mRef.tree1.x, mRef.tree1.y);

				////trace(fDist1)
			}
			//x1, y1, x2, y2

			if (fDist2 < fDist1 &&
				fDist2 < fDist3 &&
				fDist2 < fDist4 &&
				fDist2 < fDist5)
			{
				currentTreeName = mRef.rTree1_2.name;

				//FindMoveAngle(this.x, this.y, mRef.tree2.x, mRef.tree2.y);
				////trace(fDist2)
			}

			if (fDist3 < fDist1 &&
				fDist3 < fDist2 &&
				fDist3 < fDist4 &&
				fDist3 < fDist5)
			{
				currentTreeName = mRef.rTree1_3.name;

				//FindMoveAngle(this.x, this.y, mRef.tree3.x, mRef.tree3.y);
				////trace(fDist3)
			}

			if (fDist4 < fDist1 &&
				fDist4 < fDist2 &&
				fDist4 < fDist3 &&
				fDist4 < fDist5)
			{
				currentTreeName = mRef.rTree1_4.name;

				//FindMoveAngle(this.x, this.y, mRef.tree4.x, mRef.tree4.y);
				////trace(fDist4)
			}

			if (fDist5 < fDist1 &&
				fDist5 < fDist2 &&
				fDist5 < fDist3 &&
				fDist5 < fDist4)
			{
				currentTreeName = mRef.rTree1_5.name;

				//FindMoveAngle(this.x, this.y, mRef.tree5.x, mRef.tree5.y);
				////trace(fDist5)
			}
			////trace("aaaaaa");
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

				////trace(fDist1)
			}
			//x1, y1, x2, y2

			if (fDist2 < fDist1 &&
				fDist2 < fDist3 &&
				fDist2 < fDist4 &&
				fDist2 < fDist5)
			{
				currentTreeName = mRef.tree7.name;

				//FindMoveAngle(this.x, this.y, mRef.tree7.x, mRef.tree7.y);
				////trace(fDist2)
			}

			if (fDist3 < fDist1 &&
				fDist3 < fDist2 &&
				fDist3 < fDist4 &&
				fDist3 < fDist5)
			{
				currentTreeName = mRef.tree8.name;

				//FindMoveAngle(this.x, this.y, mRef.tree8.x, mRef.tree8.y);
				////trace(fDist3)
			}

			if (fDist4 < fDist1 &&
				fDist4 < fDist2 &&
				fDist4 < fDist3 &&
				fDist4 < fDist5)
			{
				currentTreeName = mRef.tree9.name;

				//FindMoveAngle(this.x, this.y, mRef.tree9.x, mRef.tree9.y);
				////trace(fDist4)
			}

			if (fDist5 < fDist1 &&
				fDist5 < fDist2 &&
				fDist5 < fDist3 &&
				fDist5 < fDist4)
			{
				currentTreeName = mRef.tree10.name;

				//FindMoveAngle(this.x, this.y, mRef.tree10.x, mRef.tree10.y);
				////trace(fDist5)
			}
			////trace("aaaaaa");
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

				////trace(fDist1)
			}
			//x1, y1, x2, y2

			if (fDist2 < fDist1 &&
				fDist2 < fDist3 &&
				fDist2 < fDist4 &&
				fDist2 < fDist5)
			{
				currentTreeName = mRef.tree12.name;

				//FindMoveAngle(this.x, this.y, mRef.tree12.x, mRef.tree12.y);
				////trace(fDist2)
			}

			if (fDist3 < fDist1 &&
				fDist3 < fDist2 &&
				fDist3 < fDist4 &&
				fDist3 < fDist5)
			{
				currentTreeName = mRef.tree13.name;

				//FindMoveAngle(this.x, this.y, mRef.tree13.x, mRef.tree13.y);
				////trace(fDist3)
			}

			if (fDist4 < fDist1 &&
				fDist4 < fDist2 &&
				fDist4 < fDist3 &&
				fDist4 < fDist5)
			{
				currentTreeName = mRef.tree14.name;

				//FindMoveAngle(this.x, this.y, mRef.tree14.x, mRef.tree14.y);
				////trace(fDist4)
			}

			if (fDist5 < fDist1 &&
				fDist5 < fDist2 &&
				fDist5 < fDist3 &&
				fDist5 < fDist4)
			{
				currentTreeName = mRef.tree15.name;

				//FindMoveAngle(this.x, this.y, mRef.tree15.x, mRef.tree15.y);
				////trace(fDist5)
			}
			////trace("aaaaaa");
			return;
		}

	}

}