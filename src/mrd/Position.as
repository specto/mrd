package mrd {
    import flash.display.MovieClip;
    import flash.utils.*;
    import flash.events.Event;

    public class Position extends MovieClip {
    	public var wallHere = false;
    	public var boomBots = [];

 		public function Position(x:Number, y:Number) {
 			this.x = x;
 			this.y = y;
 			this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
 		}

 		private function onEnterFrame(e) {
            if (wallHere && boomBots[0]) {
                boomBots[0].explode();
            }
 		}

    }
}
