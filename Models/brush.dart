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
  Tile currentTile = Tile();
  TileGrid grid = TileGrid(10, 10);
  CommandManager drawCommands = CommandManager();

  void draw(Position position) {
    drawCommands.execute(DrawCommand(this.grid, this.currentTile, position));
  }

  void undo() {
    drawCommands.undo();
  }

  void updateCurrentPaint(Tile tile) {
    this.currentTile = tile;
  }
}
