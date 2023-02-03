import '../Types/position.dart';

class Tile {
  int size = 0;
  bool collision = false;
  int bitmask = 0;
  Position position = Position(0, 0);

  Tile(
      {size = 0,
      collision = false,
      bitmask = 0,
      position = const Position(0, 0)}) {
    this.size = size;
    this.collision = collision;
    this.bitmask = bitmask;
    this.position = position;
  }
}

class GrassTile extends Tile {
  GrassTile(
      {int size = 0,
      bool collision = false,
      int bitmask = 0,
      Position position = const Position(0, 0)})
      : super(
            size: size,
            collision: collision,
            bitmask: bitmask,
            position: position);
}

class HoleTile extends Tile {
  HoleTile(
      {int size = 0,
      bool collision = true,
      int bitmask = 16,
      Position position = const Position(0, 0)})
      : super(
            size: size,
            collision: collision,
            bitmask: bitmask,
            position: position);
}
