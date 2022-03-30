package enums;

/**
 * @author Kaelan
 */
enum abstract Gear(Int) from Int to Int 
{
	var Heart:Int = 1;
	var Moon:Int = 1 << 1;
	var Lamp:Int = 1 << 2;
	var Soul:Int = 1 << 3;
	var Sun:Int = 1 << 4;
	var Wisdom:Int = 1 << 5;
	var Pointy:Int = 1 << 6;
	var Magnet:Int = 1 << 7;
	var Bouncy:Int = 1 << 7;
	var Compass:Int = 1 << 9;
	var Feather:Int = 1 << 10;
	var socks:Int = 1 << 11;
}