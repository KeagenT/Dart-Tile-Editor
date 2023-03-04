import '../Models/grid.dart';
import '../Models/tile.dart';
import '../Types/position.dart';
import 'command.dart';

class SetTileCommand extends Command {
  final TileGrid grid;
  final Tile tile;
  final Position coordinates;

  late Tile previousTile;

  SetTileCommand(this.grid, this.tile, this.coordinates);

  @override
  void execute() {
    this.previousTile = this.grid.get(this.coordinates)!;
    this.grid.set(this.coordinates, this.tile);
    print('Calling setTileCommand.execute()');
  }

  @override
  void undo() {
    grid.set(this.coordinates, this.previousTile);
  }
}
