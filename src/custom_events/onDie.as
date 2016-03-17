package custom_events{
    import flash.events.Event;
	
	public class onDie extends Event{
		public function onDie(type = "onDie", bubbles = false, cancelable = false){
			super(type, bubbles, cancelable);
		}
	}
}