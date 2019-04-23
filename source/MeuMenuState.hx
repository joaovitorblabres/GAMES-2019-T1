package;

import flixel.*;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MeuMenuState extends FlxState{
    var _titulo:FlxText;
    var _btnPlay:FlxButton;
    var _btnCredit:FlxButton;
    override public function create():Void{
        FlxG.cameras.bgColor = 0xff000000;
        _titulo = new FlxText(0, 0, 0, "Corrida Maluca", 30);
        _titulo.x = (FlxG.width/2)-(_titulo.width / 2);
        _titulo.y = (FlxG.height/2)-(_titulo.height / 2) - 45;

        _btnPlay = new FlxButton(0, 0, "Play", goPlay);
        _btnPlay.x = (FlxG.width/2)-(_btnPlay.width / 2);
        _btnPlay.y = _titulo.y + _titulo.height + 5;

        _btnCredit = new FlxButton(0, 0, "Creditos", goCredits);
        _btnCredit.x = (FlxG.width/2)-(_btnCredit.width / 2);
        _btnCredit.y = _btnPlay.y + _btnPlay.height + 5;
        
        add(_titulo);
        add(_btnPlay);
        add(_btnCredit);
        super.create();
    }

    function goPlay():Void{
        FlxG.switchState(new PlayState());
    }

    function goCredits():Void{
        FlxG.switchState(new CreditsState());
    }
}