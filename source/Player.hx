package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author 
 */
class Player extends FlxSprite 
{
	
	public var speed:Float = 200;
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		makeGraphic(16, 16);
		drag.x = drag.y = 1500;
	}
	
	override public function update(elapsed:Float):Void 
	{
		movement();
		super.update(elapsed);
	}
	
	private function movement():Void
	{
		var _up = FlxG.keys.anyPressed([UP, W]);
		var _down = FlxG.keys.anyPressed([DOWN, S]);
		var _left = FlxG.keys.anyPressed([LEFT, A]);
		var _right = FlxG.keys.anyPressed([RIGHT, D]);
		
		if (_up && _down)
			_up = _down = false;
		if (_left && _right)
			_left = _right = false;
		
		if (_up || _down || _left || _right)
		{
			var mA:Float = 0;
			
			if (_up)
			{
				mA = -90;
				if (_left)
					mA -= 45;
				else if (_right)
					mA += 45;
			}
			else if (_down)
			{
				mA = 90;
				if (_left)
					mA += 45;
				else if (_right)
					mA -= 45;
			}
			else if (_left)
				mA = 180;
			else if (_right)
				mA = 0;
			velocity.set(speed, 0);
			velocity.rotate(FlxPoint.weak(0, 0), mA);
		}
	}
	
}