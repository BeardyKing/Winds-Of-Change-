package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class ExpandBoxConnector extends MovieClip
	{

		var startBeingUsed: Boolean = false;
		var objState: String = "init"
		var mRef = MovieClip;
		var expandCounter: Number = 0;
		var expandBool: Boolean = false;
		var singlePass: Boolean = false;
		var scaleSpeed: Number = 0.01
		var isActiveBool : Boolean = false;
		public function ExpandBoxConnector()
		{
			// constructor code
			mRef = MovieClip(this.parent);
			this.addEventListener(Event.ENTER_FRAME, Loop)
		}
		public function Loop(e: Event)
		{
			trace(objState + " objState " + this.name)
			if (objState == "init")
			{
				objState = "idle";
			}
			if (objState == "idle")
			{
				this.x = mRef.fire2.x;
					this.y = mRef.fire2.y;
				this.alpha = 0.3;
				this.scaleX = 1
				this.scaleY = 1
				isActiveBool = false
			}
			if (objState == "expand")
			{
				isActiveBool = true;
				if (singlePass == false)
				{
					
					singlePass = true;
					this.x = mRef.fire2.x;
					this.y = mRef.fire2.y;
				}
				expandCounter += 1;
				if (expandCounter > stage.frameRate * 2)
				{
					expandCounter = 0;
					expandBool = !expandBool;
				}

				if (expandBool == false)
				{
					this.scaleX += scaleSpeed;

				}

				if (expandBool == true)
				{
					this.scaleY += scaleSpeed;

				}
				if (this.scaleX >= 10 || this.scaleY >= 10)
				{

					objState = "reset"
					//this.x = 1000
				}
			}
			
			if (objState == "reset")
			{
				
				objState = "idle"
			}

			if (mRef.fire2.objState == "onFire" || mRef.fire3.objState == "onFire")
			{
				objState = "expand";
			}
			this.alpha = 0.5
			//loop
		}
		//loop

	}

}