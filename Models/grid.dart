import 'dart:math';
import '../Models/tile.dart';
import '../Types/position.dart';

class Grid<T> {
  List<List<T>> _grid = [];
  int height = 0;
  int width = 0;

  Grid(int height, int width) {
    height = height;
    width = width;
    _grid =
        List.generate(height, (i) => List.generate(width, (i) => null as T));
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
  TileGrid(int height, int width) : super(height, width) {
    _grid =
        List.generate(height, (y) => List.generate(width, (x) => HoleTile()));
  }
}
