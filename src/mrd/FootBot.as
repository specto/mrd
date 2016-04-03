package mrd {
    import flash.display.MovieClip;
    import flash.utils.*;

    public class FootBot extends MovieClip {
        private var animation;
        private var interval;
        private var explosion;
        //public var currentPosition;

        public function FootBot(x:Number, y:Number, walking:Boolean = true) {
            animation = this.addChild(new FootBot_walk());
            animation.stop();
            this.x = x;
            this.y = y;
            if (walking) {
                walk();
            }
        }

        public function walk(){
            animation.play();
            interval = setInterval(function(){
                animation.x += 25;
            }, 167);
        }

        public function stopWalking(){
            clearInterval(interval);
            animation.stop();
        }

        public function explode(){
            explosion = this.addChild(new Explosion());
            stopWalking();
            explosion.x = animation.x;
            explosion.y = animation.y;
            //removeChild(animation);
            animation = null;
            setTimeout(function(){
                //this.removeChild(explosion);
                explosion = null;
            }, 500);
        }
    }
}
