package elements {
	import elements.BaseClip;

	public class Wall extends BaseClip {
		private var animation;
		private var range = 300;

		public function Wall(newX:Number, newY:Number) {
			animation = addChild(new Wall_basic());
			x = newX;
			y = newY;
			animation.play();
		}

		public function handler_ON_MOVE(event:CustomEvent) {
			if(event.x < x && event.x >= x - range){
				var event_out = new CustomEvent(CustomEvent.ON_SHOOT);
				event_out.x = event.x;
				event_out.y = event.y;
				dispatchEvent(event_out);
			}else if(event.x == x){
				event.target.beginDeath();
			}
		}
	}
}
