package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class BFighter extends MovieClip
	{

		var mRef: MovieClip;
		var objState: String = "notActive"
		var isActiveBool: Boolean = false;
		var nodeToAttack: String = ""
		var fDist1 : Number = 0;
		var speed : Number = 0.2;
		var objAngle : Number = 0;
		var hypotDist : Number = 10;
		var angleRad : Number =  0; 
		
		public function BFighter()
		{
			// constructor code

			mRef = MovieClip(this.parent);
			this.addEventListener(Event.ENTER_FRAME, Loop);


		}
		public function Loop(e: Event)
		{
			if (objState == "active")
			{
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
					if (mRef.rCity.teamState == "red")
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
							// DEAL DAMAGE
						}
					}
					if (mRef.rFishTown1.teamState == "blue")
					{

						nodeToAttack = ""
						objState = "notActive";
						isActiveBool = false;

					}
				}
			}
		}

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