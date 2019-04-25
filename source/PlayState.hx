package;

import flixel.*;
import flixel.util.*;
import flixel.math.*;
import flixel.addons.editors.tiled.*;
import flixel.tile.*;
import flixel.group.FlxGroup;
import flixel.tile.FlxBaseTilemap;
import flixel.ui.FlxButton;
class PlayState extends FlxState{

	static inline var TILE_WIDTH:Int = 100;
	static inline var TILE_HEIGHT:Int = 72;
	static inline var QTD_INI:Int = 3;

	var _map:TiledMap;
	var _blocks:FlxTilemap;
	var _city:FlxTilemap;
	var _player:Carro;
	var _inimigos:Array<Carro> = [];
	var _bullets:FlxTypedGroup<Bala>;
	var _enemyBullets:FlxTypedGroup<Bala>;
	var _btnBack:FlxButton;
	var _enemyPath:Array<Array<FlxPoint>> = [];
	var _counter:Float = 0;

	override public function create():Void{
		FlxG.cameras.bgColor = 0xff000000;
		_map = new TiledMap(AssetPaths.trabalho__tmx);
		_blocks = new FlxTilemap();
		_blocks.loadMapFromArray(cast(_map.getLayer("blocks"), TiledTileLayer).tileArray, _map.width, _map.height, AssetPaths.city__png, _map.tileWidth, _map.tileHeight, FlxTilemapAutoTiling.OFF, 1, 0, 2);
		//_blocks.follow();
		_blocks.setTileProperties(36, FlxObject.NONE);
		_blocks.setTileProperties(18, FlxObject.ANY);
		add(_blocks);
		_bullets = new FlxTypedGroup<Bala>(200);
		_player = new Carro(AssetPaths.red_vehicle__png, _bullets);
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

        for(i in 0...200){
            var s = new Bala();
            s.kill();
            _bullets.add(s);
        }

		for( i in 0...QTD_INI ){
			_enemyPath.push(path);
			_enemyBullets = new FlxTypedGroup<Bala>(1000);
			var _car:Carro = new Carro(AssetPaths.yellow_vehicle__png, _enemyBullets);
			_car.x = path[0].x + i*30;
			_car.y = path[0].y + i;
			if(i%2 == 0)
				_car.path = new FlxPath().start(_enemyPath[i], 200, FlxPath.LOOP_FORWARD);
			else
				_car.path = new FlxPath().start(_enemyPath[i], 200, FlxPath.LOOP_BACKWARD);
			_car.path.speed = FlxMath.sinh(i)*50 + 100;
			add(_car);
			_inimigos.push(_car);
		}

		for(i in 0...1000){
            var s = new Bala();
            s.kill();
            _enemyBullets.add(s);
        }
		
		_btnBack = new FlxButton(0, 0, "Voltar", goBack);
        _btnBack.x = (FlxG.width)-(_btnBack.width)-5;
        _btnBack.y = FlxG.height - _btnBack.height - 10;
		add(_btnBack);
		add(_bullets);
		add(_enemyBullets);
		super.create();

	}

	override public function update(elapsed:Float):Void{
		_counter += elapsed;
		for(i in 0...QTD_INI){
			if(((Math.floor(_counter) + 1) % (i+2)) == 0 && _inimigos[i].tirou == 0){
				_inimigos[i].tirao(Std.int(_player.x), Std.int(_player.y));
				_inimigos[i].tirou = 1;
			}
		}
		if(Math.floor(_counter) % 10 == 0){
			for(i in 0...QTD_INI){
				_inimigos[i].tirou = 0;
			}
		}
		FlxG.collide(_player, _blocks);
		//var overlapping = FlxG.pixelPerfectOverlap(_jogador, _tiro);
		for(i in 0...QTD_INI){
			_inimigos[i].updateEm();
			FlxG.collide(_inimigos[i], _blocks);
			FlxG.collide(_inimigos[i], _player);
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

		if(FlxG.mouse.justPressed && _player.municao > 0){
			_player.tirao(FlxG.mouse.screenX, FlxG.mouse.screenY);
			FlxG.log.add("PIUPIU");
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
