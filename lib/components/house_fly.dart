import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:langaw/components/fly.dart';
import 'package:langaw/langaw_game.dart';

class HouseFly extends Fly {
  HouseFly(Langaw game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize! * 1.5, game.tileSize! * 1.5);
    flyingSprite = [];
    flyingSprite.add(Sprite('flies/house-fly-1.png'));
    flyingSprite.add(Sprite('flies/house-fly-2.png'));
    deadSprite = Sprite('flies/house-fly-dead.png');
  }
}
