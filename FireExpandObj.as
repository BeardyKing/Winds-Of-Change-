package
{

	import flash.display.MovieClip;
	import flash.events.Event;


	public class FireExpandObj extends MovieClip
	{
		var mRef: MovieClip;
		var expandCounter: Number = 0;
		var expandBool: Boolean = false;
		var isActiveBool: Boolean = false;
		var scaleSpeed: Number = 0.01;
		var objState: String = "init"

		public function FireExpandObj()
		{
			// constructor code
			this.addEventListener(Event.ENTER_FRAME, Loop);

			mRef = MovieClip(this.root);
		}
		public function Loop(e: Event)
		{
			////trace(objState + "objState " + this.name)
			if (objState == "init")
			{
				objState = "waiting";
			}
			if (objState == "waiting")
			{
				if (this.name == "expandBox1")
				{


					this.alpha = 0


					this.x = mRef.fire1_Start1.x
					this.y = mRef.fire1_Start1.y

					//if (mRef.fire1_Start1.objState == "onFire")
					if (isActiveBool == true)
					{
						expandCounter += 1;
						if (expandCounter > stage.frameRate * 2)
						{
							expandCounter = 0;
							expandBool = !expandBool;
						}

						if (expandBool == false)
						{
							this.scaleX += scaleSpeed;

						}

						if (expandBool == true)
						{
							this.scaleY += scaleSpeed;

						}
						if (this.scaleX >= 10 || this.scaleY >= 10)
						{
							this.scaleX = 10;
							this.scaleY = 10;
						}

						if (this.hitTestObject(mRef.expandBox2) == true)
						{
							mRef.expandBox2.isActiveBool = true
						}




					}
				}
				/////////////////////////////

				if (this.name == "expandBox2")
				{

					this.alpha = 0


					this.x = mRef.fire1_Start2.x
					this.y = mRef.fire1_Start2.y

					//if (mRef.fire1_Start2.objState == "onFire")
					if (isActiveBool == true)
					{
						//trace("aaaaaaaaaaaaaaaa")
						expandCounter += 1;
						if (expandCounter > stage.frameRate * 2)
						{
							expandCounter = 0;
							expandBool = !expandBool;
						}

						if (expandBool == false)
						{
							this.scaleX += scaleSpeed;

						}

						if (expandBool == true)
						{
							this.scaleY += scaleSpeed;

						}
						if (this.scaleX >= 10 || this.scaleY >= 10)
						{
							this.scaleX = 10;
							this.scaleY = 10;
						}

						if (this.hitTestObject(mRef.expandBox1) == true)
						{
							mRef.expandBox1.isActiveBool = true
						}

						if (this.hitTestObject(mRef.expandBox3) == true)
						{
							mRef.expandBox3.isActiveBool = true
						}

					}
				}



				if (this.name == "expandBox3")
				{

					this.alpha = 0


					this.x = mRef.fire1_Start3.x
					this.y = mRef.fire1_Start3.y

					//if (mRef.fire1_Start2.objState == "onFire")
					if (isActiveBool == true)
					{
						//trace("aaaaaaaaaaaaaaaa")
						expandCounter += 1;
						if (expandCounter > stage.frameRate * 2)
						{
							expandCounter = 0;
							expandBool = !expandBool;
						}

						if (expandBool == false)
						{
							this.scaleX += scaleSpeed;

						}

						if (expandBool == true)
						{
							this.scaleY += scaleSpeed;

						}
						if (this.scaleX >= 10 || this.scaleY >= 10)
						{
							this.scaleX = 10;
							this.scaleY = 10;
						}
						if (this.hitTestObject(mRef.expandBox2) == true)
						{
							mRef.expandBox2.isActiveBool = true
						}

						if (this.hitTestObject(mRef.expandBox4) == true)
						{
							mRef.expandBox4.isActiveBool = true
						}

					}
				}

				if (this.name == "expandBox4")
				{

					this.alpha = 0


					this.x = mRef.fire1_Start4.x
					this.y = mRef.fire1_Start4.y

					//if (mRef.fire1_Start2.objState == "onFire")
					if (isActiveBool == true)
					{
						//trace("aaaaaaaaaaaaaaaa")
						expandCounter += 1;
						if (expandCounter > stage.frameRate * 2)
						{
							expandCounter = 0;
							expandBool = !expandBool;
						}

						if (expandBool == false)
						{
							this.scaleX += scaleSpeed;

						}

						if (expandBool == true)
						{
							this.scaleY += scaleSpeed;

						}
						if (this.scaleX >= 10 || this.scaleY >= 10)
						{
							this.scaleX = 10;
							this.scaleY = 10;
						}
						if (this.hitTestObject(mRef.expandBox3) == true)
						{
							mRef.expandBox3.isActiveBool = true
						}

						if (this.hitTestObject(mRef.expandBox5) == true)
						{
							mRef.expandBox5.isActiveBool = true
						}

					}

				}

				if (this.name == "expandBox5")
				{

					this.alpha = 0


					this.x = mRef.fire1_Start5.x
					this.y = mRef.fire1_Start5.y

					//if (mRef.fire1_Start2.objState == "onFire")
					if (isActiveBool == true)
					{
						//trace("aaaaaaaaaaaaaaaa")
						expandCounter += 1;
						if (expandCounter > stage.frameRate * 2)
						{
							expandCounter = 0;
							expandBool = !expandBool;
						}

						if (expandBool == false)
						{
							this.scaleX += scaleSpeed;

						}

						if (expandBool == true)
						{
							this.scaleY += scaleSpeed;

						}
						if (this.scaleX >= 10 || this.scaleY >= 10)
						{
							this.scaleX = 10;
							this.scaleY = 10;
						}

						if (this.hitTestObject(mRef.expandBox4) == true)
						{
							mRef.expandBox4.isActiveBool = true
						}

						if (this.hitTestObject(mRef.expandBox6) == true)
						{
							mRef.expandBox6.isActiveBool = true
						}
					}
				}

				if (this.name == "expandBox6")
				{

					this.alpha = 0


					this.x = mRef.fire1_Start6.x
					this.y = mRef.fire1_Start6.y

					//if (mRef.fire1_Start2.objState == "onFire")
					if (isActiveBool == true)
					{
						//trace("aaaaaaaaaaaaaaaa")
						expandCounter += 1;
						if (expandCounter > stage.frameRate * 2)
						{
							expandCounter = 0;
							expandBool = !expandBool;
						}

						if (expandBool == false)
						{
							this.scaleX += scaleSpeed;

						}

						if (expandBool == true)
						{
							this.scaleY += scaleSpeed;

						}
						if (this.scaleX >= 10 || this.scaleY >= 10)
						{
							this.scaleX = 10;
							this.scaleY = 10;
						}
						if (this.hitTestObject(mRef.expandBox5) == true)
						{
							mRef.expandBox5.isActiveBool = true
						}

						if (this.hitTestObject(mRef.expandBox7) == true)
						{
							mRef.expandBox7.isActiveBool = true
						}
					}
				}

				if (this.name == "expandBox7")
				{

					this.alpha = 0


					this.x = mRef.fire1_Start7.x
					this.y = mRef.fire1_Start7.y

					//if (mRef.fire1_Start2.objState == "onFire")
					if (isActiveBool == true)
					{
						//trace("aaaaaaaaaaaaaaaa")
						expandCounter += 1;
						if (expandCounter > stage.frameRate * 2)
						{
							expandCounter = 0;
							expandBool = !expandBool;
						}

						if (expandBool == false)
						{
							this.scaleX += scaleSpeed;

						}

						if (expandBool == true)
						{
							this.scaleY += scaleSpeed;

						}
						if (this.scaleX >= 10 || this.scaleY >= 10)
						{
							this.scaleX = 10;
							this.scaleY = 10;
						}
						if (this.hitTestObject(mRef.expandBox6) == true)
						{
							mRef.expandBox6.isActiveBool = true
						}

						if (this.hitTestObject(mRef.expandBox8) == true)
						{
							mRef.expandBox8.isActiveBool = true
						}

					}
				}

				if (this.name == "expandBox8")
				{

					this.alpha = 0


					this.x = mRef.fire1_Start8.x
					this.y = mRef.fire1_Start8.y

					//if (mRef.fire1_Start2.objState == "onFire")
					if (isActiveBool == true)
					{
						//trace("aaaaaaaaaaaaaaaa")
						expandCounter += 1;
						if (expandCounter > stage.frameRate * 2)
						{
							expandCounter = 0;
							expandBool = !expandBool;
						}

						if (expandBool == false)
						{
							this.scaleX += scaleSpeed;

						}

						if (expandBool == true)
						{
							this.scaleY += scaleSpeed;

						}
						if (this.scaleX >= 10 || this.scaleY >= 10)
						{
							this.scaleX = 10;
							this.scaleY = 10;
						}
						if (this.hitTestObject(mRef.expandBox7) == true)
						{
							mRef.expandBox7.isActiveBool = true
						}
					}
				}
				if(this.scaleX  >= 10|| this.scaleY >= 10)
				{
					objState = "dead";
				}
				this.alpha = 0;
			}

			if(objState == "dead")
			{
				this.scaleX = 1;
				this.scaleY = 1;
				expandCounter = 0;
				isActiveBool = false;
				objState = "init"
				//this.x = 1000;
				
				
				
				// add counter to fire to check if all are dead;
				
			}
			if(objState == "reset")
			{
				
			}
			
			this.alpha = 0.3;

			// loop
		}
		// loop
	}

}