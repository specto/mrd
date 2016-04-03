package elements {
    import flash.display.MovieClip;
    import flash.utils.*;
    import flash.events.Event;
    import elements.*;

    public class Level extends MovieClip {
 		private const groundY = 500;

 		public function Level() {
            //spawn('footbot', -100);
            spawn('wall', 0);
    	    spawn('wall', 0);
 		}

        public function spawn(type:String, x:Number, y:Number = groundY) {
            var obj;

            switch (type.toLowerCase()) {
                case 'wall':
                    obj = new Wall(x, groundY);
                case 'footbot':
       			    obj = new FootBot(x, groundY);
                //default:
                //    throw new Error('Unknow spawn type requested');
            }
            return addChild(obj); //parent.addChild()
        }
    }
}