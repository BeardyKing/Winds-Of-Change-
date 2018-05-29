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

		var flashingBool: Boolean = false;
		var flashingCounter: Number = 0;

		public function Main()
		{
			swordIcon1.alpha = 0;
			swordIcon2.alpha = 0;
			// constructor code
			this.addEventListener(Event.ENTER_FRAME, Loop);

			infoTB1.text = "";

		}


		public function FlashingObj()
		{
			if (infoTB1.text != "")
			{
				flashingCounter += 1;
				if (flashingCounter >= stage.frameRate / 8)
				{
					flashingCounter = 0;
					flashingBool = !flashingBool
				}
				if (flashingBool == false)
				{
					infoTB1.alpha = 1;
					if (infoTB1.text == "OPENING THE GATES IN :" + bCity.infoCountDownSeconds)
					{
						swordIcon1.alpha = 1;
						rFifty.alpha = 1;
						wFifty.alpha = 1;
						fFifty.alpha = 1;
					}
					if (infoTB1.text == "KOREA IS MOUNTING AN INVASION")
					{
						swordIcon2.alpha = 1;
					}
				}
				if (flashingBool == true)
				{
					if (infoTB1.text == "OPENING THE GATES IN :" + bCity.infoCountDownSeconds)
					{
						swordIcon1.alpha = 0.4;
						rFifty.alpha = 0.4;
						wFifty.alpha = 0.4;
						fFifty.alpha = 0.4;
						trace("this works alpha 0.4")
					}
					if (infoTB1.text == "KOREA IS MOUNTING AN INVASION")
					{
						swordIcon2.alpha = 0.4;
					}
					infoTB1.alpha = 0.4;
				}
			}
			if (infoTB1.text == "" && infoTB1.alpha < 1)
			{
				infoTB1.alpha = 1;
				flashingBool = false;
				flashingCounter = 0;
				trace("singlePass from " + this.name)
				swordIcon1.alpha = 0;
				swordIcon2.alpha = 0;
				rFifty.alpha = 1;
				wFifty.alpha = 1;
				fFifty.alpha = 1;
			}
			if (infoTB1.text == "")
			{
				swordIcon1.alpha = 0;
				swordIcon2.alpha = 0;
				rFifty.alpha = 1;
				wFifty.alpha = 1;
				fFifty.alpha = 1;
			}

		}

		public function Loop(e: Event)
		{

			FlashingObj();



			if (objState == "lose")
			{
				lose1.x = 0;
				lose1.y = 0;
				playBtn1.singlePass = false;
				//this.parent.intro1.y = 0;
			}
			if (objState == "win")
			{
				win1.x = 0;
				win1.y = 0;
				playBtn1.singlePass = false;

			}
			if (objState == "play")
			{
				intro1.x = -1000;
				intro1.y = -1000

				playBar1.y = 1000
				playBar1.x = 1000

				playBtn1.x = 1000;
				playBtn1.y = 1000;
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