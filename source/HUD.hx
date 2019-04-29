package;

import flixel.*;
import flixel.group.FlxGroup;
import flixel.text.*;

class HUD extends FlxGroup{
    var _municao:FlxText;
    var _vida:FlxText;
    var _tempo:FlxText;
    public function new(){
        super();
        _municao = new FlxText(600, 5, 0, "Municao: 20/20", 15);
        _vida = new FlxText(600, 45, 0, "Vida: 100/100", 15);
        _tempo = new FlxText(600, 85, 0, "Tempo: 0s", 15);
        add(_vida);
        add(_municao);
        add(_tempo);
    }
    override public function update(elapsed:Float):Void{
        var s:PlayState = cast FlxG.state;
        _municao.text = "Municao: " + s._player.municao + "/20";
        _vida.text = "Vida: " + s._player.health + "/100";
        _tempo.text = "Tempo: " + Math.floor(s._player.tempo) + "s";
    }
}