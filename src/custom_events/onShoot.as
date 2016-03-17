package custom_events{
    import flash.events.Event;
	
	public class onShoot extends Event{
		public var x;
		public var y;

		public function onShoot(shooting_x, shooting_y, type = "onShoot", bubbles = false, cancelable = false){
			super(type, bubbles, cancelable);
			x = shooting_x;
			y = shooting_y;
		}
	}
}