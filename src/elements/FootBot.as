package elements {
    import flash.utils.*;
    import elements.General;

    public class FootBot extends General {
        private var animation;
        private var interval;
        private var explosion;
        public var health = 100;

        public function FootBot(newX:Number, newY:Number, walking:Boolean = true) {
            animation = addChild(new FootBot_walk());
            x = newX;
            y = newY;
            
            animation.stop();
            if (walking){
                walk();
            }
        }

        private function walk(){
            animation.play();
            interval = setInterval(function(){
                x += 25;
                var event_out = new CustomEvent(CustomEvent.ON_MOVE);
                event_out.x = x;
                event_out.y = y;
                dispatchEvent(event_out);
            }, 167);
        }

        private function explode(){
            explosion = addChild(new Explosion());
            removeChild(animation);
            setTimeout(function(){
                removeChild(explosion);
                //parent.removeChild(this);
                //removing?
            }, 500);
        }

        public function beginDeath(){
            clearInterval(interval);
            animation.stop();
            //setTimeout(explode, 1000);
            explode();
            dispatchEvent(new CustomEvent(CustomEvent.ON_DIE));
        }

        public function handler_ON_SHOOT(event){
            if(event.x == this.x){
                health -= 50;
                if(health <= 0){
                    beginDeath();
                }
            }
        }
    }
}
