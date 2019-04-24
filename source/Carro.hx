package;

import flixel.*;
import flixel.system.*;

class Carro extends Entidade{
    public function new(path:String){
        super();
        health = 10;

		this.acceleration.x = this.acceleration.y = 0;
		this.scale.set(0.35, 0.35);
		this.setFacingFlip(FlxObject.LEFT, true, false);
        this.setFacingFlip(FlxObject.RIGHT, false, false);
		this.loadGraphic(path, true, 32, 32);
		this.animation.add("walkR", [5], 8);
        this.animation.add("walkRD", [6], 8);
        this.animation.add("walkRU", [4], 8);
        this.animation.add("walkL", [1], 8);
        this.animation.add("walkLD", [0], 8);
        this.animation.add("walkLU", [2], 8);
        this.animation.add("walkU", [3], 8);
        this.animation.add("walkD", [7], 8);
		this.animation.play("walkU");
        this.facing = FlxObject.RIGHT;
    }

    override function onMessage(m:Mensagem):Void{
       /* FlxG.log.add("Personagem msg. Op = " + m.op);
        if (m.op == Mensagem.OP_DANO){
            hurt(m.data);
            FlxG.log.add("HP = " + this.health);
        }
        if (m.op == Mensagem.OP_CURA){
            if(this.health + m.data <= 10.1){
                hurt(-m.data);
                FlxG.log.add("HP = " + this.health);
            }
        }*/
    }

    public function D(){
        this.facing = FlxObject.RIGHT;
        if(this.acceleration.x < 2)
            this.acceleration.x += 0.3;
        
        if(this.velocity.x < 0)
            this.velocity.x += 1;
        else
            this.velocity.x += 0.3;

        if(this.velocity.x > 0 && this.velocity.y < 0)
            this.animation.play("walkRU");
        else if(this.velocity.x > 0 && this.velocity.y > 0)
            this.animation.play("walkRD");
        else if(this.velocity.x >= 0)
            this.animation.play("walkR");
    }

    public function A(){
        if(this.acceleration.x > -2)
            this.acceleration.x -= 0.3;
        
        if(this.velocity.x > 0)
            this.velocity.x -= 1;
        else
            this.velocity.x -= 0.3;

        if(this.velocity.x < 0 && this.velocity.y < 0)
            this.animation.play("walkLU");
        else if(this.velocity.x < 0 && this.velocity.y > 0)
            this.animation.play("walkLD");
        else if(this.velocity.x <= 0)
            this.animation.play("walkL");
    }

    public function W(){
        if(this.acceleration.y > -2)
            this.acceleration.y -= 0.3;
        
        if(this.velocity.y > 0)
            this.velocity.y -= 1;
        else
            this.velocity.y -= 0.3;

        if(this.velocity.x < 0 && this.velocity.y < 0)
            this.animation.play("walkLU");
        else if(this.velocity.x > 0 && this.velocity.y < 0)
            this.animation.play("walkRU");
        else if(this.velocity.y <= 0)
            this.animation.play("walkU");
    }

    public function S(){
        if(this.acceleration.y < 2)
            this.acceleration.y += 0.3;
        
        if(this.velocity.y < 0)
            this.velocity.y += 1;
        else
            this.velocity.y += 0.3;

        if(this.velocity.x < 0 && this.velocity.y > 0)
            this.animation.play("walkLD");
        else if(this.velocity.x > 0 && this.velocity.y > 0)
            this.animation.play("walkRD");
        else if(this.velocity.y >= 0)
            this.animation.play("walkD");
    }

    public function stop(){
        if(this.velocity.y < 0.1 && this.velocity.y > -0.1)
            this.velocity.y = 0;

        if(this.velocity.x < 0.1 && this.velocity.x > -0.1)
            this.velocity.x = 0;
        
        if(this.velocity.y > 0)
			this.velocity.y -= 0.1;
		if(this.velocity.y < 0)
			this.velocity.y += 0.1;
		
		if(this.velocity.x > 0)
			this.velocity.x -= 0.1;
		if(this.velocity.x < 0)
			this.velocity.x += 0.1;
		
		this.animation.stop();
    }
}
