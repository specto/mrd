package mrd {
    import flash.display.MovieClip;
    import flash.utils.*;

    public class Princess extends MovieClip {
        private var bgrAnim;
        public function Princess(){
            this.bgrAnim = this.addChild(new bgr());
        }
        public function justGoing(bot){
            if (bot.isPlaying) {
                this.bgrAnim.stop();
            } else {
                this.bgrAnim.play();
            }
        }
    }
}
