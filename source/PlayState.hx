package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var _player:Player;
	
	private var _screen:FlxSprite;
	private var _screenSelect:FlxSprite;
	private var _selectPosition:Int = 0;
	private var _phone:FlxSprite;
	
	private var _menu = [];
	private var _menuArray:Array<String>;
	private var _menuText:FlxText;
	
	private var _battery:Float = 0.06;
	private var _batteryText:FlxText;
	private var _batteryBar:FlxBar;
	private var _batteryTimer:Float = 60;
	
	private var date:Date = Date.now();
	private var clock:FlxText;
	
	override public function create():Void
	{
		FlxG.sound.playMusic("assets/music/757870_Denwa-wo-Kakete-.mp3");
		FlxG.mouse.visible = false;
		
		_phone = new FlxSprite(0, 0);
		_phone.loadGraphic("assets/images/phone.png", false, 260, 480);
		
		
		_screen = new FlxSprite(0, 10);
		_screen.makeGraphic(Std.int(FlxG.width * 0.90), Std.int(FlxG.height * 0.4), FlxColor.GRAY);
		_screen.screenCenter(X);
		
		add(_screen);
		
		//createPlayer();
		_player = new Player(FlxG.width + 20, 50);
		add(_player);
		createScreen();
		createMenu();
		
		add(_phone);
		super.create();
	}
	
	private function createPlayer():Void
	{
		
		
		var newCam:FlxCamera = new FlxCamera(Std.int(_screen.x), Std.int(_screen.y), Std.int(_screen.width/2), Std.int(_screen.height/2), 2);
		newCam.follow(_player, SCREEN_BY_SCREEN);
		newCam.setScrollBoundsRect(FlxG.width, 0, 1000, 1000);
		FlxG.cameras.add(newCam);
		
		FlxG.collide(_player, _phone);
	}
	
	private function createScreen():Void
	{
		
		var TopBar:FlxSprite;
		TopBar = new FlxSprite(0, _screen.y);
		TopBar.makeGraphic(Std.int(_screen.width), Std.int(29 - _screen.y), FlxColor.BLACK);
		TopBar.screenCenter(X);
		
		_batteryText = new FlxText(210, 15, 0, _battery * 100 + "%", 7);
		_batteryBar = new FlxBar(230, 15, LEFT_TO_RIGHT, 14, 9, this, "_battery", 0, 0.5);
		
		_screenSelect = new FlxSprite(0, 30);
		_screenSelect.makeGraphic(Std.int(_screen.width), Std.int(_screen.height * 0.20), FlxColor.BLUE);
		_screenSelect.screenCenter(X);
		
		clock = new FlxText(0, 12, 0, date.getHours() + ":" + date.getMinutes(), 13); 
		clock.screenCenter(X);
		
		add(TopBar);
		add(_screenSelect);
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
		
		
		controls();
		
		updateText();
		
		super.update(elapsed);
		
	}
	
	private function controls():Void
	{
		var _up:Bool = false;
		var _down:Bool = false;
		
		_up = FlxG.keys.justPressed.UP;
		_down = FlxG.keys.justPressed.DOWN;
		
		if (FlxG.keys.justPressed.SPACE && _selectPosition == 2)
		{
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
}