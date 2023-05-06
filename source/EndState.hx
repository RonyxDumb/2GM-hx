package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * autore@ Francesco Pio Pipino
 * Non è altro che la fine!
 */
class EndState extends FlxState
{
	var end:FlxSprite;
	var dai:FlxText;

	override function create()
	{
		trace("il primo prototipo terminato il 9 02 2023");

		// FlxG.sound.playMusic(Paths.music("end"), 0.70);

		end = new FlxSprite(Paths.image("end"));
		end.screenCenter();
		add(end);

		dai = new FlxText(1000, FlxG.height - 190, "Clicca R per ricominciare", 40);
		dai.setFormat("Bronx", 20, FlxColor.WHITE);
		add(dai);

		new FlxTimer().start(4, function(tmr:FlxTimer)
		{
			FlxG.sound.play(Paths.sound('thank_END'));
		});

		super.create();
	}

	override function update(elpased:Float)
	{
		// ormai è finita lol (P.S non è vero puoi sempre ricominciare)
		if (FlxG.keys.justPressed.R)
		{
			FlxG.sound.music.stop();
			FlxG.switchState(new Diapositiva1());
		}

		super.update(elpased);
	}
}
