package;

import js.Browser;
import resources.SoundDef;
import js.html.AudioElement;

@:initPackage
class SoundManager {

	private var s:Map<String, AudioElement>;
	public var v(default, default):Float;

	public function new(soundDefList:Array<SoundDef>) {
		s = new Map<String, AudioElement>();
		v = 1;

		for (sd in soundDefList) {
			var url:String = untyped jsfxr(sd.d);

			var e:AudioElement = Browser.document.createAudioElement();
			e.src = url;
			s.set(sd.n, e);
		}
	}

	public function play(n:String, g:Float = 1):Void {
		s[n].currentTime = 0;
		s[n].volume = v * g;
		s[n].play();
	}

	private static function __init__(){
		haxe.macro.Compiler.includeFile("res/jsfxr.js");
	}
}