import '../Types/position.dart';

class Tile {
  int size = 0;
  bool collision = false;
  int bitmask = 0;

  Tile({size = 0, collision = false, bitmask = 0}) {
    this.size = size;
    this.collision = collision;
    this.bitmask = bitmask;
  }
}

class GroundTile extends Tile {
  GroundTile({int size = 0, bool collision = false, int bitmask = 0})
      : super(size: size, collision: collision, bitmask: bitmask);
}

class HoleTile extends Tile {
  HoleTile({int size = 0, bool collision = true, int bitmask = 16})
      : super(size: size, collision: collision, bitmask: bitmask);
}
