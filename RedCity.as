package
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;


	public class RedCity extends MovieClip
	{
		var mRef: MovieClip;

		var objState: String = "boot"

		var woodTotal: Number = 0;
		var fishTotal: Number = 0;
		var riceTotal: Number = 0;


		var objHealth: Number = 100;
		var isBeingCaptued: Boolean = false;
		var captureCounter: Number = 0;
		var timer: Number = 0;

		var wDown: Boolean = false;

		public function RedCity()
		{
			//this.alpha = 0;
			mRef = MovieClip(this.parent);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown)

			this.addEventListener(Event.ENTER_FRAME, Loop)

		}
		public function ResetFunction()
		{
			objState = "boot"

			woodTotal = 0;
			fishTotal = 0;
			riceTotal = 0;


			objHealth = 100;
			isBeingCaptued = false;
			captureCounter = 0;
			timer = 0;
			mRef.infoTB1.text = ""
		}

		public function KeyDown(kDown: KeyboardEvent)
		{
			trace("AAAAA")
			if (kDown.keyCode == Keyboard.W)
			{

				wDown = !wDown;

			}
		}


		public function Loop(e: Event)
		{
			//trace(wDown)
			// TESTING
			/*if (wDown == true)
			{
				woodTotal += 0.2
				fishTotal += 0.2
				riceTotal += 0.2
			}*/


			if (woodTotal >= 50 && fishTotal >= 50 && riceTotal >= 50)
			{
				if (mRef.redFighterCart1.isActiveBool == false)
				{
					mRef.redFighterCart1.isActiveBool = true;
					mRef.redFighterCart1.x = this.x
					mRef.redFighterCart1.y = this.y

					riceTotal -= 50
					fishTotal -= 50
					woodTotal -= 50
				}
				else if (mRef.redFighterCart2.isActiveBool == false)
				{
					mRef.redFighterCart2.isActiveBool = true;
					mRef.redFighterCart2.x = this.x
					mRef.redFighterCart2.y = this.y

					riceTotal -= 50
					fishTotal -= 50
					woodTotal -= 50
				}
				mRef.infoTB1.text = "KOREA IS MOUNTING AN INVASION";
				//  add attack cart
			}
			if (mRef.infoTB1.text == "KOREA IS MOUNTING AN INVASION")
			{
				timer += 1;
			}
			if (mRef.infoTB1.text == "KOREA IS MOUNTING AN INVASION" && timer >= 300)
			{
				mRef.infoTB1.text = ""
			}
			if (mRef.infoTB1.text != "KOREA IS MOUNTING AN INVASION")
			{
				timer = 0;
			}

			if (mRef.objState == "play")
			{


				mRef.RedriceText1.text = riceTotal.toString() + "Red Team Rice";
				mRef.RedfishText1.text = fishTotal.toString() + "Red Team fish";
				mRef.RedwoodText1.text = woodTotal.toString() + "Red Team wood";

				if (objHealth <= 0)
				{
					mRef.objState = "win";
				}

			}
			//Loop
		}
		//loop
	}

}