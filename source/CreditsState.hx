package;

import flixel.*;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class CreditsState extends FlxState{

    var _prog:FlxText;
    var _credito:FlxText;
    var _agradecimentos:FlxText;
    var _arte:FlxText;
    var _btnVoltar:FlxButton;
    var _sprite:FlxSprite;
    var _flixel:FlxText;
    static inline var VELOCITY:Int = 40;

    override public function create():Void{
        _credito = new FlxText(0, 0, 0, "Créditos\n\n", 20);
        _credito.x = (FlxG.width/2)-(_credito.width / 2);
        _credito.y = FlxG.height;
        _credito.moves = true;
        _credito.velocity.y = -VELOCITY;
        _credito.alignment = CENTER;

        _prog = new FlxText(0, 0, 0, "Trabalho desenvolvido para a disciplina de Jogos\n[PROGRAMAÇÃO]\nJoão Vitor Bruniera Labres\n\n", 10);
        _prog.x = (FlxG.width/2)-(_prog.width / 2);
        _prog.y = _credito.y + _credito.height + 10;
        _prog.moves = true;
        _prog.velocity.y = -VELOCITY;
        _prog.alignment = CENTER;

        _arte = new FlxText(0, 0, 0, "[ARTE]\n\nCarros\nCredit Racoon Media via\nLicense (Creative Commons Zero, CC0)\n\nPneus e \"asfalto\": Google\n\n\"Grama\"\nJoão Vitor Bruniera Labres\n", 10);
        _arte.x = (FlxG.width/2)-(_arte.width / 2);
        _arte.y = _prog.y + _prog.height + 10;
        _arte.moves = true;
        _arte.velocity.y = -VELOCITY;
        _arte.alignment = CENTER;

        _agradecimentos = new FlxText(0, 0, 0, "[AGRADECIMENTOS]\nUniversidade Federal da Fronteira Sul\nCampus Chapecó\nFernando Belivacqua\n\n", 10);
        _agradecimentos.x = (FlxG.width/2)-(_agradecimentos.width / 2);
        _agradecimentos.y = _arte.y + _arte.height + 10;
        _agradecimentos.moves = true;
        _agradecimentos.velocity.y = -VELOCITY;
        _agradecimentos.alignment = CENTER;

        _sprite = new FlxSprite(0, 0);
        _sprite.x = (FlxG.width/2)-(_sprite.width / 2);
        _sprite.y = _agradecimentos.y + _agradecimentos.height + 10;
        _sprite.velocity.y = -VELOCITY;

        _flixel = new FlxText(0, 0, 0, "Powered by HaxeFlixel", 10);
        _flixel.x = (FlxG.width/2)-(_flixel.width / 2);
        _flixel.y = _sprite.y + _sprite.height + 15;
        _flixel.moves = true;
        _flixel.velocity.y = -VELOCITY;
        _flixel.alignment = CENTER;

        _btnVoltar = new FlxButton(0, 0, "Voltar", goBack);
        _btnVoltar.x = (FlxG.width)-(_btnVoltar.width)-5;
        _btnVoltar.y = FlxG.height - _btnVoltar.height - 10;

        add(_prog);
        add(_credito);
        add(_arte);
        add(_agradecimentos);
        add(_sprite);
        add(_flixel);
        add(_btnVoltar);
    }

    function goBack():Void{
        FlxG.switchState(new MeuMenuState());
    }

    override public function update(elapsed:Float):Void{
        super.update(elapsed);
    }
}