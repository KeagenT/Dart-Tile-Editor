import 'dart:collection';
import 'dart:html';
import '../Models/grid.dart';
import '../Models/tile.dart';
import '../Types/position.dart';

const int HOLE_TILE_STARTING_BITMASK = 16;
const int NORTH_BIT = 0;

/// Calculates the bitmask for a given [Tile] at [Position] [coordinates] in [TileGrid] [grid].
///
/// Returns an [int] representing the bitmask calculated from the [Tile] and its surrounding tiles' [collision] property.
int calcBitmask(TileGrid grid, Position coordinates) {
  int bitmask = 0;
  Tile tile = grid.get(coordinates) as Tile;
  if (tile is GrassTile) {
    bitmask = calcGrassBitmask(grid, tile, coordinates);
  }
  if (tile is HoleTile) {
    bitmask = calcHoleBitmask(grid, tile, coordinates);
  }
  return bitmask;
}

int calcGrassBitmask(TileGrid grid, Tile tile, Position coordinates) {
  int bitmask = 0;
  int bit = 0;
  coordinates.surrounding.forEach((Position direction) {
    if (grid.contains(direction)) {
      Tile directionalTile = grid.get(direction) as Tile;
      if (!directionalTile.collision) {
        bitmask |= 1 << bit;
      }
    }
    bit++;
  });
  return bitmask;
}

int calcHoleBitmask(TileGrid grid, Tile tile, Position coordinates) {
  int bitmask = HOLE_TILE_STARTING_BITMASK;
  if (grid.contains(coordinates.north)) {
    Tile northTile = grid.get(coordinates.north) as Tile;
    if (!northTile.collision) {
      bitmask |= 1 << NORTH_BIT;
    }
  }
  return bitmask;
}
