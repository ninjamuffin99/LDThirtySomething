package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.addons.tile.FlxTilemapExt;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import openfl.display.BlendMode;

class PlayState extends FlxState
{
	public static var _player:Player;
	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	private var newCam:FlxCamera;
	
	private var _screen:FlxSprite;
	private var _screenSelect:FlxSprite;
	private var _selectPosition:Int = 0;
	private var _phone:FlxSprite;
	
	private var _menu = [];
	private var _menuArray:Array<String>;
	private var _menuText:FlxText;
	
	private var _grpMessages:FlxTypedGroup<Message>;
	private var _warning:Warning;
	private var _warned:Bool = false;
	
	private var _battery:Float = 0.06;
	private var _batteryText:FlxText;
	private var _batteryBar:FlxBar;
	private var _batteryTimer:Float = 60;
	private var TopBar:FlxSprite;
	
	private var date:Date = Date.now();
	private var clock:FlxText;
	private var _done:Bool = false;
	private var _connect:FlxText;
	
	private var _scanline:FlxSprite;
	private var _started:Bool;
	private var _lighting:FlxSprite;
	
	
	override public function create():Void
	{
		FlxG.sound.playMusic("assets/music/757870_Denwa-wo-Kakete-.mp3");
		FlxG.mouse.visible = false;
		
		_phone = new FlxSprite(0, 0);
		_phone.loadGraphic("assets/images/phone.png", false, 260, 480);
		
		
		_screen = new FlxSprite(0, 10);
		_screen.makeGraphic(Std.int(FlxG.width * 0.90), Std.int(FlxG.height * 0.4), FlxColor.GRAY);
		_screen.screenCenter(X);
		
		
		
		createTilemap();
		add(_screen);
		//createPlayer();
		_player = new Player(FlxG.width + 20, 50);
		add(_player);
		
		_grpMessages = new FlxTypedGroup<Message>();
		add(_grpMessages);
		
		_scanline = new FlxSprite(0, 0);
		_scanline.loadGraphic("assets/images/scanline.png", false, 320, 240);
		_scanline.scrollFactor.x = _scanline.scrollFactor.y = 0;
		_scanline.blend = BlendMode.OVERLAY;
		_scanline.alpha = 0.1;
		
		createScreen();
		createMenu();
		
		add(_scanline);
		
		add(_phone);
		
		_lighting = new FlxSprite(0, 0);
		_lighting.loadGraphic("assets/images/lighting.png", true, 260, 480);
		_lighting.animation.add("on", [0, 1, 2, 2, 1], 7);
		_lighting.animation.play("on");
		_lighting.alpha = 0.9;
		_lighting.blend = BlendMode.MULTIPLY;
		add(_lighting);
		
		_started = false;
		super.create();
	}
	
	private function createTilemap():Void
	{
		_map = new FlxOgmoLoader("assets/data/BigLevel.oel");
		_mWalls = _map.loadTilemap("assets/images/tiles.png", 16, 16, "walls");
		_mWalls.follow(newCam);
		_mWalls.setTileProperties(1, FlxObject.NONE);
		_mWalls.setTileProperties(2, FlxObject.ANY);
		add(_mWalls);
	}
	
	private function createPlayer():Void
	{
		_map.loadEntities(placeEntities, "entities");
		
		newCam = new FlxCamera(Std.int(_screen.x), Std.int(_screen.y + TopBar.height), Std.int(_screen.width/1.5), Std.int((_screen.height/1.5) - TopBar.height), 1.5);
		newCam.follow(_player);
		newCam.setScrollBoundsRect(FlxG.width, 0, 2560, 1200);
		FlxG.cameras.add(newCam);
		newCam.height = 1;
		FlxTween.tween(newCam, {width: newCam.width + 4, height:119, x:newCam.x - 1}, 1);
		
		
		FlxG.collide(_player, _phone);
	}
	
