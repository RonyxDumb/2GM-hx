package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * autore@ Francesco Pio Pipino
 * la 5 Diapositiva
 */
class Diapositiva5 extends FlxState
{
	var sudd:FlxSprite;
	var hoy:FlxText;

	override function create()
	{
		trace("Le suddivisioni");

		FlxG.sound.playMusic(Paths.music("home"));

		sudd = new FlxSprite(Paths.image("suddivisione"));
		sudd.screenCenter();
		add(sudd);

		hoy = new FlxText(5, FlxG.height - 18, "Clicca Invio per continuare", 12);
		hoy.setFormat("Bronx", 20, FlxColor.WHITE);
		add(hoy);

		super.create();
	}

	override function update(elpased:Float)
	{
		if (FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.ENTER)
		{
			trace("a breve...");
			FlxG.sound.music.stop();
			FlxG.switchState(new EndState());
		}
		super.update(elpased);
	}
}
