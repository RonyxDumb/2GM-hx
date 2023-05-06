package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * @autore Francesco Pio Pipino
 * La Diapositiva 1
 */
class Diapositiva1 extends FlxState
{
	var inizio:FlxSprite;
	var dai:FlxText;
	var versionShit:FlxText;

	override function create()
	{
		FlxG.sound.playMusic(Paths.music("home"));

		inizio = new FlxSprite(Paths.image("inizio"));
		inizio.screenCenter();
		add(inizio);

		dai = new FlxText(5, FlxG.height - 40, "Clicca Invio per continuare", 12);
		dai.setFormat("Bronx", 20, FlxColor.WHITE);
		add(dai);

		super.create();
	}

	override function update(elpased:Float)
	{
		if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE)
		{
			FlxG.switchState(new Diapositiva2());
		}
		super.update(elpased);
	}
}
