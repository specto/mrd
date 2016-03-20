package elements {
    import flash.events.Event;

	public class Custom_event extends Event{
		public var x;
		public var y;
		public static const ON_MOVE:String = "custom_move";
		public static const ON_SHOOT:String = "custom_shoot";

		public function Custom_event(type:String, bubbles:Boolean = true, cancelable:Boolean = true) {
			super(type, bubbles, cancelable);
		}

        // This might be needed for event forwarding. Or not?!
		override public function clone():Event {
			return new Custom_event(type, bubbles, cancelable);
		}
	}
}
