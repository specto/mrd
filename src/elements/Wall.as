package elements {
	import elements.BaseClip;

	public class Wall extends BaseClip {
		private var animation;
		private var range = 500;
		private var inRange = [];
		private var interval;
		private var attackSpeed = 100;

		public function Wall(newX:Number, newY:Number) {
			x = newX;
			y = newY;

			animation = addChild(new Wall_basic());
			animation.play();

			shooter();
		}

		public function handler_ON_MOVE(event:CustomEvent) {
			if(inRange.indexOf(event.target) == -1){
				if(event.target.x < x && event.target.x >= x - range){
					inRange.push(event.target);
					shooter();
				}
			}
		}

		public function handler_ON_DIE(event){
			if(inRange.indexOf(event.target)){
				inRange.pop(event.target);
			}
		}

		private function shooter(){
			//go over the list and maybe sort it?
			if(event.x < x && event.x >= x - range){
				var event_out = new CustomEvent(CustomEvent.ON_SHOOT);
				event_out.x = event.x;
				event_out.y = event.y;
				dispatchEvent(event_out);

				var arrow = new Arrow(x, y, event.x, event.y);
				parent.addChild(arrow);
				
			}else if(event.x == x){
				event.target.beginDeath();
			}
			interval = setTimeout(shooter, attackSpeed);
		}
	}
}
