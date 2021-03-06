package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author 
 */
class Player extends FlxSprite 
{
	
	public var speed:Float = 100;
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		loadGraphic("assets/images/gameplayer.png", true, 16, 16);
		
		setFacingFlip(FlxObject.LEFT, true, false);
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.UP, false, false);
		setFacingFlip(FlxObject.DOWN, false, true);
		
		animation.add("walkud", [0, 0, 1, 2, 2, 1], 6, false);
		animation.add("walklr", [3, 3, 4, 5, 5, 4], 6, false);
		
		drag.x = drag.y = 1500;
		setSize(8, 14);
		offset.set(4, 2);
		
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
				facing = FlxObject.UP;
			}
			else if (_down)
			{
				mA = 90;
				if (_left)
					mA += 45;
				else if (_right)
					mA -= 45;
				facing = FlxObject.DOWN;
			}
			else if (_left)
			{
				facing = FlxObject.LEFT;
				mA = 180;
			}
			else if (_right)
			{
				facing = FlxObject.RIGHT;
				mA = 0;
			}
			velocity.set(speed, 0);
			velocity.rotate(FlxPoint.weak(0, 0), mA);
			
			
			if ((velocity.x != 0 || velocity.y != 0) && touching == FlxObject.NONE)
			{
				switch(facing)
				{
					case FlxObject.LEFT, FlxObject.RIGHT:
						animation.play("walklr");
					case FlxObject.UP, FlxObject.DOWN:
						animation.play("walkud");
				}
			}
			
		}
	}
	
}