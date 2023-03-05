// import 'dart:html';
// import 'dart:async';

import 'Commands/draw.dart';
import 'Models/grid.dart';
import 'Models/tile.dart';
import 'Types/position.dart';
import 'Utilities/bitmask.dart';

const GRID_HEIGHT = 10;
const GRID_WIDTH = 10;

const SOURCE_TILE_PIXEL_SIZE = 16;
const CANVAS_TILE_PIXEL_SIZE = 32;
const CANVAS_WIDTH = 10 * CANVAS_TILE_PIXEL_SIZE;
const CANVAS_HEIGHT = 10 * CANVAS_TILE_PIXEL_SIZE;

// CanvasElement? canvas;
// CanvasRenderingContext2D? ctx;
// const tilemapSrc = './Media/dungeon_tilemap.png';

// ImageElement tilemapImage = ImageElement();
TileGrid tileGrid = TileGrid(4, 4, fillValue: HoleTile());

void main() {
  //canvas = querySelector('#canvas') as CanvasElement;
  //ctx = canvas!.getContext('2d') as CanvasRenderingContext2D;
  //tilemapImage.src = tilemapSrc;
  // new DrawCommand(tileGrid, GroundTile(), Position(1, 0)).execute();
  // new DrawCommand(tileGrid, GroundTile(), Position(0, 1)).execute();
  print('initial tile grid');
  print(tileGrid);
  new DrawCommand(tileGrid, GroundTile(), Position(0, 0)).execute();
  new DrawCommand(tileGrid, GroundTile(), Position(0, 1)).execute();
  new DrawCommand(tileGrid, GroundTile(), Position(1, 0)).execute();
  new DrawCommand(tileGrid, GroundTile(), Position(1, 1)).execute();
  print('after corner drawing');
  print(tileGrid);
}

// void clear({color = 'black'}) {
//   ctx!
//     ..fillStyle = color
//     ..fillRect(0, 0, canvas!.width as int, canvas!.height as int);
// }

// void drawTile(int bitmask, Position coordinates, int sourceTileSize,
//     int destinationTileSize) {
//   Position tilemapPosition =
//       convertBitmaskToFilePosition(bitmask, sourceTileSize);
//   ctx!.drawImageScaledFromSource(
//     tilemapImage,
//     tilemapPosition.x * sourceTileSize,
//     tilemapPosition.y * sourceTileSize,
//     sourceTileSize,
//     sourceTileSize,
//     coordinates.x * destinationTileSize,
//     coordinates.y * destinationTileSize,
//     destinationTileSize,
//     destinationTileSize,
//   );
// }

// void drawGrid() {
//   for (int y = 0; y < tileGrid.height; y++) {
//     for (int x = 0; x < tileGrid.width; x++) {
//       Position coordinates = Position(x, y);
//       int bitmask = tileGrid.get(coordinates)!.bitmask;
//       drawTile(
//           bitmask, coordinates, SOURCE_TILE_PIXEL_SIZE, CANVAS_TILE_PIXEL_SIZE);
//     }
//   }
// }

// void render() {
//   clear();
//   drawGrid();
// }
