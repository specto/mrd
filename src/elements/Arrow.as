package elements {
    import flash.utils.*;
    import elements.BaseClip;
    import elements.CustomEvent;

    public class Arrow extends BaseClip{
    	private var animation;
    	private var interval;

    	public function Arrow(newX, newY, endX, endY){
            x = newX;
            y = newY - 150;

    		animation = addChild(new Arrow_Sprite());
    		shoot(endX, endY);
    	}

    	public function shoot(endX, endY){
    		animation.play();

            interval = setInterval(function(){
                if(x > endX){
                    x -= 25;
    			}else{
    				clearInterval(interval);
                    dispatchEvent(new CustomEvent(CustomEvent.ON_DESTROY));
    			}
    		}, 10);
    	}
    }
}