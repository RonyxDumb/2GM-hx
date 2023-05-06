package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

/**
 * autore@ Francesco Pio Pipino
 * Il Menu Iniziale
 */
class MenuState extends FlxState
{
	var title:FlxSprite;
	var redGa:FlxSprite;
	var vaiButton:FlxButton;
	var impButton:FlxButton;
	var versionShit:FlxText;

	override function create()
	{
		// musichetta
		FlxG.sound.playMusic(Paths.music("menu_miss_main"), 1, true);
		FlxG.sound.music.fadeIn(2);

		// sfondo rosso
		var redGa = new FlxSprite();
		redGa.makeGraphic(5000, FlxG.height, FlxColor.RED, false);
		redGa.screenCenter();
		add(redGa);

		// versione del Progetto
		var versionShit:FlxText = new FlxText(5, FlxG.height - 18, 0, "(F.P.P) Versione " + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 20, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		versionShit.text += " (Il Continuo)"; // testo apparte lmao

		// titolo
		var title = new FlxText(274, 79, "La 2 Guerra Mondiale");
		title.setFormat("Bronx", 60, FlxColor.WHITE);
		add(title);

		// bottone per andare alla Diapositiva1
		var vaiButton = new FlxButton(123, 483, "Inizia", onClick);
		vaiButton.setGraphicSize(200);
		add(vaiButton);

		// bottone per il codice sorgente
		var impButton = new FlxButton(845.15, 483.76, "Codice Sorgente", sourceClick);
		impButton.setGraphicSize(200);
		add(impButton);

		super.create();
	}

	var transitioning:Bool = false;

	function onClick()
	{
		// transizione
		flash(FlxColor.WHITE, 1);

		// musica addio
		FlxG.sound.music.fadeOut(0.50);

		// transitione
		transitioning = true;

		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			// rimuovi della roba
			remove(redGa);
			remove(title);
			remove(vaiButton);
			remove(impButton);
			remove(versionShit);

			FlxG.switchState(new Diapositiva1());
		});
	}

	function flash(color:FlxColor, duration:Float)
	{
		FlxG.camera.stopFX();
		FlxG.camera.flash(color, duration);
	}

	function sourceClick()
	{
		// Sito per il Codice Sorgente su Github
		FlxG.openURL("https://github.com/RonyxDumb/La-2-Guerra-Mondiale"); // Github
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
