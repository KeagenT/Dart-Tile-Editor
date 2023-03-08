import '../Types/position.dart';
import '../Utilities/bitmask.dart';
import '../Models/grid.dart';
import '../Models/tile.dart';

abstract class Command {
  void execute();
  void undo();
}

class CommandManager {
  List<Command> commands = [];
  void execute(Command command) {
    commands.add(command);
    command.execute();
  }

  void undo() {
    if (commands.isNotEmpty) {
      Command toUndo = commands.removeLast();
      toUndo.undo();
    }
  }

  Command? peek() {
    if (commands.isNotEmpty) {
      return commands.last;
    }
    return null;
  }
}
