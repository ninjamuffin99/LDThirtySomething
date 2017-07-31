package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/data/BigLevel.oel", __ASSET__assets_data_biglevel_oel);
		type.set ("assets/data/BigLevel.oel", AssetType.TEXT);
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/data/Level.oep", __ASSET__assets_data_level_oep);
		type.set ("assets/data/Level.oep", AssetType.TEXT);
		className.set ("assets/images/gameplayer.png", __ASSET__assets_images_gameplayer_png);
		type.set ("assets/images/gameplayer.png", AssetType.IMAGE);
		className.set ("assets/images/gameplayer.txt", __ASSET__assets_images_gameplayer_txt);
		type.set ("assets/images/gameplayer.txt", AssetType.TEXT);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/map_concept.0001.png", __ASSET__assets_images_map_concept_0001_png);
		type.set ("assets/images/map_concept.0001.png", AssetType.IMAGE);
		className.set ("assets/images/phone.png", __ASSET__assets_images_phone_png);
		type.set ("assets/images/phone.png", AssetType.IMAGE);
		className.set ("assets/images/scanline.png", __ASSET__assets_images_scanline_png);
		type.set ("assets/images/scanline.png", AssetType.IMAGE);
		className.set ("assets/images/scanline1px.png", __ASSET__assets_images_scanline1px_png);
		type.set ("assets/images/scanline1px.png", AssetType.IMAGE);
		className.set ("assets/images/tiles.png", __ASSET__assets_images_tiles_png);
		type.set ("assets/images/tiles.png", AssetType.IMAGE);
		className.set ("assets/images/tiles_placeholder.png", __ASSET__assets_images_tiles_placeholder_png);
		type.set ("assets/images/tiles_placeholder.png", AssetType.IMAGE);
		className.set ("assets/music/757870_Denwa-wo-Kakete-.mp3", __ASSET__assets_music_757870_denwa_wo_kakete__mp3);
		type.set ("assets/music/757870_Denwa-wo-Kakete-.mp3", AssetType.MUSIC);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/down.mp3", __ASSET__assets_sounds_down_mp3);
		type.set ("assets/sounds/down.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/down.wav", __ASSET__assets_sounds_down_wav);
		type.set ("assets/sounds/down.wav", AssetType.SOUND);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/tones/0.mp3", __ASSET__assets_sounds_tones_0_mp3);
		type.set ("assets/sounds/tones/0.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/tones/1.mp3", __ASSET__assets_sounds_tones_1_mp3);
		type.set ("assets/sounds/tones/1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/tones/2.mp3", __ASSET__assets_sounds_tones_2_mp3);
		type.set ("assets/sounds/tones/2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/tones/3.mp3", __ASSET__assets_sounds_tones_3_mp3);
		type.set ("assets/sounds/tones/3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/tones/4.mp3", __ASSET__assets_sounds_tones_4_mp3);
		type.set ("assets/sounds/tones/4.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/tones/5.mp3", __ASSET__assets_sounds_tones_5_mp3);
		type.set ("assets/sounds/tones/5.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/tones/6.mp3", __ASSET__assets_sounds_tones_6_mp3);
		type.set ("assets/sounds/tones/6.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/tones/7.mp3", __ASSET__assets_sounds_tones_7_mp3);
		type.set ("assets/sounds/tones/7.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/tones/8.mp3", __ASSET__assets_sounds_tones_8_mp3);
		type.set ("assets/sounds/tones/8.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/tones/9.mp3", __ASSET__assets_sounds_tones_9_mp3);
		type.set ("assets/sounds/tones/9.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/tones/DFTM.mp3", __ASSET__assets_sounds_tones_dftm_mp3);
		type.set ("assets/sounds/tones/DFTM.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/tones/hashtag.mp3", __ASSET__assets_sounds_tones_hashtag_mp3);
		type.set ("assets/sounds/tones/hashtag.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/tones/star.mp3", __ASSET__assets_sounds_tones_star_mp3);
		type.set ("assets/sounds/tones/star.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/up.mp3", __ASSET__assets_sounds_up_mp3);
		type.set ("assets/sounds/up.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/up.wav", __ASSET__assets_sounds_up_wav);
		type.set ("assets/sounds/up.wav", AssetType.SOUND);
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/BigLevel.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Level.oep";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/gameplayer.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/gameplayer.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/map_concept.0001.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/phone.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/scanline.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/scanline1px.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tiles.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tiles_placeholder.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/757870_Denwa-wo-Kakete-.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/down.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/down.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/tones/0.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/tones/1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/tones/2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/tones/3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/tones/4.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/tones/5.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/tones/6.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/tones/7.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/tones/8.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/tones/9.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/tones/DFTM.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/tones/hashtag.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/tones/star.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/up.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/up.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/beep.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/flixel.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/images/logo/default.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/BigLevel.oel", __ASSET__assets_data_biglevel_oel);
		type.set ("assets/data/BigLevel.oel", AssetType.TEXT);
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/data/Level.oep", __ASSET__assets_data_level_oep);
		type.set ("assets/data/Level.oep", AssetType.TEXT);
		
		className.set ("assets/images/gameplayer.png", __ASSET__assets_images_gameplayer_png);
		type.set ("assets/images/gameplayer.png", AssetType.IMAGE);
		
		className.set ("assets/images/gameplayer.txt", __ASSET__assets_images_gameplayer_txt);
		type.set ("assets/images/gameplayer.txt", AssetType.TEXT);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/map_concept.0001.png", __ASSET__assets_images_map_concept_0001_png);
		type.set ("assets/images/map_concept.0001.png", AssetType.IMAGE);
		
		className.set ("assets/images/phone.png", __ASSET__assets_images_phone_png);
		type.set ("assets/images/phone.png", AssetType.IMAGE);
		
		className.set ("assets/images/scanline.png", __ASSET__assets_images_scanline_png);
		type.set ("assets/images/scanline.png", AssetType.IMAGE);
		
		className.set ("assets/images/scanline1px.png", __ASSET__assets_images_scanline1px_png);
		type.set ("assets/images/scanline1px.png", AssetType.IMAGE);
		
		className.set ("assets/images/tiles.png", __ASSET__assets_images_tiles_png);
		type.set ("assets/images/tiles.png", AssetType.IMAGE);
		
		className.set ("assets/images/tiles_placeholder.png", __ASSET__assets_images_tiles_placeholder_png);
		type.set ("assets/images/tiles_placeholder.png", AssetType.IMAGE);
		
		className.set ("assets/music/757870_Denwa-wo-Kakete-.mp3", __ASSET__assets_music_757870_denwa_wo_kakete__mp3);
		type.set ("assets/music/757870_Denwa-wo-Kakete-.mp3", AssetType.MUSIC);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/down.mp3", __ASSET__assets_sounds_down_mp3);
		type.set ("assets/sounds/down.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/down.wav", __ASSET__assets_sounds_down_wav);
		type.set ("assets/sounds/down.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/tones/0.mp3", __ASSET__assets_sounds_tones_0_mp3);
		type.set ("assets/sounds/tones/0.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/tones/1.mp3", __ASSET__assets_sounds_tones_1_mp3);
		type.set ("assets/sounds/tones/1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/tones/2.mp3", __ASSET__assets_sounds_tones_2_mp3);
		type.set ("assets/sounds/tones/2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/tones/3.mp3", __ASSET__assets_sounds_tones_3_mp3);
		type.set ("assets/sounds/tones/3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/tones/4.mp3", __ASSET__assets_sounds_tones_4_mp3);
		type.set ("assets/sounds/tones/4.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/tones/5.mp3", __ASSET__assets_sounds_tones_5_mp3);
		type.set ("assets/sounds/tones/5.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/tones/6.mp3", __ASSET__assets_sounds_tones_6_mp3);
		type.set ("assets/sounds/tones/6.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/tones/7.mp3", __ASSET__assets_sounds_tones_7_mp3);
		type.set ("assets/sounds/tones/7.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/tones/8.mp3", __ASSET__assets_sounds_tones_8_mp3);
		type.set ("assets/sounds/tones/8.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/tones/9.mp3", __ASSET__assets_sounds_tones_9_mp3);
		type.set ("assets/sounds/tones/9.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/tones/DFTM.mp3", __ASSET__assets_sounds_tones_dftm_mp3);
		type.set ("assets/sounds/tones/DFTM.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/tones/hashtag.mp3", __ASSET__assets_sounds_tones_hashtag_mp3);
		type.set ("assets/sounds/tones/hashtag.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/tones/star.mp3", __ASSET__assets_sounds_tones_star_mp3);
		type.set ("assets/sounds/tones/star.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/up.mp3", __ASSET__assets_sounds_up_mp3);
		type.set ("assets/sounds/up.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/up.wav", __ASSET__assets_sounds_up_wav);
		type.set ("assets/sounds/up.wav", AssetType.SOUND);
		
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_biglevel_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_level_oep extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_gameplayer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_gameplayer_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_map_concept_0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_phone_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_scanline_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_scanline1px_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tiles_placeholder_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_757870_denwa_wo_kakete__mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_down_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_down_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tones_0_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tones_1_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tones_2_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tones_3_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tones_4_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tones_5_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tones_6_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tones_7_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tones_8_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tones_9_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tones_dftm_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tones_hashtag_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tones_star_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_up_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_up_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5



































