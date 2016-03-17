package custom_events{
    import flash.events.Event;
	
	public class onMove extends Event{
		public var x;
		public var y;

		public function onMove(enemy_x, enemy_y, type = "onMove", bubbles = false, cancelable = false){
			super(type, bubbles, cancelable);
			x = enemy_x;
			y = enemy_y;
		}
	}
}