package;

import flixel.*;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class HelpState extends FlxState{

    var _help:FlxText;
    var _comandos:FlxText;
    var _tiro:FlxText;
    var _extra:FlxText;
    var _btnVoltar:FlxButton;

    override public function create():Void{
        _help = new FlxText(0, 0, 0, "HELP\n\n", 20);
        _help.x = (FlxG.width/2)-(_help.width / 2);
        _help.y = 30 + (_help.height / 2);

        _comandos = new FlxText(0, 0, 0, "\n\nMOVES:\nW - MOVE UP\nA - MOVE LEFT\nS - MOVE DOWN\nD - MOVE RIGHT", 15);
        _comandos.x = (1*FlxG.width/6);
        _comandos.y = _help.y + 40;

        _tiro = new FlxText(0, 0, 0, "\n\n\"SHOOT\":\nMOUSE - AIM\nMOUSE RIGHT CLICK - SHOOT", 15);
        _tiro.x = (3*FlxG.width/6);
        _tiro.y = _help.y + 40;

        _extra = new FlxText(0, 0, 0, "HOW TO PLAY:\n\nEnemies deal a random damage\n\"Walls\" deal 1 of damage\nHit cars deal 1 damage\nTires auto-recharge after total usage\n   after a random time between 2 and 5 seconds\n", 15);
        _extra.x = (FlxG.width/6);
        _extra.y = _extra.y + _comandos.height + _extra.height + 20;

        _btnVoltar = new FlxButton(0, 0, "Voltar", goBack);
        _btnVoltar.x = (FlxG.width)-(_btnVoltar.width)-5;
        _btnVoltar.y = FlxG.height - _btnVoltar.height - 10;

        add(_help);
        add(_comandos);
        add(_tiro);
        add(_extra);
        add(_btnVoltar);
    }

    function goBack():Void{
        FlxG.switchState(new MeuMenuState());
    }

    override public function update(elapsed:Float):Void{
        super.update(elapsed);
    }
}