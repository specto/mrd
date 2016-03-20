package {
    import flash.display.Sprite;
    import flash.utils.*
    import flash.events.Event;
    import elements.*;

    public class Main extends Sprite {
    	private const groundY = 500;

        public function Main():void {

            spawn('wall', 100);
            spawn('footbot', -100);
    		//spawn('wall', 0);
         }

	    public function spawn(type:String, x:Number, y:Number = groundY) {
	        var obj;

	        switch (type.toLowerCase()) {
	            case 'wall':
	                obj = new Wall(x, groundY);
	                addEventListener(Custom_event.ON_MOVE, obj.onMove);
	                break;
	            case 'footbot':
	   			    obj = new FootBot(x, groundY);
	            	break;
	            default:
	                throw new Error('Unknow spawn type requested');
	        }
	        return addChild(obj); //parent.addChild()
	    }

	    public static function guid( value:Array = null ):String {

            var uid:Array = new Array();
            var chars:Array = new Array( 48,49,50,51,52,53,54,55,56,57,65,66,67,68,69,70 );
            var separator:uint = 45;
            var template:Array = value || new Array( 8,4,4,4,12 );

            for ( var a:uint = 0; a < template.length; a++ ) {
                for ( var b:uint = 0; b < template[a]; b++ ) {
                    uid.push( chars[ Math.floor( Math.random() *  chars. length ) ] );
                } if ( a < template.length - 1 ) {
                    uid.push( separator );
                }
            }

            return String.fromCharCode.apply( null, uid );
        }
    }
}
