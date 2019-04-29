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
	static inline var QTD_INI:Int = 5;
    
	var _correio:Correio; // vai ficar preso em Curitiba
	var _map:TiledMap;
	var _blocks:FlxTilemap;
	var _city:FlxTilemap;
	public var _player:Carro;
	var _inimigos:Array<Carro> = [];
	var _bullets:FlxTypedGroup<Bala>;
	var _enemyBullets:FlxTypedGroup<Bala>;
	var _btnBack:FlxButton;
	var _enemyPath:Array<Array<FlxPoint>> = [];
	var _hud:HUD;

	override public function create():Void{
		_hud = new HUD();
		add(_hud);
		_correio = new Correio();
		FlxG.cameras.bgColor = 0xff000000;
		_map = new TiledMap(AssetPaths.trabalho__tmx);
		_blocks = new FlxTilemap();
		_blocks.loadMapFromArray(cast(_map.getLayer("blocks"), TiledTileLayer).tileArray, _map.width, _map.height, AssetPaths.city__png, _map.tileWidth, _map.tileHeight, FlxTilemapAutoTiling.OFF, 1, 0, 2);
		//_blocks.follow();
		_blocks.setTileProperties(36, FlxObject.NONE);
		_blocks.setTileProperties(18, FlxObject.ANY);
		add(_blocks);

		_bullets = new FlxTypedGroup<Bala>(200);

		_player = new Carro(AssetPaths.red_vehicle__png, _bullets, 1, FlxG.random.int(10, 50), 100);

		_player.x = 24 * 23;
		_player.y = 24 * 17;
		add(_player);
		for(i in 0...20){
            var s = new Bala(_player.dano);
            s.kill();
            _bullets.add(s);
        }
		var pos:String = "43,129
41,474
311,480
307,550
515,550
506,350
333,339
328,220
196,219
445,225
445,140";
		var pathXY:Array<String> = pos.split('\n');
		var path:Array<FlxPoint> = [];
		for(point in pathXY){
			var pt:Array<String> = point.split(',');
			var _pt:FlxPoint = new FlxPoint(Std.parseInt(pt[0]), Std.parseInt(pt[1]));
			path.push(_pt);
		}

		_enemyBullets = new FlxTypedGroup<Bala>(1000);
		for( i in 0...QTD_INI ){
			_enemyPath.push(path);
			
			var _car:Carro = new Carro(AssetPaths.yellow_vehicle__png, _enemyBullets, 0, 35, 100);
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

		for(i in 0...100){
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
		add(_correio);
		super.create();

	}

	override public function update(elapsed:Float):Void{
		_player.tempo += elapsed;
		var al:Int = 0;
		for(i in 0...QTD_INI){
			if(_inimigos[i].alive){
				al += 1;
				_inimigos[i]._counter -= elapsed;
				if(_inimigos[i]._counter <= 0){
					if(_inimigos[i].municao == 1)
						_inimigos[i].municao = 20;
					_inimigos[i]._counter = _inimigos[i].delay;
					_inimigos[i].tirao(Std.int(_player.x), Std.int(_player.y));
				}
			}
			
		}
		if(al == 0){
			FlxG.switchState(new WinState(_player.tempo));
		}
		FlxG.collide(_player, _blocks, onCollideBlock);
		//FlxG.overlap(_blocks, _bullets, onOverlapBlock);
		FlxG.collide(_blocks, _bullets, onOverlapBlock);
		FlxG.collide(_blocks, _enemyBullets, onOverlapBlock);
		FlxG.overlap(_enemyBullets, _player, onOverlapDamages);

		for(i in 0...QTD_INI){
			_inimigos[i].updateEm();
			FlxG.collide(_inimigos[i], _blocks, onCollideBlock);
			FlxG.collide(_inimigos[i], _player, onCollide);
			FlxG.collide(_bullets, _inimigos[i], onOverlapDamages);
		}

		if(_player.municao == 0){
            _player._counter -= elapsed;
        }

        if(_player._counter <= 0){
            _player.municao = 20;
            _player._counter = _player.delay;
        }

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
		if(FlxG.mouse.justPressed && _player.municao > 0){
			_player.tirao(FlxG.mouse.x, FlxG.mouse.y);
		}
		super.update(elapsed);

	}

	function playerReset():Void{
		_player.x = 24 * 23;
		_player.y = 24 * 9;
		_player.municao = 20;
		_player.health = 100;
		_player.velocity.x = _player.velocity.y = 0;
		_player.acceleration.x = _player.acceleration.y = 0;
		_player.animation.play("walkU");		
	}

	function goBack():Void{
        FlxG.switchState(new MeuMenuState());
    }

	function onOverlapBlock(a:FlxSprite, b:FlxSprite):Void{
		b.kill();
	}

	function onCollide(a:Entidade, b:Entidade):Void{
		var m:Mensagem = new Mensagem();
		m.from = a;
		m.to = b;
		m.op = Mensagem.OP_DANO;
		m.data = 1;
		_correio.send(m);
		m.from = b;
		m.to = a;
		m.op = Mensagem.OP_DANO;
		m.data = 1;
		_correio.send(m);
	}

	function onCollideBlock(a:FlxSprite, b:Entidade):Void{
		if(a.angle > 0 && a.angle <= 90){
			a.x -= 10;
			a.y += 10;
		}
        if(a.angle > 90 && a.angle <= 180){
			a.x -= 10;
			a.y -= 10;
		}
        if(a.angle > -90 && a.angle <= -180){
			a.x += 10;
			a.y -= 10;
		}
        if(a.angle > 0 && a.angle <= -90){
			a.x += 10;
			a.y += 10;
		}

		var m:Mensagem = new Mensagem();
		m.from = cast b;
		m.to = cast a;
		m.op = Mensagem.OP_DANO;
		m.data = 1;
		_correio.send(m);
	}

	function onOverlapDamages(a:Bala, b:Entidade):Void{
		var m:Mensagem = new Mensagem();
		a.kill();
		m.from = cast a;
		m.to = b;
		m.op = Mensagem.OP_DANO;
		m.data = a.dano;
		_correio.send(m);
	}
}
