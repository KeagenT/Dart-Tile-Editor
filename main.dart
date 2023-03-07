import 'dart:html';
import 'dart:async';

import 'Commands/draw.dart';
import 'Models/grid.dart';
import 'Models/tile.dart';
import 'Types/position.dart';
import 'Utilities/bitmask.dart';
import 'Utilities/canvasUtilities.dart';

const GRID_HEIGHT = 10;
const GRID_WIDTH = 10;

const SOURCE_TILE_PIXEL_SIZE = 16;
const SOURCE_TILE_WIDTH = 10;
const CANVAS_TILE_PIXEL_SIZE = 16;
const CANVAS_WIDTH = 10 * CANVAS_TILE_PIXEL_SIZE;
const CANVAS_HEIGHT = 10 * CANVAS_TILE_PIXEL_SIZE;

CanvasElement? canvas;
CanvasRenderingContext2D? ctx;
const tilemapSrc = 'dungeon_tilemap.png';

ImageElement tilemapImage = ImageElement();
TileGrid tileGrid = TileGrid(GRID_HEIGHT, GRID_WIDTH, fillValue: HoleTile());

void main() {
  canvas = querySelector('#canvas') as CanvasElement;
  ctx = canvas!.getContext('2d') as CanvasRenderingContext2D;
  tilemapImage.src = tilemapSrc;
  render();

  canvas?.onMouseDown.listen((event) {
    print(event);
    print(event.offset);
    Position clickedPosition = calculateEventPosition(
        CANVAS_TILE_PIXEL_SIZE, event.offset.x as int, event.offset.y as int);
    new DrawCommand(tileGrid, GroundTile(), clickedPosition).execute();
    render();
  });
}

void clear({color = 'black'}) {
  ctx!
    ..fillStyle = color
    ..fillRect(0, 0, canvas!.width as int, canvas!.height as int);
}

void drawTile(int bitmask, Position coordinates, int sourceTileSize,
    int destinationTileSize) {
  Position tilemapPosition =
      convertBitmaskToFilePosition(bitmask, SOURCE_TILE_WIDTH);
  ctx!.drawImageScaledFromSource(
    tilemapImage,
    tilemapPosition.x * sourceTileSize,
    tilemapPosition.y * sourceTileSize,
    sourceTileSize,
    sourceTileSize,
    coordinates.x * destinationTileSize,
    coordinates.y * destinationTileSize,
    destinationTileSize,
    destinationTileSize,
  );
}

void drawGrid() {
  for (int y = 0; y < tileGrid.height; y++) {
    for (int x = 0; x < tileGrid.width; x++) {
      Position coordinates = Position(x, y);
      int bitmask = tileGrid.get(coordinates)!.bitmask;
      drawTile(
          bitmask, coordinates, SOURCE_TILE_PIXEL_SIZE, CANVAS_TILE_PIXEL_SIZE);
    }
  }
}

void render() {
  clear();
  drawGrid();
}
