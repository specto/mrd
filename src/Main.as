package {
    import flash.display.Sprite;
    import mrd.*;
    import flash.utils.*;

    public class Main extends Sprite {
        public function Main():void {
            var theLevel = this.addChild(new Level());
/*
            var boomBot = new FootBot();
            this.addChild(boomBot);
            boomBot.x = -50;
            boomBot.y = 300;

            var wall = this.addChild(new Wall());
            wall.y = 300;
            wall.x = 600;
            boomBot.walk();
            */
         }
    }
}
