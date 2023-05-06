package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * autore@ Francesco Pio Pipino
 * La 3 diapositiva
 */
class Diapositiva3 extends FlxState
{
	var polonia:FlxSprite;
	var hoy:FlxText;

	override function create()
	{
		polonia = new FlxSprite(Paths.image("polonia_povera"));
		polonia.screenCenter();
		add(polonia);

		hoy = new FlxText(5, FlxG.height - 18, "Clicca Invio per continuare", 12);
		hoy.setFormat("Bronx", 20, FlxColor.WHITE);
		add(hoy);

		super.create();
	}

	override function update(elpased:Float)
	{
		if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE)
		{
			FlxG.switchState(new Diapositiva4());
			FlxG.log.add("DEBUG");
		}
		super.update(elpased);
	}
}
