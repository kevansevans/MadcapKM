package actors;

import enums.ModeInit;
import enums.MapFlag;
import enums.Weapon;
import levels.World;

/**
 * ...
 * @author Kaelan
 */
class Player
{

	public static inline var FIXAMT:Int = 65536;

	public static inline var HAMMER_MIN_SPEED:Int = 12;

	public static var player:Player;
	public static var playerGlow:Int;
	public static var tportclock:Int;
	public static var armageddon:Int;
	public static var compassBigClock:Int;
	public static var vampyClock:Int;
	public static var compassClock:Int;
	public static var beenReborn:Int;
	public static var fairyReload:Int;
	public static var challengeCrystals:Int;

	public static function Init(_initWhat:Int, _world:Int, _level:Int)
	{
		player = new Player();

		beenReborn = 0;
		vampyClock = 0;
		fairyReload = 0;
		compassClock = 0;
		compassBigClock = 0;

		if (_initWhat == ModeInit.game)
		{
			player.vaultOpened = 0;
			player.curSpell = 0;
			player.nightmare = 0;
			player.powerStones = 0;
			player.spellStones = 0;
			player.gotSpell = new Array();
			for (i in 0...20)
			{
				player.gotSpell[i] = 0;
			}
			player.score = 0;
			player.musicSetting = 2;
			player.level = 1;
			player.experience = 0;
			player.keychain = new Array();
			for (i in 0...4)
			{
				player.keychain[i] = false;
			}
			player.levelPassed = new Array();
			player.totalCompletion = new Array();
			player.complete = new Array();
			player.lunacyKey = new Array();
			for (i in 0...6)
			{
				player.levelPassed[i] = new Array();
				for (j in 0...World.MAX_MAPS)
				{
					player.levelPassed[i][j] = false;
				}
				player.totalCompletion[i] = 100;
				player.complete[i] = 0;
				player.lunacyKey[i] = 0;
			}
			player.levelsPassed = 0;
			player.spells = new Array();
			for (i in 0...10)
			{
				player.spells[i] = 0;
			}
			player.boots = 0;
			player.hat = 0;
			player.staff = 0;
			player.money = 0;
			player.maxSpeed = FIXAMT * 4;
			player.defense = 0;
			player.damage = 2;
			player.maxLife = 15;
			player.maxMana = 15;
			player.gear = 0;
			player.gameClock = 0;
			player.overworldX = -2000;
			player.rechargeClock = 4;
			player.haveFairy = 0;
			player.fairyOn = 0;
			player.tempPuzzleDone = 0;
			player.chaseFairy = new Array();
			for (i in 0...4)
			{
				player.chaseFairy[i] = 0;
			}
		}

		if (_initWhat == ModeInit.world)
		{
			player.levelsPassed = 0;
			player.worldNum = world;
			for (i in 0...World.MAX_MAPS)
			{
				if (player.levelPassed[world][i] && Game.curWorld.map[i] != null && !(Game.curWorld.map[i].flags & MapFlag.SECRET > 0))
				{
					++player.levelsPassed;
				}
			}
		}

		player.levelNum = _level;
		player.previousScore = player.score;
		player.previousLevel = player.level;
		player.previousEXP = player.experience;
		player.previousScore = player.money;
		player.keys = new Array();
		for (i in 0...4)
		{
			player.keys[i] = 0;
		}
		player.brains = 0;
		player.boredom = 0;
		player.hammers = 0;
		player.hamSpeed = HAMMER_MIN_SPEED;
		player.weapon = Weapon.NONE;
		player.ammo = 0;
		player.reload = 5;
		player.wpnReload = 0;
		player.hammerflags = 0;
		player.life = player.maxLife;
		player.mana = player.maxMana;
		player.shield = 0;
		playerGlow = 0;
		player.pushpower = 0;
		player.poison = 0;
		player.needEXP = player.level * player.level * 10 + player.level * 10;
		player.stoneskin = 0;
		player.berserk = 0;

		SetPlayerSpeed();
		SetPlayerDamage();
		SetPlayerDefense();

		if (PlayerHasSword())
		{
			SetKidSprite(1);
		}
		else
		{
			SetKidSprite(0);
		}
	}

	static function SetPlayerSpeed():Void
	{
		//replace with player.maxSpeed = FIXAMT * (player.boots + 4); ?
		switch (player.boots)
		{
			case 0:
				player.maxSpeed = FIXAMT * 4;
			case 1:
				player.maxSpeed = FIXAMT * 5;
			case 2:
				player.maxSpeed = FIXAMT * 6;
			case 3:
				player.maxSpeed = FIXAMT * 7;
			case 4:
				player.maxSpeed = FIXAMT * 8;
		}
	}

	static function SetPlayerDamage():Void
	{
		//No observable sequence here
		switch (player.staff)
		{
			case 0:
				player.damage = 2;
			case 1:
				player.damage = 3;
			case 2:
				player.damage = 5;
			case 3:
				player.damage = 7;
			case 4:
				player.damage = 10;
		}
	}

	static function SetPlayerDefense():Void
	{
		switch (player.hat)
		{
			case 0:
				player.defense = 0;
			case 1:
				player.defense = 1;
			case 2:
				player.defense = 3;
			case 3:
				player.defense = 5;
			case 4:
				player.defense = 8;
		}
	}
	
	static function PlayerHasSword():Bool 
	{
		return (player.keychain[0] && player.keychain[1] && player.keychain[2] && player.keychain[3]);
	}
	
	static function SetKidSprite(int:Int):Void 
	{
		
	}

	public function new()
	{}

	public var musicSetting:Int;
	public var previousScore:Int;
	public var score:Int;
	public var levelPassed:Array<Array<Bool>>;
	public var keychain:Array<Bool>;
	public var totalCompletion:Array<Int>;
	public var complete:Array<Int>;
	public var customName:String;
	public var lunacyKey:Array<Int>;
	public var previousLevel:Int;
	public var previousEXP:Int;
	public var previousMoney:Int;
	public var level:Int;
	public var experience:Int;
	public var needEXP:Int;
	public var spells:Array<Int>;
	public var boots:Int;
	public var hat:Int;
	public var staff:Int;
	public var money:Int;
	public var maxSpeed:Int;
	public var defense:Int;
	public var damage:Int;
	public var maxLife:Int;
	public var maxMana:Int;
	public var gear:Int;
	public var gameClock:Int;
	public var levelsPassed:Int;
	public var worldNum:Int;
	public var overworldX:Int;
	public var overworldY:Int;
	public var chaseFairy:Array<Int>;
	public var shield:Int;
	public var levelNum:Int;
	public var keys:Array<Int>;
	public var boredom:Int;
	public var hammers:Int;
	public var hamSpeed:Int;
	public var weapon:Weapon;
	public var ammo:Int;
	public var reload:Int;
	public var wpnReload:Int;
	public var life:Int;
	public var mana:Int;
	public var brains:Int;
	public var pushpower:Int;
	public var hammerflags:Int;
	public var poison:Int;
	public var curSpell:Int;
	public var casting:Int;
	public var berserk:Int;
	public var stoneskin:Int;
	public var rechargeClock:Int;
	public var haveFairy:Int;
	public var fairyOn:Int;
	public var tempPuzzleDone:Int;
	public var nightmare:Int;
	public var gotSpell:Array<Int>;
	public var powerStones:Int;
	public var shieldStones:Int;
	public var spellStones:Int;
	public var vaultOpened:Int;
	public var expando:Array<Int>;
}