import 'dart:math';
import '../Models/tile.dart';
import '../Types/position.dart';
import '../Utilities/bitmask.dart';

class Grid<T> {
  late List<List<T>> _grid;
  final int height;
  final int width;

  Grid(this.height, this.width, {required T Function() fillValue}) {
    _grid =
        List.generate(height, (i) => List.generate(width, (i) => fillValue()));
  }

  T? get(Position p) => _grid[p.y][p.x];

  void set(Position p, T value) {
    _grid[p.y][p.x] = value;
  }

  List<List<T>> grid() {
    return this._grid;
  }

  bool contains(Position p) {
    if (p.x > this.width - 1 || p.x < 0) {
      return false;
    }
    if (p.y > this.height - 1 || p.y < 0) {
      return false;
    }
    return true;
  }
}

class TileGrid extends Grid<Tile> {
  TileGrid(height, width, {required Tile fillValue})
      : super(height, width, fillValue: () => new HoleTile()) {}

  Position getTileBitmaskToDraw(Position coordinates, int tileSheetTileWidth) {
    int tileBitmask = this.get(coordinates)!.bitmask;
    return convertBitmaskToFilePosition(tileBitmask, tileSheetTileWidth);
  }

  String toString() {
    String output = '';
    for (int row = 0; row < this.height; row++) {
      output += _grid[row].toString() + '\n';
    }
    return output;
  }
}
