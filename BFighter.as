﻿package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class BFighter extends MovieClip
	{

		var mRef: MovieClip;
		var objState: String = "notActive"
		var isActiveBool: Boolean = false;
		var nodeToAttack: String = ""
		var fDist1: Number = 0;
		var speed: Number = 0.2;
		var objAngle: Number = 0;
		var hypotDist: Number = 10;
		var angleRad: Number = 0;
		var objHealth: Number = 100;
		var resetCounter: Number = 0;
		var overwriteAll: Boolean = false;
		var dmgCounter: Number = 0;

		public function BFighter()
		{
			// constructor code

			mRef = MovieClip(this.parent);
			this.addEventListener(Event.ENTER_FRAME, Loop);


		}

		public function ResetFunction()
		{

			objState = "notActive"
			isActiveBool = false;
			nodeToAttack = ""
			fDist1 = 0;
			speed = 0.2;
			objAngle = 0;
			hypotDist = 10;
			angleRad = 0;
			objHealth = 100;
			resetCounter = 0;
			overwriteAll = false;
			dmgCounter = 0;

		}
		public function Loop(e: Event)
		{
			
			if (overwriteAll == false)
			{
				if (objState == "active")
				{
					if (this.alpha < 1)
					{
						this.alpha += 0.05;
					}
					if (this.alpha == 1)
					{
						this.alpha = 1;
					}
					if (nodeToAttack == "rFishTown1")
					{
						if (mRef.rFishTown1.teamState == "red")
						{
							fDist1 = Math.sqrt((this.x - mRef.nodeFakeTown.x) *
								(this.x - mRef.nodeFakeTown.x) +
								(this.y - mRef.nodeFakeTown.y) *
								(this.y - mRef.nodeFakeTown.y))
							FindMoveAngle(this.x, this.y, mRef.nodeFakeTown.x, mRef.nodeFakeTown.y);

							this.x += Math.cos(objAngle) * speed;
							this.y += Math.sin(objAngle) * speed;

							if (fDist1 <= hypotDist)
							{
								mRef.rFishTown1.teamState = "blue"
								isActiveBool = false;
								trace("DEAL DAMAGE")
								// DEAL DAMAGE
							}
						}
						else if (mRef.rFishTown1.teamState == "blue")
						{

							nodeToAttack = ""
							objState = "notActive";
							isActiveBool = false;

						}
					}

					if (nodeToAttack == "rCity")
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
							isActiveBool = false;
							trace("DEAL DAMAGE")
							mRef.rCity.objHealth -= 0.1;
							if (mRef.rCity.objHealth <= 0)
							{
								objState = "notActive"
								isActiveBool = false;
								nodeToAttack = ""
							}
							// DEAL DAMAGE
						}
					}
				}
				if (objState == "notActive")
				{
					if (this.alpha > 0)
					{
						this.alpha -= 0.05;
					}
					if (this.alpha <= 0)
					{
						this.x = 1000;
					}

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
				if (objHealth <= 0)
				{
					this.alpha -= 0.05;
					objState = "notActive"
					overwriteAll = false;
					objHealth = 100;
					dmgCounter = 0;
					resetCounter = 0;
				}
			}
			trace("objState " + objState + " " + this.name)

			//loop
		}
		//loop

		public function PlaceSamuari(xLoc, yLoc, objName)
		{
			this.x = xLoc;
			this.y = yLoc;
			isActiveBool = true;
			nodeToAttack = objName
			objState = "active";
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