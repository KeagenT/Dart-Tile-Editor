import '../Models/grid.dart';
import '../Models/tile.dart';
import '../Types/position.dart';
import 'command.dart';

class SetTileCommand extends Command {
  TileGrid grid = TileGrid(10, 10);
  Tile tile = Tile();
  Position coordinates = Position(0, 0);

  Tile previousTile = Tile();

  SetTileCommand(TileGrid grid, Tile tile, Position coordinates) {
    this.grid = grid;
    this.tile = tile;
    this.coordinates = coordinates;
  }

  @override
  void execute() {
    this.previousTile = grid.get(this.coordinates)!;
    grid.set(this.coordinates, this.tile);
  }

  @override
  void undo() {
    grid.set(this.coordinates, this.previousTile);
  }
}
