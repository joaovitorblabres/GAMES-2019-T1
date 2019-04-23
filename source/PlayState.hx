package;

import flixel.FlxState;
import flixel.*;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;

class PlayState extends FlxState{

	static inline var TILE_WIDTH:Int = 24;
	static inline var TILE_HEIGHT:Int = 24;
	static inline var MOVE_SPEED:Int = 5000;

	var _map:FlxTilemap;
	var _player:FlxSprite;
	var _btnBack:FlxButton;

	override public function create():Void{
		FlxG.cameras.bgColor = 0xff626b61;
		_map = new FlxTilemap();
		_map.loadMapFromCSV("assets/tracks/Road.csv", "assets/images/Road.png", TILE_WIDTH, TILE_HEIGHT, 0, 0);
		add(_map);

		_player = new FlxSprite(0, 0);
		_player.loadGraphic(AssetPaths.red_vehicle__png, true, 32, 32);
		_player.x = TILE_WIDTH * 23;
		_player.y = TILE_WIDTH * 9;
		_player.acceleration.x = _player.acceleration.y = 0;
		_player.scale.set(0.35, 0.35);
		_player.setFacingFlip(FlxObject.LEFT, true, false);
        _player.setFacingFlip(FlxObject.RIGHT, false, false);

        _player.animation.add("walkR", [5], 8);
        _player.animation.add("walkU", [3], 8);
        _player.animation.add("walkD", [7], 8);
        _player.facing = FlxObject.RIGHT;
		_player.animation.play("walkU");
		add(_player);

		_btnBack = new FlxButton(0, 0, "Voltar", goBack);
        _btnBack.x = (FlxG.width)-(_btnBack.width)-5;
        _btnBack.y = FlxG.height - _btnBack.height - 10;
		add(_btnBack);
		super.create();

	}

	override public function update(elapsed:Float):Void{
        if(FlxG.keys.pressed.D){
            _player.facing = FlxObject.RIGHT;
			if(_player.acceleration.x < 2)
				_player.acceleration.x += 0.3;
			
			if(_player.velocity.x < 0)
				_player.velocity.x += 1;
			else
				_player.velocity.x += 0.3;

			if(_player.velocity.x > 0)
            	_player.animation.play("walkR");
        }

        if(FlxG.keys.pressed.A){
			if(_player.velocity.x < 0)
            	_player.facing = FlxObject.LEFT;
            _player.animation.play("walkR");
			if(_player.acceleration.x > -2)
				_player.acceleration.x -= 0.3;
			
			if(_player.velocity.x > 0)
				_player.velocity.x -= 1;
			else
				_player.velocity.x -= 0.3;
        }

        if(FlxG.keys.pressed.W){
			if(_player.acceleration.y > -2)
				_player.acceleration.y -= 0.3;
			
			if(_player.velocity.y > 0)
				_player.velocity.y -= 1;
			else
				_player.velocity.y -= 0.3;

 			if(_player.velocity.y < 0)
            	_player.animation.play("walkU");
        }

        if(FlxG.keys.pressed.S){
			if(_player.acceleration.y < 2)
				_player.acceleration.y += 0.3;
			
			if(_player.velocity.y < 0)
				_player.velocity.y += 1;
			else
				_player.velocity.y += 0.3;

			if(_player.velocity.y > 0)
            	_player.animation.play("walkD");
        }

		if(_player.velocity.y > 0)
			_player.velocity.y -= 0.1;
		if(_player.velocity.y < 0)
			_player.velocity.y += 0.1;
		
		if(_player.velocity.x > 0)
			_player.velocity.x -= 0.1;
		if(_player.velocity.x < 0)
			_player.velocity.x += 0.1;
		
		_player.animation.stop();

		if(FlxG.keys.pressed.R){
            playerReset();
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
