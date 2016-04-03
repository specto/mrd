package {
    import flash.display.Sprite;
    import flash.utils.*;
    import flash.events.Event;
    import elements.*;

    public class Main extends Sprite {
    	private const groundY = 600;

        public function Main():void {

            spawn('wall', 700);

            setInterval(function(){
                spawn('footbot', 0)
            }, 1300);

            addEventListener(CustomEvent.ON_DIE, handler_ON_DIE);
            addEventListener(CustomEvent.ON_DESTROY, handler_ON_DESTROY);
        }

        private function handler_ON_DIE(event){
            event.target.doDie(function () {
                removeEventListener(CustomEvent.ON_SHOOT, event.target.handler_ON_SHOOT);
                removeChild(event.target);
        	});
        }

        private function handler_ON_DESTROY(event){
            removeChild(event.target);
        }

	    public function spawn(type:String, x:Number, y:Number = groundY) {
	        var obj;

	        switch (type.toLowerCase()) {
	            case 'wall':
	                obj = new Wall(x, groundY);
	                addEventListener(CustomEvent.ON_MOVE, obj.handler_ON_MOVE);
	                addEventListener(CustomEvent.ON_DIE, obj.handler_ON_DIE);s
                    break;
	            case 'footbot':
	   			    obj = new FootBot(x, groundY);
                    addEventListener(CustomEvent.ON_SHOOT, obj.handler_ON_SHOOT);
	            	break;
	            default:
	                throw new Error('Unknow spawn type requested');
	        }
	        return addChild(obj);
	    }
    }
}
