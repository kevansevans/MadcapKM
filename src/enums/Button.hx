package enums;

/**
 * @author Kaelan
 */
enum abstract Button(Int) from Int to Int
{
	var UP:Int = 1;
	var DN:Int = 1 << 1;
	var LF:Int = 1 << 2;
	var RT:Int = 1 << 3;
	var B1:Int = 1 << 4;
	var B2:Int = 1 << 5;
	var B3:Int = 1 << 6;
	var B4:Int = 1 << 7;
}