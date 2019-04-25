package;

import flixel.*;
import flixel.util.*;
import flixel.math.*;
import flixel.addons.editors.tiled.*;
import flixel.tile.*;
import flixel.tile.FlxBaseTilemap;
import flixel.ui.FlxButton;
class PlayState extends FlxState{

	static inline var TILE_WIDTH:Int = 100;
	static inline var TILE_HEIGHT:Int = 72;

	var _map:TiledMap;
	var _blocks:FlxTilemap;
	var _player:Carro;
	var _inimigos:Array<Carro> = [];
	var _btnBack:FlxButton;
	var _enemyPath:Array<Array<FlxPoint>> = [];

	override public function create():Void{
		FlxG.cameras.bgColor = 0xff000000;
		_map = new TiledMap(AssetPaths.please__tmx);
		_blocks = new FlxTilemap();
		_blocks.loadMapFromArray(cast(_map.getLayer("blocks"), TiledTileLayer).tileArray, _map.width, _map.height, AssetPaths.Road__png, _map.tileWidth, _map.tileHeight, FlxTilemapAutoTiling.OFF, 1, 0, 2);
		//_blocks.follow();
		_blocks.setTileProperties(1, FlxObject.NONE);
		_blocks.setTileProperties(2, FlxObject.ANY);
		_blocks.setPosition(0,0);
		add(_blocks);
		/*_map = new FlxTilemap();
		_map.loadMapFromCSV("assets/tracks/pathfinding_map.txt", "assets/images/city.png", TILE_WIDTH, TILE_HEIGHT, 0, 0);
		add(_map);

		_blocks = new FlxTilemap();
		_blocks.loadMapFromCSV("assets/tracks/blocks.csv", "assets/images/Road.png", 24, 24, 0, 0);
		_blocks.setTileProperties(1, FlxObject.ANY);
		add(_blocks);*/

		_player = new Carro(AssetPaths.red_vehicle__png);
		_player.x = 24 * 23;
		_player.y = 24 * 17;
		add(_player);
		var pos:String = "43,129
41,474
311,480
307,550
515,550
506,350
333,339
328,220
196,219
467,225
455,140";
		var pathXY:Array<String> = pos.split('\n');
		var path:Array<FlxPoint> = [];
		for(point in pathXY){
			var pt:Array<String> = point.split(',');
			var _pt:FlxPoint = new FlxPoint(Std.parseInt(pt[0]), Std.parseInt(pt[1]));
			path.push(_pt);
		}

		for(i in 0...3 ){
			_enemyPath.push(path);
			var _car:Carro = new Carro(AssetPaths.green_vehicle__png);
			_car.x = path[0].x + i*30;
			_car.y = path[0].y + i;
			_car.velocity.x = _car.velocity.y = 1;
			if(i%2 == 0)
				_car.path = new FlxPath().start(_enemyPath[i], 200, FlxPath.LOOP_FORWARD);
			else
				_car.path = new FlxPath().start(_enemyPath[i], 200, FlxPath.LOOP_BACKWARD);
			_car.path.speed = FlxMath.sinh(i)*50 + 100;
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
		FlxG.collide(_player, _blocks);
		//var overlapping = FlxG.pixelPerfectOverlap(_jogador, _tiro);
		for(i in 0...3){
			_inimigos[i].updateEm();
			FlxG.collide(_inimigos[i], _blocks);
			//FlxG.collide(_inimigos[i], _player);
		}
		//var overlapping = _map.overlapsWithCallback(_player);

		//FlxG.collide(_player, _map);
		//FlxG.collide(_player, _blocks);

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

		/*if(FlxG.keys.anyJustReleased([W, A, S, D])){
			_player.animation.stop();
		}*/

		if(FlxG.mouse.justPressed){
			
		}
		super.update(elapsed);

	}

	function playerReset():Void{
		_player.x = 24 * 23;
		_player.y = 24 * 9;
		_player.velocity.x = _player.velocity.y = 0;
		_player.acceleration.x = _player.acceleration.y = 0;
		_player.animation.play("walkU");		
	}

	function goBack():Void{

        FlxG.switchState(new MeuMenuState());

    }
}
