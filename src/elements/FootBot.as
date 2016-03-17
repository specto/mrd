package elements {
    import flash.display.MovieClip;
    import flash.utils.*;
    import flash.events.Event;
    import custom_events.*;

    public class FootBot extends MovieClip {
        private var animation;
        private var interval;
        private var explosion;
        public var health = 100;

        public function FootBot(x:Number, y:Number, walking:Boolean = true) {
            animation = this.addChild(new FootBot_walk());
            this.x = x;
            this.y = y;
            
            animation.stop();
            addEventListener("onShoot", takeDamage);
            if (walking){ 
                walk();
            }
        }

        public function walk(){
            animation.play();
            interval = setInterval(function(){
                animation.x += 25;
                dispatchEvent(new onMove(this.x, this.y));
                //trace("bot walked");
            }, 167);
        }

        public function stopWalking(){
            clearInterval(interval);
            animation.stop();
        }

        public function explode(){
            explosion = this.addChild(new Explosion());
            explosion.x = animation.x;
            explosion.y = animation.y;
            animation = null;
            setTimeout(function(){
                explosion = null;
            }, 500);
        }

        private function beginDeath(){
            stopWalking();
            setTimeout(explode, 1000);
            dispatchEvent(new onDie());
            parent.removeChild(this);
        }

        private function takeDamage(event){
            if(event.x == this.x){
                health -= 10;
                if(health <= 0){
                    beginDeath();
                }
            }
        }
    }
}