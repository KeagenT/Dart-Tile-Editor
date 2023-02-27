import '../Models/grid.dart';
import '../Models/tile.dart';
import '../Types/position.dart';
import 'command.dart';
import 'bitmask.dart';
import 'setTile.dart';

// This command is used to draw a tile on the grid with the setTile command
// and then update the bitmasks of the surrounding tiles with the UpdateTileBitmasksCommand
class DrawCommand extends Command {
  TileGrid grid = TileGrid(10, 10);
  Tile tile = Tile();
  Position coordinates = Position(0, 0);
  SetTileCommand setTileCommand =
      SetTileCommand(TileGrid(10, 10), Tile(), Position(0, 0));
  UpdateTileBitmasksCommand updateTileBitmasksCommand =
      UpdateTileBitmasksCommand(TileGrid(10, 10), Position(0, 0));
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
