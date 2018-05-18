package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class ExpandBoxConnector extends MovieClip {
		
		var startBeingUsed : Boolean = false;
		var objState : String = "init"
		var mRef = MovieClip;
		var expandCounter : Number = 0;
		var expandBool : Boolean = false;
		var singlePass : Boolean = false;
		var scaleSpeed : Number = 0.1
		public function ExpandBoxConnector() {
			// constructor code
			mRef = MovieClip(this.parent);
			this.addEventListener(Event.ENTER_FRAME, Loop)
		}
		public function Loop(e: Event)
		{
			if(objState == "init")
			{
				objState = "idle";
			}
			if(objState == "idle")
			{
				
			}
			if(objState == "expand")
			{
				if(singlePass == false)
				{
					this.alpha = 0.3;
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
					this.scaleX += 0.02;
					
				}

				if (expandBool == true)
				{
					this.scaleY += 0.02;
					
				}
			}
			if(objState == "reset")
			{
				objState = "idle"
			}
				
			if(mRef.fire2.objState == "onFire")
			{
				
				objState = "expand";
			}
		}
	}
	
}
