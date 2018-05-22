package
{

	import flash.display.MovieClip;
	import flash.events.Event;


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

		public function BCity()
		{
			mRef = MovieClip(this.parent);

			this.addEventListener(Event.ENTER_FRAME, Loop)

		}

		public function Loop(e: Event)
		{

			trace(woodTotal + " wood Total")
			trace(fishTotal + " fishTotal")
			trace(riceTotal + " rice Total")

			woodTotal += 0.2
			fishTotal += 0.2
			riceTotal += 0.2
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
				mRef.riceText1.text = riceTotal.toString();
				mRef.fishText1.text = fishTotal.toString();
				mRef.woodText1.text = woodTotal.toString();
				////trace(fishTotal + this.name);
				////trace("aaaaa")
			}
			// loop
		}
		//loop

		public function FighterCart()
		{
			if (riceTotal >= 50 && fishTotal >= 50 && woodTotal >= 50 )
			{

				// spawn FighterCart
				if (mRef.fighterCart1.isActiveBool == false)
				{
					mRef.fighterCart1.isActiveBool = true;
					mRef.fighterCart1.x = this.x
					mRef.fighterCart1.y = this.y

					riceTotal -= 50
					fishTotal -= 50
					woodTotal -= 50
				}
				else if (mRef.fighterCart2.isActiveBool == false)
				{
					mRef.fighterCart2.isActiveBool = true;
					mRef.fighterCart2.x = this.x
					mRef.fighterCart2.y = this.y
					riceTotal -= 50
					fishTotal -= 50
					woodTotal -= 50
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