package;

import flash.display3D.textures.Texture;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author 
 */
class Warning extends FlxSpriteGroup 
{
	private var _bg:FlxSprite;
	private var _outline:FlxSprite;
	private var _text:FlxText;
	public function new(X:Float = 0, Y:Float = 0) 
	{
		super(X, Y);
		
		
		_outline = new FlxSprite(_bg.x - 2, _bg.y - 2);
		_outline.makeGraphic(Std.int(_bg.width + 4), Std.int(_bg.height + 4), FlxColor.BLACK);
		//add(_outline);
		
		_bg = new FlxSprite(0, 0);
		_bg.makeGraphic(100, 100, FlxColor.GRAY);
		add(_bg);
		
		
		_text = new FlxText(20, 20, 60, "WARNING!! Battery at 5%! Connect to a charger!", 9);
		_text.color = FlxColor.BLACK;
		add(_text);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	
}