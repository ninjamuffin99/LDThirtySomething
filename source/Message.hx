package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTextField;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author 
 */
class Message extends FlxSpriteGroup 
{
	private var _graphic:FlxSprite;
	private var _date:FlxText;
	private var _text:FlxText;
	
	public function new(X:Int, Y:Int, date:String, text:String) 
	{
		super(X, Y);
		
		_graphic = new FlxSprite(0, 0);
		_graphic.makeGraphic(16, 16);
		add(_graphic);
		
		_date = new FlxText(0, 17, 0, date, 9);
		_date.color = FlxColor.BLACK;
		add(_date);
		
		_text = new FlxText( -64, -16, 128, text, 8);
		_text.color = FlxColor.BLACK;
		add(_text);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		_text.visible = FlxG.overlap(PlayState._player, _graphic);
		super.update(elapsed);
	}
	
}