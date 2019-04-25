package;

import flixel.*;
import flixel.math.*;

class Bala extends FlxSprite{
    public function new(){
		super();
        
        this.setFacingFlip(FlxObject.LEFT, true, false);
        this.setFacingFlip(FlxObject.RIGHT, false, false);
		this.loadGraphic(AssetPaths.tire__png, true, 100, 100);
		
        scale.set(0.1,0.1);
        offset.set(0.1, 0.1);
        
		this.animation.add("aa", [3, 1, 0], 8);
        this.animation.play("aa");
        
        this.facing = FlxObject.RIGHT;
        //kill();
	}

    override public function update(elapsed:Float):Void{
        if(!this.isOnScreen()){
            this.kill();
        }
        super.update(elapsed);
    }
}