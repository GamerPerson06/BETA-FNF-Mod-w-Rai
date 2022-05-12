package;

import flixel.math.FlxRandom;
import flixel.addons.effects.FlxSkewedSprite;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
#if polymod
import polymod.format.ParseRules.TargetSignatureElement;
#end
import PlayState;

using StringTools;

class Fireball extends FlxSprite
{
    public var animOffsets:Map<String, Array<Dynamic>>;
    public var targetIndex:Int;
    public var stillAlive:Bool = true;

    public function new(xPos:Float, yPos:Float)
    {
        super();

        x = xPos;
        y = yPos;

        frames = Paths.getSparrowAtlas('fireball');
        animation.add('idle', [0, 1, 2, 3, 4, 5]);

        setGraphicSize(Std.int(100));
        updateHitbox();

        scrollFactor.set();

        var random:FlxRandom = new FlxRandom();
        targetIndex = random.int(0, 3);

		antialiasing = true;
        animation.play('idle');
    }

    override function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

    public function addOffset(name:String, x:Float = 0, y:Float = 0)
    {
        animOffsets[name] = [x, y];
    }
}