package;


import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#elseif (winrt)
			rootPath = "./";
			#elseif (sys && windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end

		}

		Assets.defaultRootPath = rootPath;

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy37:assets%2Ftracks%2Fpathfinding_map.txty4:sizei13y4:typey4:TEXTy2:idR1y7:preloadtgoR0y31:assets%2Ftracks%2FRoad_path.txtR2i294R3R4R5R7R6tgoR0y28:assets%2Ftracks%2Fblocks.csvR2i1250R3R4R5R8R6tgoR0y26:assets%2Ftracks%2FRoad.csvR2i1711R3R4R5R9R6tgoR0y35:assets%2Fimages%2Fgreen_vehicle.pngR2i8114R3y5:IMAGER5R10R6tgoR0y26:assets%2Fimages%2Ftire.pngR2i39093R3R11R5R12R6tgoR0y35:assets%2Fimages%2Ftrack_license.txtR2i99R3R4R5R13R6tgoR0y36:assets%2Fimages%2Forange_vehicle.pngR2i7725R3R11R5R14R6tgoR0y33:assets%2Fimages%2Fcar_license.txtR2i529R3R4R5R15R6tgoR0y33:assets%2Fimages%2Fspritesheet.pngR2i72311R3R11R5R16R6tgoR0y26:assets%2Fimages%2Fcity.pngR2i14667R3R11R5R17R6tgoR0y34:assets%2Fimages%2Fspritesheet2.pngR2i74525R3R11R5R18R6tgoR0y33:assets%2Fimages%2Fred_vehicle.pngR2i4524R3R11R5R19R6tgoR0y26:assets%2Fimages%2FRoad.pngR2i983R3R11R5R20R6tgoR0y36:assets%2Fimages%2Fyellow_vehicle.pngR2i4513R3R11R5R21R6tgoR0y27:assets%2Fimages%2Fcity2.tsxR2i183R3R4R5R22R6tgoR0y34:assets%2Fimages%2Fblue_vehicle.pngR2i8013R3R11R5R23R6tgoR0y34:assets%2Fimages%2Fgrey_vehicle.pngR2i8403R3R11R5R24R6tgoR0y35:assets%2Fimages%2Fwhite_vehicle.pngR2i7060R3R11R5R25R6tgoR0y35:assets%2Fimages%2Fblack_vehicle.pngR2i8137R3R11R5R26R6tgoR0y30:assets%2Fimages%2Ftrabalho.tmxR2i2222R3R4R5R27R6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R28R6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R29R6tgoR0y34:assets%2Fdata%2Fdata-goes-here.txtR2zR3R4R5R30R6tgoR2i2114R3y5:MUSICR5y26:flixel%2Fsounds%2Fbeep.mp3y9:pathGroupaR32y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R31R5y28:flixel%2Fsounds%2Fflixel.mp3R33aR35y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3y5:SOUNDR5R34R33aR32R34hgoR2i33629R3R37R5R36R33aR35R36hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R38R39y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R11R5R44R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R11R5R45R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tracks_pathfinding_map_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tracks_road_path_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tracks_blocks_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tracks_road_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_green_vehicle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_tire_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_track_license_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_orange_vehicle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_car_license_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_spritesheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_city_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_spritesheet2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_red_vehicle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_road_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_yellow_vehicle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_city2_tsx extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_blue_vehicle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_grey_vehicle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_white_vehicle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_black_vehicle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_trabalho_tmx extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/tracks/pathfinding_map.txt") @:noCompletion #if display private #end class __ASSET__assets_tracks_pathfinding_map_txt extends haxe.io.Bytes {}
@:keep @:file("assets/tracks/Road_path.txt") @:noCompletion #if display private #end class __ASSET__assets_tracks_road_path_txt extends haxe.io.Bytes {}
@:keep @:file("assets/tracks/blocks.csv") @:noCompletion #if display private #end class __ASSET__assets_tracks_blocks_csv extends haxe.io.Bytes {}
@:keep @:file("assets/tracks/Road.csv") @:noCompletion #if display private #end class __ASSET__assets_tracks_road_csv extends haxe.io.Bytes {}
@:keep @:image("assets/images/green_vehicle.png") @:noCompletion #if display private #end class __ASSET__assets_images_green_vehicle_png extends lime.graphics.Image {}
@:keep @:image("assets/images/tire.png") @:noCompletion #if display private #end class __ASSET__assets_images_tire_png extends lime.graphics.Image {}
@:keep @:file("assets/images/track_license.txt") @:noCompletion #if display private #end class __ASSET__assets_images_track_license_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/orange_vehicle.png") @:noCompletion #if display private #end class __ASSET__assets_images_orange_vehicle_png extends lime.graphics.Image {}
@:keep @:file("assets/images/car_license.txt") @:noCompletion #if display private #end class __ASSET__assets_images_car_license_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/spritesheet.png") @:noCompletion #if display private #end class __ASSET__assets_images_spritesheet_png extends lime.graphics.Image {}
@:keep @:image("assets/images/city.png") @:noCompletion #if display private #end class __ASSET__assets_images_city_png extends lime.graphics.Image {}
@:keep @:image("assets/images/spritesheet2.png") @:noCompletion #if display private #end class __ASSET__assets_images_spritesheet2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/red_vehicle.png") @:noCompletion #if display private #end class __ASSET__assets_images_red_vehicle_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Road.png") @:noCompletion #if display private #end class __ASSET__assets_images_road_png extends lime.graphics.Image {}
@:keep @:image("assets/images/yellow_vehicle.png") @:noCompletion #if display private #end class __ASSET__assets_images_yellow_vehicle_png extends lime.graphics.Image {}
@:keep @:file("assets/images/city2.tsx") @:noCompletion #if display private #end class __ASSET__assets_images_city2_tsx extends haxe.io.Bytes {}
@:keep @:image("assets/images/blue_vehicle.png") @:noCompletion #if display private #end class __ASSET__assets_images_blue_vehicle_png extends lime.graphics.Image {}
@:keep @:image("assets/images/grey_vehicle.png") @:noCompletion #if display private #end class __ASSET__assets_images_grey_vehicle_png extends lime.graphics.Image {}
@:keep @:image("assets/images/white_vehicle.png") @:noCompletion #if display private #end class __ASSET__assets_images_white_vehicle_png extends lime.graphics.Image {}
@:keep @:image("assets/images/black_vehicle.png") @:noCompletion #if display private #end class __ASSET__assets_images_black_vehicle_png extends lime.graphics.Image {}
@:keep @:file("assets/images/trabalho.tmx") @:noCompletion #if display private #end class __ASSET__assets_images_trabalho_tmx extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("/home/tcc-jv/haxelib/flixel/4,6,1/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("/home/tcc-jv/haxelib/flixel/4,6,1/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("/home/tcc-jv/haxelib/flixel/4,6,1/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("/home/tcc-jv/haxelib/flixel/4,6,1/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("/home/tcc-jv/haxelib/flixel/4,6,1/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("/home/tcc-jv/haxelib/flixel/4,6,1/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
