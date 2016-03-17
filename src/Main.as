package {
    import flash.display.Sprite;
    import flash.utils.*
    import flash.events.Event;
    import elements.*;

    public class Main extends Sprite {
    	private const groundY = 500;

        public function Main():void {
            //var theLevel = this.addChild(new Level());

            spawn('wall', 550);
            spawn('footbot', -100);
    		//spawn('wall', 0);
         }

	    public function spawn(type:String, x:Number, y:Number = groundY) {
	        var obj;

	        switch (type.toLowerCase()) {
	            case 'wall':
	                obj = new Wall(x, groundY);
	                break;
	            case 'footbot':
	   			    obj = new FootBot(x, groundY);
	            	break;
	            default:
	                throw new Error('Unknow spawn type requested');
	        }
	        return addChild(obj); //parent.addChild()
	    }
    }
}
