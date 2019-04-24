package;

import flixel.*;
import flixel.util.*;
import flixel.math.*;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
class PlayState extends FlxState{

	static inline var TILE_WIDTH:Int = 24;
	static inline var TILE_HEIGHT:Int = 24;

	var _map:FlxTilemap;
	var _player:Carro;
	var _inimigos:Array<Carro> = [];
	var _btnBack:FlxButton;
	var _enemyPath:Array<FlxPoint> = [];

	override public function create():Void{
		FlxG.cameras.bgColor = 0xff626b61;
		_map = new FlxTilemap();
		_map.loadMapFromCSV("assets/tracks/Road.csv", "assets/images/Road.png", TILE_WIDTH, TILE_HEIGHT, 0, 0);
		add(_map);

		_player = new Carro(AssetPaths.red_vehicle__png);
		_player.x = TILE_WIDTH * 23;
		_player.y = TILE_HEIGHT * 17;
		add(_player);

		#if sys
		var content:String = sys.io.File.getContent('assets/tracks/Road_path.txt');
		#else
		var content:String = "565,196
562,86
495,87
494,173
514,186
516,292
378,301
375,343
397,358
385,373
307,371
294,351
255,346
252,184
440,178
444,68
60,60
64,201
175,207
176,249
64,257
60,340
150,352
151,368
62,377
64,515
151,518
160,534
246,536
255,424
485,417
487,469
377,467
378,510
487,516
500,536
559,538
562,195
";
		#end
		var pathXY:Array<String> = content.split('\n');
		for(point in pathXY){
			var pt:Array<String> = point.split(',');
			var _pt:FlxPoint = new FlxPoint(Std.parseInt(pt[0]), Std.parseInt(pt[1]));
			_enemyPath.push(_pt);
		}

		for(i in 0...5 ){
			var _car:Carro = new Carro(AssetPaths.yellow_vehicle__png);
			_car.x = TILE_WIDTH * (23);
			_car.y = TILE_HEIGHT * (9 + i);
			_car.maxVelocity.x = _car.maxVelocity.y = 10;
			_car.path = new FlxPath().start(_enemyPath, 200, FlxPath.LOOP_FORWARD);
			add(_car);
			_inimigos.push(_car);
		}
		
		_btnBack = new FlxButton(0, 0, "Voltar", goBack);
        _btnBack.x = (FlxG.width)-(_btnBack.width)-5;
        _btnBack.y = FlxG.height - _btnBack.height - 10;
		add(_btnBack);
		super.create();

	}

	override public function update(elapsed:Float):Void{
		_player.stop();
		//FlxG.collide(_player, _map);

        if(FlxG.keys.pressed.D){
			_player.D();
        }

        if(FlxG.keys.pressed.A){
			_player.A();
        }

        if(FlxG.keys.pressed.W){
			_player.W();
        }

        if(FlxG.keys.pressed.S){
			_player.S();
        }
		if(FlxG.keys.pressed.R){
            playerReset();
        }

		if(FlxG.mouse.justPressed){
			FlxG.log.add(FlxG.mouse.screenX + " - " + FlxG.mouse.screenY);
		}
		super.update(elapsed);

	}

	function playerReset():Void{
		_player.x = TILE_WIDTH * 23;
		_player.y = TILE_WIDTH * 9;
		_player.velocity.x = _player.velocity.y = 0;
		_player.acceleration.x = _player.acceleration.y = 0;
		_player.animation.play("walkU");		
	}

	function goBack():Void{

        FlxG.switchState(new MeuMenuState());

    }
}
