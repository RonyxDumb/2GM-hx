package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxTimer;

/**
 * autore@ Francesco Pio Pipino
 * intro spaventosa per voler intendere che la guerra è brutta >:()
 */
class IntroState extends FlxState
{
	override function create()
	{
		super.create();

		// timer iniziale
		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			// leggi tutti i suoni
			FlxG.sound.cacheAll(); // dare all'animazione il tempo di leggere a tempo giusto
			intro();
		});
	}

	var intro2:FlxSprite;

	function intro()
	{
		// Suono spaventoso
		FlxG.sound.playMusic(AssetPaths.haxeIntro__ogg);

		// inizio abbastanza spaventoso
		var intro2 = new FlxSprite(517.92, 339.32);
		intro2.screenCenter();
		intro2.frames = Paths.getSparrowAtlas('intro/Senza nome-2');
		/*intro2.animation.appendByIndices('haxeIntro_', 'haxeIntro_', [
				0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38,
				39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74,
				75, 76, 77, 78, 79, 80, 81, 82, 83, 64, 85, 86, 87
			], ""); */
		intro2.animation.addByPrefix('haxeIntro_', "haxeIntro_", 10, false, false, false);
		intro2.animation.play('haxeIntro_', false, false, 10);
		add(intro2);

		new FlxTimer().start(8, function(tmr:FlxTimer)
		{
			// abbandona lo state
			trace('intro finita!');
			abbandonaState();
		});
	}

	function abbandonaState()
	{
		FlxG.switchState(new MenuState());
	}

	override function update(elpased:Float)
	{
		if (FlxG.keys.justPressed.F)
		{
			FlxG.fullscreen = true; // il gioco entra in modalità schermo-intero

			if (FlxG.keys.justPressed.ESCAPE || FlxG.keys.justPressed.BACKSPACE)
			{
				FlxG.fullscreen = false; // esci dalla modalità schermo-intero
			}
		}

		super.update(elpased);
	}
}
