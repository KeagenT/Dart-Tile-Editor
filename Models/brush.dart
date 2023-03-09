import '../Commands/command.dart';
import '../Commands/draw.dart';
import '../Types/position.dart';
import 'grid.dart';
import 'tile.dart';

abstract class Brush<T> {
  draw(Position position);
  updateCurrentPaint(T paint);
}

class TileBrush extends Brush<Tile> {
  Tile currentTile;
  final TileGrid grid;
  CommandManager drawCommands = CommandManager();

  TileBrush(this.grid, this.currentTile);

  void draw(Position position) {
    DrawCommand drawCommand =
        DrawCommand(this.grid, this.currentTile.clone(), position);
    if (drawCommands.peek() != drawCommand) {
      drawCommands.execute(drawCommand);
    }
  }

  void undo() {
    drawCommands.undo();
  }

  void updateCurrentPaint(Tile tile) {
    this.currentTile = tile;
  }
}

class BrushDrawStateManager {
  final TileBrush brush;
  bool drawing = false;
  BrushDrawStateManager(this.brush);
  void tryDraw(Position position) {
    if (!brush.grid.contains(position)) {
      this.stopDrawing();
    }
    if (drawing) {
      brush.draw(position);
    }
  }

  void startDrawing() {
    drawing = true;
  }

  void stopDrawing() {
    drawing = false;
  }

  void undo() {
    brush.undo();
  }

  void updateCurrentPaint(Tile tile) {
    brush.updateCurrentPaint(tile);
  }
}
