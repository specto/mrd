package elements {
	import flash.display.MovieClip;
	import flash.events.Event;
    //import elements;

	public class Wall extends MovieClip {
		private var animation;
		private var range = 50;

		public function Wall(x:Number, y:Number) {
            animation = this.addChild(new Wall_basic());
			this.x = x;
            this.y = y;
            animation.x = x;
            animation.y = y;
            animation.play();

            this.addEventListener("onMove", shoot);
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