package enums;

/**
 * @author Kaelan
 */
enum abstract MapFlag(Int) from Int to Int 
{
	var SNOWING:Int = 1;
	var MANYITEMS:Int = 1 << 1;
	var SECRET:Int = 1 << 2;
	var TORCHLIT:Int = 1 << 3;
}