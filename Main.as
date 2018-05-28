package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class Main extends MovieClip
	{


		var objState: String = "start"
		var globalDir: Number = -2.5;
		var globalMoveSpeed: Number = 0.12;
		var globalMoveSpeedTest: Number = 0.2;
		var i: Number = 0;
		var testCounter: Number = 0
		
		var flashingBool : Boolean = false;
		var flashingCounter : Number = 0;

		public function Main()
		{
			// constructor code
			this.addEventListener(Event.ENTER_FRAME, Loop);

			infoTB1.text = "";

		}


		public function FlashingObj()
		{
			if(infoTB1.text != "")
			{
				flashingCounter += 1;
				if(flashingCounter >= stage.frameRate/8)
				{
					flashingCounter = 0;
					flashingBool = !flashingBool
				}
				if(flashingBool == false)
				{
					infoTB1.alpha = 1;
				}
				if(flashingBool == true)
				{
					infoTB1.alpha = 0.2;
				}
			}
			if(infoTB1.text == "" && infoTB1.alpha < 1)
			{
				infoTB1.alpha = 1;
				flashingBool = false;
				flashingCounter = 0;
				trace("singlePass from " + this.name)
			}
		}
		
		public function Loop(e: Event)
		{
			
			FlashingObj();
			
			
			
			if (objState == "lose")
			{
				intro1.x = 0;
				intro1.y = 0;
				//this.parent.intro1.y = 0;
			}
			if (objState == "win")
			{
				intro1.x = 0;
				intro1.y = 0;
			}

			////trace(globalDir + "globalDir")
			//	//trace(globalMoveSpeedTest + "globalMoveSpeedTest ")
			//	//trace(stage.frameRate);
			////trace(globalDir)
			////trace(testCounter)
			i++;
			if (i == 120)
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