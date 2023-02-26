import '../Models/grid.dart';
import '../Models/tile.dart';
import '../Types/position.dart';
import '../Utilities/bitmask.dart';
import 'command.dart';

class updateTileBitmaskCommand extends Command {
  TileGrid grid = TileGrid(10, 10);
  Position coordinates = Position(0, 0);
  int previousBitmask = 0;

  updateTileBitmaskCommand(this.grid, this.coordinates);

  void execute() {
    Tile tileToUpdate = grid.get(coordinates) as Tile;
    this.previousBitmask = tileToUpdate.bitmask;
    tileToUpdate.bitmask = calcBitmask(grid, coordinates);
    grid.set(this.coordinates, tileToUpdate);
  }

  void undo() {
    Tile tileToUpdate = grid.get(coordinates) as Tile;
    tileToUpdate.bitmask = this.previousBitmask;
    grid.set(this.coordinates, tileToUpdate);
  }
}
