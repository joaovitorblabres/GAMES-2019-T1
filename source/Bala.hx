package;

import flixel.*;
import flixel.math.*;

class Bala extends FlxSprite{
    public static var fator:Float = 0.1;
    public var dano:Int;
    public function new(_dano:Int = 0){
		super();
        this.dano = _dano;
        this.setFacingFlip(FlxObject.LEFT, true, false);
        this.setFacingFlip(FlxObject.RIGHT, false, false);
		this.loadGraphic(AssetPaths.tire__png, true, 100, 100);
        this.setGraphicSize(10,10);
        scale.set(fator, fator);
        this.updateHitbox();
        
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