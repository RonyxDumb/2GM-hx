package;

import flixel.FlxGame;
import openfl.display.FPS;
import openfl.display.Sprite;

class Main extends Sprite
{
	var skipSplash:Bool = true;

	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, IntroState, skipSplash)); // Con cosa inizia
		addChild(new FPS(10, 10, 0xffffff)); // FPS
	}
}
