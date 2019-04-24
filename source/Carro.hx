package;

import flixel.*;

class Carro extends Entidade{
    static var moving:Int = 2;
    public function new(path:String){
        super();
        health = 10;

		this.acceleration.x = this.acceleration.y = 0;
		this.setFacingFlip(FlxObject.LEFT, true, false);
        this.setFacingFlip(FlxObject.RIGHT, false, false);
		this.loadGraphic(path, true, 20, 20);
		this.animation.add("walkR", [5], 8);
        this.animation.add("walkRD", [6], 8);
        this.animation.add("walkRU", [4], 8);
        this.animation.add("walkL", [1], 8);
        this.animation.add("walkLD", [0], 8);
        this.animation.add("walkLU", [2], 8);
        this.animation.add("walkU", [3], 8);
        this.animation.add("walkD", [7], 8);
		this.animation.play("walkD");
        this.facing = FlxObject.RIGHT;
    }

    public function updateEm():Void{
        checkR();
        checkL();
        checkU();
        checkD();
               
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
        this.velocity.x += moving;
        this.animation.play("walkR");
    }

    public function A(){
        this.velocity.x -= moving;
        this.animation.play("walkL");
    }

    public function W(){
        this.velocity.y -= moving;
        this.animation.play("walkU");
    }

    public function S(){
        this.velocity.y += moving;
        this.animation.play("walkD");
    }

    function checkR(){
        if(this.velocity.x > 0 && this.velocity.y < 0)
            this.animation.play("walkRU");
        else if(this.velocity.x > 0 && this.velocity.y > 0)
            this.animation.play("walkRD");
        else if(this.velocity.x >= 0)
            this.animation.play("walkR");
    }

    function checkL(){
        if(this.velocity.x < 0 && this.velocity.y < 0)
            this.animation.play("walkLU");
        else if(this.velocity.x < 0 && this.velocity.y > 0)
            this.animation.play("walkLD");
        else if(this.velocity.x <= 0)
            this.animation.play("walkL");
    }

    function checkU(){
        if(this.velocity.x < 0 && this.velocity.y < 0)
            this.animation.play("walkLU");
        else if(this.velocity.x > 0 && this.velocity.y < 0)
            this.animation.play("walkRU");
        else if(this.velocity.y <= 0)
            this.animation.play("walkU");
    }

    function checkD(){
        if(this.velocity.x < 0 && this.velocity.y > 0)
            this.animation.play("walkLD");
        else if(this.velocity.x > 0 && this.velocity.y > 0)
            this.animation.play("walkRD");
        else if(this.velocity.y >= 0)
            this.animation.play("walkD");
    }

}
