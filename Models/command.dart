import '../Types/position.dart';
import 'grid.dart';
import 'tile.dart';

abstract class Command {
  void execute();
  void undo();
}

class SetTileCommand extends Command {
  TileGrid grid = TileGrid(10, 10);
  Tile tile = Tile();
  Position position = Position(0, 0);

  Tile previousTile = Tile();

  SetTileCommand(TileGrid grid, Tile tile, Position position) {
    this.grid = grid;
    this.tile = tile;
    this.position = position;
  }

  @override
  void execute() {
    this.previousTile = grid.get(this.position)!;
    grid.set(this.position, this.tile);
  }

  @override
  void undo() {
    grid.set(this.position, this.previousTile);
  }
}
