package;

import flixel.*;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class EndState extends FlxState{

    var _end:FlxText;
    var _voltar:FlxButton;
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


        _voltar = new FlxButton(0, 0, "Voltar", goBack);
        _voltar.x = (FlxG.width/2)-(_voltar.width/2);
        _voltar.y = _tempo.y + _voltar.height + 5;

        add(_end);
        add(_eutbm);
        add(_tempo);
        add(_voltar);
    }

    function goBack():Void{
        FlxG.switchState(new MeuMenuState());
    }

    override public function update(elapsed:Float):Void{
        super.update(elapsed);
    }
}