	private function createScreen():Void
	{
		
		
		TopBar = new FlxSprite(0, _screen.y);
		TopBar.makeGraphic(Std.int(_screen.width), Std.int(29 - _screen.y), FlxColor.BLACK);
		TopBar.screenCenter(X);
		add(TopBar);
		
		_batteryText = new FlxText(210, 15, 0, _battery * 100 + "%", 7);
		_batteryBar = new FlxBar(230, 15, LEFT_TO_RIGHT, 14, 9, this, "_battery", 0, 0.5);
		
		var _signal:FlxText;
		_signal = new FlxText(25, 15, 0, "...", 7);
		add(_signal);
		
		_screenSelect = new FlxSprite(0, 30);
		_screenSelect.makeGraphic(Std.int(_screen.width), Std.int(_screen.height * 0.20), FlxColor.BLUE);
		_screenSelect.screenCenter(X);
		
		clock = new FlxText(0, 12, 0, date.getHours() + ":" + date.getMinutes(), 13); 
		clock.screenCenter(X);
		
		
		add(_screenSelect);
		
		createClock();
	}
	
	private function createClock():Void
	{
		
		add(_batteryText);
		add(_batteryBar);
		add(clock);
	}
	
	private function createMenu():Void
	{
		_menuArray = 
		[
			"Placeholder", 
			"Title", 
			"BEGIN",
			"Options"
		];
		
		
		
		for (i in 0..._menuArray.length)
		{
			_menu[i] = new FlxText(25, 30 + (_screenSelect.height * i), 0, _menuArray[i], 15);
			add(_menu[i]);
			_menu[i].color = FlxColor.BLACK;
		}
		
		
	}

	override public function update(elapsed:Float):Void
	{
		
		_batteryTimer -= FlxG.elapsed;
		if (_batteryTimer <= 0)
		{
			_battery -= 0.01;
			_batteryTimer = FlxG.random.float(45, 110);
		}
		
		if (_battery <= 0 && !_done)
		{
			_done = true;
			endGame();
		}
		
		if (FlxG.keys.justPressed.F)
			_battery -= 0.01;
		
		controls();
		
		updateText();
		
		super.update(elapsed);
		
		FlxG.collide(_player, _mWalls);
		
	}
	
	private function controls():Void
	{
		var _up:Bool = false;
		var _down:Bool = false;
		
		_up = FlxG.keys.justPressed.UP;
		_down = FlxG.keys.justPressed.DOWN;
		
		if (!_started)
		{
			if (FlxG.keys.justPressed.SPACE && _selectPosition == 2)
			{
				FlxTween.tween(FlxG.camera, {zoom:1.05, y: 10});
				_started = true;
				_screenSelect.visible = false;
				createPlayer();
			}
			
			if (_up && _down)
			{
				_up = _down = false;
			}
			
			if (_up)
			{
				FlxG.sound.play("assets/sounds/up.mp3");
				_selectPosition -= 1;
			}
			if (_down)
			{
				FlxG.sound.play("assets/sounds/down.mp3");
				_selectPosition += 1;
			}
			
			if (_selectPosition < 0)
			{
				_selectPosition = 3;
			}
			if (_selectPosition > 3)
			{
				_selectPosition = 0;
			}
		}
		
		_screenSelect.y = (_screenSelect.height * _selectPosition) + 30;
		
	}
	
	private function updateText():Void
	{
		date = Date.now();
		if (date.getMinutes() < 10)
		{
			clock.text = date.getHours() + ":0" + date.getMinutes();
		}
		else
		{
			clock.text = date.getHours() + ":" + date.getMinutes();
		}
		
		_battery = FlxMath.roundDecimal(_battery, 2);
		_batteryText.text = _battery * 100 +"%";
		
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		if (entityName == "player")
		{
			_player.x = x;
			_player.y = y;
		}
		else if (entityName == "text")
		{
			_grpMessages.add(new Message(x, y, entityData.get("date"), entityData.get("message")));
			
		}
		
	}
	
	private function endGame():Void
	{
		TopBar.visible = false;
		_screen.visible = false;
		_screenSelect.visible = false;
		_batteryBar.visible = false;
		_batteryText.visible = false;
		clock.visible = false;
		
		newCam.visible = false;
		_mWalls.visible = false;
		_menuText.visible = false;
		
		_connect = new FlxText(_screen.x + 20, _screen.y + 30, 0, "CONNECT TO POWER", 10);
		add(_connect);
	}
}