package elements{
    import flash.events.Event;
	
	public class Custom_event extends Event{
		public var x;
		public var y;

		public function Custom_event(type, bubbles = false, cancelable = false){
			super(type, bubbles, cancelable);
		}
	}
}