package ;

import h2d.Scene;

import actors.Items;
import actors.Monster;
import enums.ModeInit;
import graphics.Interface;
import graphics.Shop;
import ham.Control;
import levels.World;
import math.Cossin;
import graphics.Tile;
import actors.Player;

/**
 * ...
 * @author Kaelan
 */
class Game 
{
	public static var curWorld:World;
	
	static var gamemgl:Scene;
	
	static var battle:Bool;
	
	public static function LunaticInit(_mgl:Scene)
	{
		gamemgl = _mgl;
		
		Option.Init();
		Cossin.Init();
		
		//Items that need heaps
		//InitDisplay
		//InitSound
		
		Monster.init();
		Tile.Init();
		Items.Init();
		Interface.Init();
		Control.Init();
		Player.Init(ModeInit.game, 0, 0);
		Shop.Init();
		
		battle = false;
	}
	
	public static function LunaticGame(_mgl:Scene, _load:Bool)
	{
		
	}
	
}