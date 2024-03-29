package;

import flixel.*;
import flixel.math.*;
import flixel.group.FlxGroup;

class Carro extends Entidade{
    static var moving:Int = 2;
    public var municao:Int = 20;
    var _balas = new FlxTypedGroup<Bala>();
    var _velocity:FlxVector = new FlxVector();
    public var delay:Int = FlxG.random.int(2,5);
    public var _counter:Float;
    var player:Int;
    public var tempo:Float = 0;
    public var dano:Int = 0;

    public function new(path:String, bullets:FlxTypedGroup<Bala>, p:Int, dano:Int, vida:Int){
        super();
        health = vida;
        this.dano = dano;
        this.player = p;
        this._counter = this.delay;
		this.acceleration.x = this.acceleration.y = 0;
		this.setFacingFlip(FlxObject.LEFT, true, false);
        this.setFacingFlip(FlxObject.RIGHT, false, false);
		this.loadGraphic(path, true, 20, 20);
        this.animation.add("walkRD", [6], 8);
        this.animation.add("walkRU", [4], 8);
		this.animation.add("walkR", [5], 8);
        this.animation.add("walkL", [1], 8);
        this.animation.add("walkLD", [0], 8);
        this.animation.add("walkLU", [2], 8);
        this.animation.add("walkU", [3], 8);
        this.animation.add("walkD", [7], 8);
		this.animation.play("walkD");
        this.facing = FlxObject.RIGHT;
        _balas = bullets;
    }

    public function updateEm():Void{
        checkAngle();
    }

    override function onMessage(m:Mensagem):Void{
        if (m.op == Mensagem.OP_DANO){
            health -= m.data;
            if(health <= 0 && this.player == 1){
                FlxG.switchState(new EndState(tempo));
            }
            if(health <= 0 && this.player == 0){
                this.kill();
                //this.destroy();
            }
        }
        if (m.op == Mensagem.OP_CURA){
            hurt(-m.data);
        }
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

    function checkAngle(){
        //FlxG.log.add(this.path.angle);
        if(this.path.angle > 170 && this.path.angle <= -170)
            this.animation.play("walkD");
        else
            this.animation.play("walkD");
        if(this.path.angle > -20 && this.path.angle <= 20)
            this.animation.play("walkU");
        if(this.path.angle > 20 && this.path.angle <= 70)
            this.animation.play("walkRU");
        if(this.path.angle > 70 && this.path.angle <= 110)
            this.animation.play("walkR");
        if(this.path.angle > 110 && this.path.angle <= 170)
            this.animation.play("walkRD");
        if(this.path.angle > -170 && this.path.angle <= -110)
            this.animation.play("walkLD");
        if(this.path.angle > -110 && this.path.angle <= -70)
            this.animation.play("walkL");
        if(this.path.angle > -70 && this.path.angle <= -20)
            this.animation.play("walkLU");
    }

    public function tirao(X:Int, Y:Int):Void{
        var b:Bala = _balas.getFirstAvailable();
        if(b != null){
            b.reset(this.x, this.y);
            b.dano = this.dano;
            _velocity.x = X - this.x;
            _velocity.y = Y - this.y;
            _velocity.normalize();
            _velocity.scale(500);
            b.velocity.x = _velocity.x;
            b.velocity.y = _velocity.y;
            b.angle = Math.atan2(X - this.x, this.y - Y) * 180/Math.PI;
            this.municao--;
        }
    }

}
