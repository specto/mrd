package elements {
	import flash.display.MovieClip;

	//import elements;

	public class Wall extends MovieClip {
		private var animation;
		private var range = 50;

		public function Wall(newX:Number, newY:Number) {
			animation = addChild(new Wall_basic());
			x = newX;
			y = newY;
			animation.play();
			trace(Custom_event.ON_MOVE);
		}

		public function onMove(ev:Custom_event) {
			trace(ev.target + ' has moved');
		}

		private function shoot(event){
			trace("should be shooting");

			if(event.x < this.x - 50){
				var event_out = new Custom_event("onShoot");
				event_out.x = event.x;
				event_out.y = event.y;
				dispatchEvent(event_out);
			}
			//}else if(event.x == this.x){
			//	event.target.beginDeath();
			//}
		}
	}
}
