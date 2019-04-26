package;

import flixel.*;
import flixel.math.*;

class Bala extends FlxSprite{
    public static var fator:Float = 0.1;
    public function new(){
		super();
        
        this.setFacingFlip(FlxObject.LEFT, true, false);
        this.setFacingFlip(FlxObject.RIGHT, false, false);
		this.loadGraphic(AssetPaths.tire__png, true, 100, 100);
        scale.set(fator, fator);
        offset.set(fator, fator);
        this.updateHitbox();
        this.setGraphicSize(10,10);
        
		this.animation.add("bola", [3, 1, 0], 8);
        this.animation.play("bola");
        
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