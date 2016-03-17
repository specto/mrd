package elements {
	import flash.display.MovieClip;
	import flash.events.Event;
    import custom_events.*;

	public class Wall extends MovieClip {
		private var range = 50;
		private var face;

		public function Wall(x:Number, y:Number) {
            face = this.addChild(new Wall_basic());
            
            this.x = x;
            this.y = y;
            this.addEventListener("onMove", shoot);
		}

		private function shoot(event){
			trace("should be shooting");
			if(event.x < this.x - 50){
				dispatchEvent(new onShoot(event.x, event.y));
			}else if(event.x == this.x){
				event.target.beginDeath();
			}
		}
	}

}
