import '../Types/position.dart';

const types = {
  'Ground': 'Ground Tile',
  'Hole': 'Hole Tile',
  'Tile': 'Tile',
};

class Tile {
  bool collision = false;
  int bitmask = 0;
  final tileType = types['Tile'];

  Tile({collision = false, bitmask = 0}) {
    this.collision = collision;
    this.bitmask = bitmask;
  }
  //override toString
  String toString() {
    return '($tileType: ${bitmask})';
  }
}

class GroundTile extends Tile {
  final tileType = types['Ground'];
  GroundTile({bool collision = false, int bitmask = 0})
      : super(collision: collision, bitmask: bitmask);
}

class HoleTile extends Tile {
  final tileType = types['Hole'];
  HoleTile({bool collision = true, int bitmask = 16})
      : super(collision: collision, bitmask: bitmask);
}
