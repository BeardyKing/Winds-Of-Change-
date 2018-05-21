package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class PlayButton extends MovieClip {
		
		var mouseIsOver : Boolean = false;
		var mRef : MovieClip
		var singlePass : Boolean = false;
		var yHolder : Number = 0;
		public function PlayButton() {
			mRef = MovieClip(this.parent)
			this.addEventListener(Event.ENTER_FRAME, Loop);
			this.addEventListener(MouseEvent.MOUSE_DOWN, MouseDown);
			this.addEventListener(MouseEvent.MOUSE_UP, MouseUp);
			
			this.addEventListener(MouseEvent.MOUSE_OVER, MouseOver)
			this.addEventListener(MouseEvent.MOUSE_OUT, MouseOut)
			
			// constructor code
		}
		public function MouseOver (e: MouseEvent)
		{
			////trace("OVER")
			mouseIsOver = true;
		}
		
		public function MouseOut (e: MouseEvent)
		{ 
			mouseIsOver = false;
			////trace("OUT")
		}
		public function Loop (e: Event)
		{
			if(singlePass == false)
			{
				mRef.intro1.x = 0;
				mRef.intro1.y = 0
				this.x = 92.45;
				this.y = 223.9;
				mRef.playBar1.y = this.y;
				mRef.playBar1.x = this.x;
				yHolder = this.y;
				singlePass = true;
			}
			if(mouseIsOver == false)
			{
				this.y = yHolder;
			}
			if(mouseIsOver == true)
			{
				this.y = yHolder + 2;
			}
		}
		
		public function MouseDown(md : MouseEvent)
		{
				
		}
		
		public function MouseUp(mu : MouseEvent)
		{
			//trace("Start Game")
			mRef.objState = "play"
				mRef.intro1.x = - 1000;
				mRef.intro1.y = - 1000
				this.x = - 1000;
				this.y = - 1000;
				mRef.playBar1.y = this.y;
				mRef.playBar1.x = this.x;
		}
	}
	
}
