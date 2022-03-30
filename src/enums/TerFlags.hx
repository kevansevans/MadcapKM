package enums;

/**
 * @author Kaelan
 */
enum abstract TerFlags(Int) from Int to Int 
{
	var SOLID:Int = 1;
	var ICE:Int = 1 << 1;
	var MUD:Int = 1 << 2;
	var WATER:Int = 1 << 3;
	var LAVA:Int = 1 << 4;
	var PUSHY:Int = 1 << 5;
	var PUSHON:Int = 1 << 6;
	var ANIM:Int = 1 << 7;
	var STEP:Int = 1 << 8;
	var DESTRUCT:Int = 1 << 9;
	var TRANS:Int = 1 << 10;
}