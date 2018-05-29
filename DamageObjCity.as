package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class DamageObjCity extends MovieClip
	{

		var animBool: Boolean = false;
		var animCounter: Number = 0;

		var mRef: MovieClip;
		public function DamageObjCity()
		{
			// constructor code
			mRef = MovieClip(this.parent);
			this.addEventListener(Event.ENTER_FRAME, Loop);
						

		}

		public function Loop(e: Event)
		{
			this.x = mRef.bCity.x;
			this.y = mRef.bCity.y;

			if (mRef.fire8.objState == "onFire" ||
				mRef.fire11.objState == "onFire" ||
				mRef.fire12.objState == "onFire" ||
				mRef.rFighter1.dealingDamage == true ||
				mRef.rFighter2.dealingDamage == true)
			{
				DoAnim();
			}
			else
			{
				if(this.alpha > 0)
				{
					this.alpha = 0;
					animBool = false;
					animCounter = 0;
				}
			}



			//11 12 8
		}

		public function DoAnim()
		{
			animCounter += 1;
			if(animCounter >= 20)
			{
				animCounter = 0;
				animBool = !animBool;
			}
			
			if (animBool == true)
			{
				this.alpha = 0.4;
			}
			else
			{
				this.alpha = 0.9;
			}
		}

	}

}