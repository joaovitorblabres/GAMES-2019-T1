package;

import flixel.*;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class EndState extends FlxState{

    var _end:FlxText;
    var _voltar:FlxText;
    var _arte:FlxText;
    var _btnVoltar:FlxButton;
    var _sprite:FlxSprite;
    var _flixel:FlxText;
    static inline var VELOCITY:Int = 40;

    override public function create():Void{
        _end = new FlxText(0, 0, 0, "VOCE PERDEU O JOGO\n\n", 20);
        _end.x = (FlxG.width/2)-(_end.width / 2);
        _end.y = FlxG.height/2-(_end.height / 2);

        _voltar = new FlxText(0, 0, 0, "\nClique para voltar", 10);
        _voltar.x = (FlxG.width/2)-(_voltar.width / 2);
        _voltar.y = _end.y + _end.height + 10;

        add(_end);
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