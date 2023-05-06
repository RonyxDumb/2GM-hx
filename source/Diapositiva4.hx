package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * autore@ Francesco Pio Pipino
 * La Diapositiva 4
 */
class Diapositiva4 extends FlxState
{
	var come:FlxSprite;
	var hoy:FlxText;

	override function create()
	{
		trace("appena arrivata guys....");
		// musichetta trololol
		FlxG.sound.playMusic(Paths.music("horror"));

		come = new FlxSprite(Paths.image("sas"));
		come.screenCenter();
		add(come);

		hoy = new FlxText(5, FlxG.height - 18, "Clicca Invio per continuare", 12);
		hoy.setFormat("Bronx", 20, FlxColor.WHITE);
		add(hoy);

		super.create();
	}

	override function update(elpased:Float)
	{
		if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE)
		{
			FlxG.sound.music.stop();
			trace("salutami la prossima diapositiva");
			FlxG.switchState(new Diapositiva5());
		}

		super.update(elpased);
	}
}
