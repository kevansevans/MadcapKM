package levels ;

import levels.Map;
import levels.Terrain;

/**
 * ...
 * @author Kaelan
 */
class World 
{
	public static inline var MAX_MAPS:Int = 24;
	
	public var numMaps:Int;
	public var map:Array<Map>;
	public var terrain:Array<Terrain>;
	
	public function new() 
	{
		
	}
	
}