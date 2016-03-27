package {
    import flash.display.Sprite;
    import flash.utils.*
    import flash.events.Event;
    import elements.*;

    public class Main extends Sprite {
    	private const groundY = 500;

        public function Main():void {

            spawn('wall', 600);
            spawn('footbot', -100);
            spawn('footbot', 0);
         }

	    public function spawn(type:String, x:Number, y:Number = groundY) {
	        var obj;

	        switch (type.toLowerCase()) {
	            case 'wall':
	                obj = new Wall(x, groundY);
	                addEventListener(CustomEvent.ON_MOVE, obj.handler_ON_MOVE);
	                break;
	            case 'footbot':
	   			    obj = new FootBot(x, groundY);
                    addEventListener(CustomEvent.ON_SHOOT, obj.handler_ON_SHOOT);
	            	break;
	            default:
	                throw new Error('Unknow spawn type requested');
	        }
	        return addChild(obj); //parent.addChild()
	    }
    }
}
