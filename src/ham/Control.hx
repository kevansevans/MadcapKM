package ham ;

/**
 * ...
 * @author Kaelan
 */
class Control 
{
	static var lastScanCode:Int;
	static var keyState:Int;
	static var keyTap:Int;
	static var arrowState:Int;
	static var arrowTap:Int;
	static var oldJoy:Int;
	
	public static function Init()
	{
		lastScanCode = 0;
		keyState = 0;
		keyTap = 0;
		arrowState = 0;
		arrowTap = 0;
		oldJoy = 0;
		
		//some SDL joystick code here. Heaps interfaces with SDL for us
		trace('Hey! But double check here to make sure if this is important! ham/Control.cpp, line 38');
	}
	
}