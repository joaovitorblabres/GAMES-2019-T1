package;

import flixel.*;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class WinState extends FlxState{

    var _end:FlxText;
    var _voltar:FlxButton;
    var _tempo:FlxText;
    var _fogos:Float = 0.5;
    var tempo:Float = 40;
    var arr = new Array<Int>();
    var arr2 = new Array<Int>();
    public function new(tempo:Float){
		this.tempo = tempo;
		super();
	}
	

    override public function create():Void{
        
        for(i in 0...70)
            arr.push(i);
        
        for(i in 0...80)
            arr2.push(i);
        
        _end = new FlxText(0, 0, 0, "VOCE GANHOU!!\n\n", 20);
        _end.x = (FlxG.width/2)-(_end.width / 2);
        _end.y = FlxG.height/2-(_end.height / 2);

        _tempo = new FlxText(0, 0, 0, "VOCê SOBREVIVEU POR "+ Std.int(tempo) +"s \n\n", 10);
        _tempo.x = (FlxG.width/2)-(_tempo.width / 2);
        _tempo.y = _end.y + _end.height/2 + 2;

        _voltar = new FlxButton(0, 0, "Voltar", goBack);
        _voltar.x = (FlxG.width/2)-(_voltar.width/2);
        _voltar.y = _tempo.y + _voltar.height + 10;

        add(_end);
        add(_tempo);
        add(_voltar);
    }

    function goBack():Void{
        FlxG.switchState(new MeuMenuState());
    }

    override public function update(elapsed:Float):Void{
        _fogos -= elapsed;
        if(_fogos < 0){
            _fogos = 0.5;
            var s = new FlxSprite(0,0);
            s.loadGraphic(AssetPaths.spritesheet__png, true, 100, 100);
            s.setPosition(FlxG.random.int(0,750), FlxG.random.int(0,600));
            s.animation.add("kabum", arr , 30, false);
            s.animation.play("kabum");
            add(s);
            var d = new FlxSprite(0,0);
            d.loadGraphic(AssetPaths.spritesheet2__png, true, 100, 100);
            d.setPosition(FlxG.random.int(0,750), FlxG.random.int(0,600));
            d.animation.add("kabum", arr2 , 30, false);
            d.animation.play("kabum");
            add(d);
        }
        super.update(elapsed);
    }
}