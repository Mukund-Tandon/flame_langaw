import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:langaw/components/fly.dart';

import 'components/agile_fly.dart';
import 'components/background.dart';
import 'components/drooler_fly.dart';
import 'components/house_fly.dart';
import 'components/hungry_fly.dart';
import 'components/macho_fly.dart';

class Langaw extends Game {
  Size? screenSize;
  double? tileSize;
  List<Fly> flies = [];
  Random? rnd;
  Backyard? background;
  Langaw() {
    print('contruct');
    initialize();
  }

  void initialize() async {
    print('init');
    rnd = Random();
    resize(await Flame.util.initialDimensions());

    background = Backyard(this);
    spawnFly();
  }

  @override
  void render(Canvas canvas) {
    background!.render(canvas);

    for (var fly in flies) {
      fly.render(canvas);
    }
  }

  @override
  void update(double t) {
    // TODO: implement update
    if (flies.isEmpty == false) {
      for (var fly in flies) {
        fly.update(t);
      }
    }
    flies.removeWhere((Fly fly) => fly.isOffScreen);
  }

  @override
  void resize(Size size) {
    // TODO: implement resize
    screenSize = size;
    tileSize = screenSize!.width / 9;
    super.resize(size);
  }

  void spawnFly() {
    print('spawn');
    double x = rnd!.nextDouble() * (screenSize!.width - tileSize!);
    double y = rnd!.nextDouble() * (screenSize!.height - tileSize!);

    switch (rnd!.nextInt(5)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(DroolerFly(this, x, y));
        break;
      case 2:
        flies.add(AgileFly(this, x, y));
        break;
      case 3:
        flies.add(MachoFly(this, x, y));
        break;
      case 4:
        flies.add(HungryFly(this, x, y));
        break;
    }
  }

  void onTapDown(TapDownDetails d) {
    for (var fly in flies) {
      if (fly.flyRect.contains(d.globalPosition)) {
        fly.onTapDown();
      }
    }
  }
}
