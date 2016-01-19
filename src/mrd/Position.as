package mrd {
    import flash.display.MovieClip;
    import flash.utils.*;
    import flash.events.Event;

    public class Position extends MovieClip {
    	public var wallHere = null;
    	public var boomBots = [];
        public var previousPosition;
        public var nextPosition;

 		public function Position(x:Number, y:Number) {
 			this.x = x;
 			this.y = y;
 			this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
 		}

 		private function onEnterFrame(e) {
            if (wallHere) {
                for (var i = 0; i < boomBots.length; i++){
                    boomBots[i].explode();
                    //removeChild(boomBots[i]);
                    //trace(boomBots[0]);
                }
                boomBots.splice(0);
            }

            for (i = 0; i < boomBots.length; i++){
                if (!this.hitTestObject(boomBots[i])){
                    nextPosition.boomBots.push(boomBots[i]);
                    boomBots.slice(i, 1);
                }
            }
        }
    }
}
