package;

import flixel.*;
import flixel.text.FlxText;
import flixel.math.*;

class EndState extends FlxState{

    var _end:FlxText;
    var _voltar:FlxText;
    var _eutbm:FlxText;
    var _tempo:FlxText;
    var tempo:Float = 40;

    public function new(tempo:Float){
		this.tempo = tempo;
		super();
	}
	

    override public function create():Void{
        _end = new FlxText(0, 0, 0, "VOCE PERDEU O JOGO\n\n", 20);
        _end.x = (FlxG.width/2)-(_end.width / 2);
        _end.y = FlxG.height/2-(_end.height / 2);

        _eutbm = new FlxText(0, 0, 0, "E EU TAMBÉM\n\n", 8);
        _eutbm.x = (FlxG.width/2)-(_eutbm.width / 2);
        _eutbm.y = _end.y + _end.height/2 + 2;
        var s:PlayState = cast FlxG.state;

        _tempo = new FlxText(0, 0, 0, "VOCê SOBREVIVEU POR "+ Std.int(tempo) +"s \n\n", 10);
        _tempo.x = (FlxG.width/2)-(_tempo.width / 2);
        _tempo.y = _eutbm.y + _eutbm.height/2 + 2;

        _voltar = new FlxText(0, 0, 0, "\nClique para voltar", 10);
        _voltar.x = (FlxG.width/2)-(_voltar.width / 2);
        _voltar.y = _end.y + _end.height + 10;

        add(_end);
        add(_eutbm);
        add(_tempo);
        add(_voltar);
    }

    function goBack():Void{
        FlxG.switchState(new MeuMenuState());
    }

    override public function update(elapsed:Float):Void{
        if(FlxG.mouse.justPressed){
            FlxG.switchState(new MeuMenuState());
        }
        super.update(elapsed);
    }
}