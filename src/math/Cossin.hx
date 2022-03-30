package math;

import actors.Player;

/**
 * ...
 * @author Kaelan
 */
class Cossin 
{
	static inline var DEGREES:Int = 256;
	
	static var costab:Array<Int> = new Array();
	static var sintab:Array<Int> = new Array();
	
	public static function Init()
	{
		for (i in 0...DEGREES)
		{
			costab[i] = Std.int(Math.cos(i * 3.14159 * 2 / DEGREES) * Player.FIXAMT);
			sintab[i] = Std.int(Math.sin(i * 3.14159 * 2 / DEGREES) * Player.FIXAMT);
		}
	}
	
	public static function Cosine(_angle:Int):Int
	{
		return costab[_angle];
	}
	
	public static function Sine(_angle:Int):Int
	{
		return sintab[_angle];
	}
	
	public static function Dampen(_value:Int, _amt:Int):Int
	{
		#if debug
		trace("Hey! Pointers don't exist in Haxe, make sure the _value input gets set correctly!");
		#end
		
		var value = _value;
		if (value > 0)
		{
			value -= _amt;
			if (value < 0) value = 0;
		}
		if (value < 0)
		{
			value += _amt;
			if (value > 0) value = 0;
		}
		
		return value;
	}
	
	public static function Clamp(_value:Int, _amt:Int)
	{
		#if debug
		trace("Hey! Pointers don't exist in Haxe, make sure the _value input gets set correctly!");
		#end
		
		var value = _value;
		if (value > _amt) value = _amt;
		if (value < -_amt) value = -_amt;
		return value;
	}
	
}