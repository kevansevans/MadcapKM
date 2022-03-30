package actors;
import graphics.SpriteSet;

/**
 * ...
 * @author Kaelan
 */
@:publicFields @:structInit
class MonsterType
{
	var name:String;
	var size:Int;
	var framesPerDir:Int;
	var hp:Int;
	var points:Int;
	var sprName:String;
	var spr:SpriteSet = null;
	var flags:Int = 0;
	var anims:Array<Array<Int>> = [[]];
}
class Monster 
{
	public static var kidSpr:Int;
	
	public static function init()
	{
		trace("Hey! I still have monsters that need defining!");
		
		for (monster in monsType)
		{
			monster.spr = null;
		}
		
		#if debug
		trace("Hey! This is where we load in the player sprites!");
		#end
		
		kidSpr = 0;
	}
	
	public static var monsType:Array<MonsterType> =
	[
		{
			name : "Null",
			size : 0,
			framesPerDir : 0,
			hp : 0,
			points : 0,
			sprName : ""
		},
	];
	
}