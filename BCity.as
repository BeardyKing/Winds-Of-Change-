package
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;


	public class BCity extends MovieClip
	{
		var mRef: MovieClip;

		var objState: String = "boot"

		var woodTotal: Number = 0;
		var fishTotal: Number = 0;
		var riceTotal: Number = 0;

		/*var woodTotal: Number = 70;
		var fishTotal: Number = 70;
		var riceTotal: Number = 70;*/

		var tradecartCounter: Number = 0

		var fishIsPoisoned: Boolean = false;
		var riceIsPoisoned: Boolean = false;
		var bitByWhirlwind: Boolean = false;
		var isOnFire: Boolean = false;


		var objHealth: Number = 100;
		var isBeingCaptued: Boolean = false;
		var captureCounter: Number = 0;

		var infoCountDown: Number = 0;
		var infoCountDownSeconds: Number = 5;
		var infoBool: Boolean = true;

		var eDown: Boolean = false;



		public function BCity()
		{
			this.alpha = 0;
			mRef = MovieClip(this.parent);

			this.addEventListener(Event.ENTER_FRAME, Loop)
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);

		}



		public function ResetFunction()
		{
			objState = "boot"

			woodTotal = 0;
			fishTotal = 0;
			riceTotal = 0;


			tradecartCounter = 0

			fishIsPoisoned = false;
			riceIsPoisoned = false;
			bitByWhirlwind = false;
			isOnFire = false;


			objHealth = 100;
			isBeingCaptued = false;
			captureCounter = 0;

			infoCountDown = 0;
			infoCountDownSeconds = 5;
			infoBool = true;

			eDown = false;
		}

		public function KeyDown(kDown: KeyboardEvent)
		{
			trace("AAAAA")
			if (kDown.keyCode == Keyboard.E)
			{

				eDown = !eDown;
			}

			if (kDown.keyCode == Keyboard.Z)
			{

				objHealth = 0;
			}
		}

		public function Loop(e: Event)
		{

			if (objHealth <= 0)
			{
				mRef.objState = "lose"
			}

			/*trace(woodTotal + " wood Total")
			trace(fishTotal + " fishTotal")
			trace(riceTotal + " rice Total")*/
			if (eDown == true)
			{
				woodTotal += 0.2
				fishTotal += 0.2
				riceTotal += 0.2
			}
			// FIGHTER CART CODE

			if (mRef.fire11.objState == "onFire" || mRef.fire8.objState == "onFire" || mRef.fire7.objState == "onFire")
			{
				objHealth -= 3 / stage.frameRate;
				isOnFire = true;

			}
			else
			{
				isOnFire = false;
			}
			if (mRef.objState == "play")
			{
				FighterCart();


				//riceTotal = Math.round((riceTotal * 10) / 10)
				////trace("rice total = " + riceTotal );
				mRef.riceText1.text = Math.floor(riceTotal).toString();
				mRef.fishText1.text = Math.floor(fishTotal).toString();
				mRef.woodText1.text = Math.floor(woodTotal).toString();
				////trace(fishTotal + this.name);
				////trace("aaaaa")
			}
			// loop
		}
		//loop

		public function FighterCart()
		{
			if (riceTotal >= 50 && fishTotal >= 50 && woodTotal >= 50)
			{
				if (mRef.fighterCart1.isActiveBool == false || mRef.fighterCart2.isActiveBool == false)
				{

					infoCountDown += 1;
					mRef.infoTB1.text = "OPENING THE GATES IN :" + infoCountDownSeconds;
					if (infoCountDown >= stage.frameRate)
					{
						infoCountDown = 0;
						infoCountDownSeconds -= 1;

						trace("AAAAAA")
						if (infoCountDownSeconds <= 0)
						{
							infoBool = false;
						}

					}
				}
				if (infoBool == false)
				{

					// spawn FighterCart
					if (mRef.fighterCart1.isActiveBool == false)
					{
						infoCountDownSeconds = 5;
						mRef.infoTB1.text = "";

						mRef.fighterCart1.isActiveBool = true;
						mRef.fighterCart1.x = this.x
						mRef.fighterCart1.y = this.y

						riceTotal -= 50
						fishTotal -= 50
						woodTotal -= 50

						mRef.minus1.SetActive();
						mRef.minus2.SetActive();
						mRef.minus3.SetActive();

						infoCountDown = 0;
						infoBool = true
					}
					else if (mRef.fighterCart2.isActiveBool == false)
					{
						infoCountDownSeconds = 5;
						mRef.infoTB1.text = "";
						mRef.fighterCart2.isActiveBool = true;
						mRef.fighterCart2.x = this.x
						mRef.fighterCart2.y = this.y

						riceTotal -= 50
						fishTotal -= 50
						woodTotal -= 50
						mRef.minus1.SetActive();
						mRef.minus2.SetActive();
						mRef.minus3.SetActive();


						infoCountDown = 0;
						infoBool = true
					}
				}
			}
		}

		public function AddTradeCart(objName: String)
		{
			if (objName == "farmTown1")
			{
				//trace("farmTown1 added trade cart")
				mRef.farmTown1.hasTradeCartActive = true;
				mRef.bTradeRice1.x = this.x - 15;
				mRef.bTradeRice1.y = this.y
				mRef.bTradeRice1.rotation = -90;
			}
			if (objName == "farmTown2")
			{
				//trace("farmTown2 added trade cart")
				mRef.farmTown2.hasTradeCartActive = true;
				mRef.bTradeRice2.x = this.x + 15;
				mRef.bTradeRice2.y = this.y
				mRef.bTradeRice1.rotation = 90;
			}
			if (objName == "bLoggingTown1")
			{
				//trace("LoggingTown1 added trade cart")
				mRef.bLoggingTown1.hasTradeCartActive = true;
				mRef.bTradeWood1.x = this.x - 15;
				mRef.bTradeWood1.y = this.y
				mRef.bTradeWood1.rotation = 90;
			}
			if (objName == "bLoggingTown2")
			{
				//trace("LoggingTown2 added trade cart")
				mRef.bLoggingTown2.hasTradeCartActive = true;
				mRef.bTradeWood2.x = this.x - 15;
				mRef.bTradeWood2.y = this.y
				mRef.bTradeWood2.rotation = 90;
			}
			if (objName == "bLoggingTown3")
			{
				//trace("LoggingTown3 added trade cart")
				mRef.bLoggingTown3.hasTradeCartActive = true;
				mRef.bTradeWood3.x = this.x + 15;
				mRef.bTradeWood3.y = this.y;
				mRef.bTradeWood3.rotation = 90;
			}

			if (objName == "bFishingTown1")
			{
				//trace(objName + " added trade cart")
				mRef.bFishingTown1.hasTradeCartActive = true;
				mRef.bTradeFish1.x = this.x - 10
				mRef.bTradeFish1.y = this.y;
				mRef.bTradeFish1.rotation = 90;
			}

			if (objName == "bFishingTown2")
			{
				//trace(objName + " added trade cart")
				mRef.bFishingTown2.hasTradeCartActive = true;
				mRef.bTradeFish2.x = this.x - 10
				mRef.bTradeFish2.y = this.y;
				mRef.bTradeFish2.rotation = 90;
			}

			if (objName == "bFishingTown3")
			{
				//trace(objName + " added trade cart")
				mRef.bFishingTown3.hasTradeCartActive = true;
				mRef.bTradeFish3.x = this.x - 10
				mRef.bTradeFish3.y = this.y;
				mRef.bTradeFish3.rotation = 90;
			}
		}

	}

}