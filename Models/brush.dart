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
    drawCommands
        .execute(DrawCommand(this.grid, this.currentTile.clone(), position));
  }

  void undo() {
    drawCommands.undo();
  }

  void updateCurrentPaint(Tile tile) {
    this.currentTile = tile;
  }
}
