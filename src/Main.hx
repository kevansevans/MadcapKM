package;

import enums.ItemType;
import hxd.App;

/**
 * ...
 * @author Kaelan
 */
class Main extends App
{
	
	static function main() 
	{
		new Main();
	}
	
	public function new()
	{
		super();
	}
	
	override function init():Void 
	{
		super.init();
		
		Game.LunaticInit(s2d);
	}
	
	override function update(dt:Float):Void 
	{
		super.update(dt);
		
		
	}
}