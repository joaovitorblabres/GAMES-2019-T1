package;

import flixel.*;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MeuMenuState extends FlxState{
    var _titulo:FlxText;
    var _btnPlay:FlxButton;
    var _btnHelp:FlxButton;
    var _btnCredit:FlxButton;

    override public function create():Void{
        FlxG.cameras.bgColor = 0xff000000;
        _titulo = new FlxText(0, 0, 0, "Corrida Maluca", 30);
        _titulo.x = (FlxG.width/2)-(_titulo.width / 2);
        _titulo.y = (FlxG.height/2)-(_titulo.height / 2) - 45;

        _btnPlay = new FlxButton(0, 0, "Play", goPlay);
        _btnPlay.scale.set(1.1,1.6);
        _btnPlay.x = (FlxG.width/2)-(_btnPlay.width / 2);
        _btnPlay.y = _titulo.y + _titulo.height + 10;

        _btnHelp = new FlxButton(0, 0, "Help", goHelp);
        _btnHelp.scale.set(1.1,1.6);
        _btnHelp.x = (FlxG.width/2)-(_btnHelp.width / 2);
        _btnHelp.y = _btnPlay.y + _btnPlay.height + 10;

        _btnCredit = new FlxButton(0, 0, "Credits", goCredits);
        _btnCredit.scale.set(1.1,1.6);
        _btnCredit.x = (FlxG.width/2)-(_btnCredit.width / 2);
        _btnCredit.y = _btnHelp.y + _btnHelp.height + 10;
        
        add(_titulo);
        add(_btnPlay);
        add(_btnHelp);
        add(_btnCredit);
        super.create();
    }

    function goPlay():Void{
        FlxG.switchState(new PlayState());
    }

    function goCredits():Void{
        FlxG.switchState(new CreditsState());
    }

    function goHelp():Void{
        FlxG.switchState(new HelpState());
    }
}