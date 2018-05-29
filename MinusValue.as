package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class MinusValue extends MovieClip {
		
		var isActiveBool : Boolean = false;
		var startingX : Number;
		var startingY : Number;
		
		public function MinusValue() {
			// constructor code
			this.addEventListener(Event.ENTER_FRAME, Loop);
			startingX = this.x;
			startingY = this.y;
			this.alpha = 0;
		}
		
		public function Loop (e : Event)
		{
			if(isActiveBool == true)
			{
				this.y -= 0.3
				this.alpha -= 0.005;
				if(this.alpha <= 0)
				{
					isActiveBool == false;
					this.alpha = 0;
				}
				
			}
		}
		
		public function SetActive()
		{
			isActiveBool = true;
			this.x = startingX;
			this.y = startingY;
			this.alpha = 1;
			
		}
	}
	
}
