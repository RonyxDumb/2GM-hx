package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * autore@ Francesco Pio Pipino
 * La Diapositiva 2
 */
class Diapositiva2 extends FlxState
{
	var diap:FlxSprite;
	var macchiati:FlxSprite;
	var aiuta:FlxText;

	override function create()
	{
		trace("Hey ciao nella Diapositiva 2");

		diap = new FlxSprite(Paths.image("d1"));
		diap.screenCenter();
		add(diap);

		super.create();
	}

	override function update(elpased:Float)
	{
		if (FlxG.keys.justPressed.G)
		{
			trace("Menu Speciale!");
			visual();
		}

		#if mobile
		FlxG.android.justReleased.[BACK]
		{
			visual();
		}
		#end

		if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE)
		{
			trace("arrivederci dalla Diapositiva 2");
			FlxG.switchState(new Diapositiva3());
		}
		super.update(elpased);
	}

	function visual()
	{
		remove(diap);

		macchiati = new FlxSprite(Paths.image("visual"));
		macchiati.screenCenter();
		add(macchiati);

		aiuta = new FlxText(5, FlxG.height - 18, "Clicca Invio per continuare", 12);
		aiuta.setFormat("Bronx", 20, FlxColor.WHITE);
		add(aiuta);

		trace("hey vedi che cosa carina :)");

		if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE)
		{
			FlxG.switchState(new Diapositiva2());
		}
	}
}
