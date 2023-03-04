import '../Models/grid.dart';
import '../Models/tile.dart';
import '../Types/position.dart';
import '../Utilities/bitmask.dart';
import 'command.dart';

// This command is used to update the bitmask of a tile at a position
// on the grid, based on the surrounding tiles
class UpdateTileBitmaskCommand extends Command {
  final TileGrid grid;
  final Position coordinates;
  int previousBitmask = 0;

  UpdateTileBitmaskCommand(this.grid, this.coordinates);

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

// This command is used to update the bitmasks of all surrounding tiles
// and a center tile, when one tile is placed on the grid.
class UpdateTileBitmasksCommand extends Command {
  final TileGrid grid;
  final Position coordinates;
  List<UpdateTileBitmaskCommand> updateTileBitmaskCommands = [];

  UpdateTileBitmasksCommand(this.grid, this.coordinates);

  // checks the surrounding positions of the tile for validity and adds an UpdateTileBitmaskCommand for each valid tile
  void execute() {
    this
        .updateTileBitmaskCommands
        .add(UpdateTileBitmaskCommand(this.grid, this.coordinates));
    coordinates.surrounding.forEach((Position direction) {
      if (grid.contains(direction)) {
        updateTileBitmaskCommands
            .add(UpdateTileBitmaskCommand(this.grid, direction));
      }
    });
    this.updateTileBitmaskCommands.forEach((UpdateTileBitmaskCommand command) {
      command.execute();
    });
  }

  void undo() {
    this.updateTileBitmaskCommands.forEach((UpdateTileBitmaskCommand command) {
      command.undo();
    });
  }
}
