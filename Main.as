package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Main extends MovieClip {
		
		
		var objState : String = "start"
		var globalDir : Number = -2.5;
		var globalMoveSpeed : Number = 0.12;
		var globalMoveSpeedTest : Number = 0.2;
		var i :Number = 0;
		var testCounter : Number = 0

		public function Main()
		{
			// constructor code
			this.addEventListener(Event.ENTER_FRAME, Loop);
			

			
		}
		
		public function Loop(e: Event)
		{
			////trace(globalDir + "globalDir")
		//	//trace(globalMoveSpeedTest + "globalMoveSpeedTest ")
		//	//trace(stage.frameRate);
			////trace(globalDir)
			////trace(testCounter)
			i++;
			if(i == 120)
			{
				i = 0;
					//trace(globalDir);
				
			}
			//globalDir += 0.005;
			
			////trace(clickLoc.hasBeenClickedOnce);
		
			// set global movement
			
		}
	}
	
}
