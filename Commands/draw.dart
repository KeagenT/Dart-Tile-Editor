import '../Models/grid.dart';
import '../Models/tile.dart';
import '../Types/position.dart';
import 'command.dart';
import 'bitmask.dart';
import 'setTile.dart';

// This command is used to draw a tile on the grid with the setTile command
// and then update the bitmasks of the surrounding tiles with the UpdateTileBitmasksCommand
class DrawCommand extends Command {
  final TileGrid grid;
  Tile tile;
  final Position coordinates;
  late SetTileCommand setTileCommand;
  late UpdateTileBitmasksCommand updateTileBitmasksCommand;
  DrawCommand(this.grid, this.tile, this.coordinates);

  @override
  void execute() {
    this.setTileCommand =
        SetTileCommand(this.grid, this.tile, this.coordinates);
    this.setTileCommand.execute();
    this.updateTileBitmasksCommand =
        UpdateTileBitmasksCommand(this.grid, this.coordinates);
    this.updateTileBitmasksCommand.execute();
  }

  @override
  void undo() {
    this.updateTileBitmasksCommand.undo();
    this.setTileCommand.undo();
  }
}