@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 




#else



#if (windows || mac || linux || cpp)


@:file("assets/data/BigLevel.oel") #if display private #end class __ASSET__assets_data_biglevel_oel extends lime.utils.Bytes {}
@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.Bytes {}
@:file("assets/data/Level.oep") #if display private #end class __ASSET__assets_data_level_oep extends lime.utils.Bytes {}
@:image("assets/images/gameplayer.png") #if display private #end class __ASSET__assets_images_gameplayer_png extends lime.graphics.Image {}
@:file("assets/images/gameplayer.txt") #if display private #end class __ASSET__assets_images_gameplayer_txt extends lime.utils.Bytes {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.Bytes {}
@:image("assets/images/map_concept.0001.png") #if display private #end class __ASSET__assets_images_map_concept_0001_png extends lime.graphics.Image {}
@:image("assets/images/phone.png") #if display private #end class __ASSET__assets_images_phone_png extends lime.graphics.Image {}
@:image("assets/images/scanline.png") #if display private #end class __ASSET__assets_images_scanline_png extends lime.graphics.Image {}
@:image("assets/images/scanline1px.png") #if display private #end class __ASSET__assets_images_scanline1px_png extends lime.graphics.Image {}
@:image("assets/images/tiles.png") #if display private #end class __ASSET__assets_images_tiles_png extends lime.graphics.Image {}
@:image("assets/images/tiles_placeholder.png") #if display private #end class __ASSET__assets_images_tiles_placeholder_png extends lime.graphics.Image {}
@:file("assets/music/757870_Denwa-wo-Kakete-.mp3") #if display private #end class __ASSET__assets_music_757870_denwa_wo_kakete__mp3 extends lime.utils.Bytes {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.Bytes {}
@:file("assets/sounds/down.mp3") #if display private #end class __ASSET__assets_sounds_down_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/down.wav") #if display private #end class __ASSET__assets_sounds_down_wav extends lime.utils.Bytes {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.Bytes {}
@:file("assets/sounds/tones/0.mp3") #if display private #end class __ASSET__assets_sounds_tones_0_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/tones/1.mp3") #if display private #end class __ASSET__assets_sounds_tones_1_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/tones/2.mp3") #if display private #end class __ASSET__assets_sounds_tones_2_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/tones/3.mp3") #if display private #end class __ASSET__assets_sounds_tones_3_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/tones/4.mp3") #if display private #end class __ASSET__assets_sounds_tones_4_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/tones/5.mp3") #if display private #end class __ASSET__assets_sounds_tones_5_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/tones/6.mp3") #if display private #end class __ASSET__assets_sounds_tones_6_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/tones/7.mp3") #if display private #end class __ASSET__assets_sounds_tones_7_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/tones/8.mp3") #if display private #end class __ASSET__assets_sounds_tones_8_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/tones/9.mp3") #if display private #end class __ASSET__assets_sounds_tones_9_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/tones/DFTM.mp3") #if display private #end class __ASSET__assets_sounds_tones_dftm_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/tones/hashtag.mp3") #if display private #end class __ASSET__assets_sounds_tones_hashtag_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/tones/star.mp3") #if display private #end class __ASSET__assets_sounds_tones_star_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/up.mp3") #if display private #end class __ASSET__assets_sounds_up_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/up.wav") #if display private #end class __ASSET__assets_sounds_up_wav extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/sounds/beep.ogg") #if display private #end class __ASSET__flixel_sounds_beep_ogg extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/sounds/flixel.ogg") #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end