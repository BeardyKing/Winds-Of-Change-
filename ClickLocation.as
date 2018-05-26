package
{

	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.Event;


	public class ClickLocation extends MovieClip
	{
		var mRef: MovieClip;
		var mouseDown: Boolean = false;
		var angleDeg: Number = 0;
		var hypotDist: Number = 0;

		var mouseDownTimer: Number = 0;
		var maxTimer: Number = 2;

		var windCounter: Number = 0;
		var maxWind: Number = 15;
		var singlePass: Boolean = false
		var hasBeenClickedOnce = false;
		var hypoTrue: Boolean = false;

		var angleDegSend: Number;
		var AAAAAAADeg: Number;

		var sendDataFirstTime: Boolean = false;
		var dirDiv: Number = 20

		var n1: Number;
		var n2: Number;
		var short: Number;
		var long: Number;
		var turn: String = "";

		var trajectory: Number
		var shipAngle: Number


		public function ClickLocation()
		{
			mRef = MovieClip(this.parent);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, MouseDown)
			stage.addEventListener(MouseEvent.MOUSE_UP, MouseUp)
			this.addEventListener(Event.ENTER_FRAME, Loop)
			//trace("inside : " + this.name)
		}

		public function Loop(e: Event)
		{
			////trace(mRef.mouseDir.rotation)

			if (mouseDown == false)
			{
				this.alpha -= 4 / stage.frameRate;
				mRef.mouseDir.alpha -= 2 / stage.frameRate
				if (mRef.mouseDir.alpha < 0)
				{
					mRef.mouseDir.alpha = 0;
					mRef.mouseDir.x = 900;
				}
				if (this.alpha < 0)
				{
					this.alpha = 0;

					////trace("ow")
				}
			}
			if (mouseDown == true)
			{
				this.alpha += 10 / stage.frameRate;

				if (this.alpha > 1)
				{

					this.alpha = 1;
				}
				// arrow len
				FindHypot(this.x, this.y, mRef.mouseX, mRef.mouseY);
				if (hypotDist < 150)
				{

					mRef.mouseDir.scaleX = hypotDist / 75;
					mRef.mouseDir.scaleY = hypotDist / 400;
				}
				// add arrow to stage
				if (hypotDist >= 15)
				{
					hypoTrue = true;
					mRef.mouseDir.alpha += 3 / stage.frameRate
					if (mRef.mouseDir.alpha > 1)
					{
						mRef.mouseDir.alpha = 1;
					}
					mRef.mouseDir.x = this.x
					mRef.mouseDir.y = this.y;
					FindDir(mRef.mouseDir.x, mRef.mouseDir.y, mRef.mouseX, mRef.mouseY);
				}
				// remove arrow from stage
				if (hypotDist <= 15)
				{
					hypoTrue = false;
					mRef.mouseDir.alpha -= 9 / stage.frameRate
					if (mRef.mouseDir.alpha < 0)
					{
						mRef.mouseDir.x = 900;
					}
					FindDir(mRef.mouseDir.x, mRef.mouseDir.y, mRef.mouseX, mRef.mouseY);
				}
				// add cloud (timer)
				if (windCounter < maxWind)
				{
					mouseDownTimer += 1;
					if (mouseDownTimer >= maxTimer)
					{
						mouseDownTimer = 0
						windCounter += 1;
						////trace("add cloud" + windCounterwindCounter.toString());

					}
				}

			}
			// loop
		}
		// loop

		public function FindHypot(x1, y1, x2, y2)
		{
			var deltaX: Number = (x1 - x2)
			var deltaY: Number = (y1 - y2)
			var c2: Number = Math.sqrt((deltaX) * (deltaX) + (deltaY) * (deltaY))

			hypotDist = c2;
		}

		public function FindDir(x1, y1, x2, y2)
		{

			angleDeg = Math.atan2(y2 - y1, x2 - x1) * 180 / Math.PI;
			AAAAAAADeg = angleDeg
			mRef.mouseDir.rotation = angleDeg;

			////trace("aaaaadeg: "+AAAAAAADeg)
		}

		public function MouseDown(e: MouseEvent)
		{
			this.x = mRef.mouseX;
			this.y = mRef.mouseY;
			mouseDown = true;
			hypoTrue = false;
		}

		public function MouseUp(e: MouseEvent)
		{

			//angleDegSend = mRef.mouseDir.rotation;
			singlePass = false;
			mouseDownTimer = 0
			windCounter = 0;

			mouseDown = false;
			var checker: Number;
			checker = AAAAAAADeg * (Math.PI / 180)
			////trace(checker + " a aaaaaaa")
			////trace((Math.PI / 2))
			// top right arrow pointing same dir
			// MOUSE IN TOP RIGHT
			////trace(mRef.WindDirArrow.rotation + "  WIND CONST ROT")
			//	//trace(mRef.mouseDir.rotation + " MOUSE DIR ROT")
			////trace(mRef.mouseDir.rotation + " mRef.mouseDir.rotation")
			////trace(mRef.WindDirArrow.rotation + " mRef.WindDirArrow.rotation")
			var moveRot : Number = mRef.mouseDir.rotation;
			var globalRot : Number = mRef.WindDirArrow.rotation;
			var moveRotState : String = ""
			
			//trace(mRef.mouseDir.rotation + "   mRef.WindDirArrow.rotation")

			/*if (mRef.WindDirArrow.rotation < mRef.mouseDir.rotation)
			{
				//trace("boop")
				mRef.globalDir += 0.1
				//trace(mRef.mouseDir.rotation + " mRef.mouseDir.rotation")
				//trace(mRef.WindDirArrow.rotation + " mRef.WindDirArrow.rotation")
			}
			else if (mRef.WindDirArrow.rotation > mRef.mouseDir.rotation)
			{
				//trace("boop")
				mRef.globalDir -= 0.1
				//trace(mRef.mouseDir.rotation + " mRef.mouseDir.rotation")
				//trace(mRef.WindDirArrow.rotation + " mRef.WindDirArrow.rotation")

			}*/
			
			if(moveRot > globalRot)
			{
				moveRotState = "antiClockwise"
			}
			else if(moveRot < globalRot)
			{
				moveRotState = "clockwise"
			}
			
			if((moveRot < -90 && moveRot > -180))
			{
				if(globalRot > 90 && globalRot < 180)
				{
					
					//trace(moveRotState)
					moveRotState = "antiClockwise"
				}
			}
			else if((moveRot > 90 && moveRot < 180))
			{
				if(globalRot < -90 && globalRot > -180)
				{
				
					//trace(moveRotState)
					moveRotState = "clockwise"
				}
			}
			//
			
			if(moveRotState == "clockwise")
			{
				mRef.globalDir -= 0.1;
			}
			else if(moveRotState == "antiClockwise")
			{
				mRef.globalDir += 0.1;
			}
			
			
			
			



			
			/*if (trajectory > shipAngle)
			{
				n1 = trajectory - shipAngle;
				n2 = 180 - n1;
				//trace("tra > ship")
			}
			else if (shipAngle > trajectory)
			{
				n1 = shipAngle - trajectory;
				n2 = 180 - n1;
				//trace("tra < ship")
			}

			if (n1 < n2)
			{
				short = n1;
				long = n2;
				//trace("n1 < n2")
			}
			else if (n2 < n1)
			{
				short = n2;
				long = n2;
				//trace("n2 < n1 ")
			}


			if ((shipAngle - short) < 0)
			{
				//trace(shipAngle - short + "  ship angle - short")
				//trace(trajectory - 180 + " trajectory - 180")
				if ((shipAngle - short) == (trajectory - 180))
				{
					turn = "right";
				}
			}
			else if ((shipAngle + short) > 180)
			{
				//trace(shipAngle + short + "  ship angle + short")
				//trace(trajectory + 180 + " trajectory + 180")
				if ((shipAngle + short) == (trajectory + 180))
				{
					turn = "left"
				}
			}
			else
			{
				if ((shipAngle - short) == trajectory)
				{
					turn = "right"
				}
				else if ((shipAngle + short) == trajectory)
				{
					turn = "left"
				}
			}*/
			////trace(shipAngle + " ship angle")
			////trace(trajectory + "trajectory")
			////trace(long + " long");
			////trace(short + " short")
			//trace(turn + " turn")
			///////////////////////////////////////////// FINS CODE
		}


	}
}