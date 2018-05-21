package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class HealthBar extends MovieClip {
		
		var mRef = MovieClip;
		var healthBarTimer : Number = 60;
		var healthBarCounter : Number = 0;
		var getHealthBackBool : Boolean = false;
		public function HealthBar() {
			// constructor code
			mRef = MovieClip(this.parent)
			this.addEventListener(Event.ENTER_FRAME, Loop);
		}
		
		public function Loop (e : Event)
		{
			
			if( mRef.bCity.objHealth < 30 && mRef.bCity.isOnFire == false)
			{
				trace("GETTING HP BACK" + this.name)
				healthBarTimer -= 1;
				if(healthBarTimer == 0 )
				{
					getHealthBackBool = true;
				}
				
				if(getHealthBackBool == true)
				{
					healthBarCounter += 1;
					if(healthBarCounter >= stage.frameRate )
					{
						mRef.bCity.objHealth +=  1;
						healthBarCounter = 0;
					}
				}
			}
			this.scaleX = mRef.bCity.objHealth/ 100;
			if(this.scaleX <= 0)
			{
				scaleX = 0;
			}
		}
	}
	
}
